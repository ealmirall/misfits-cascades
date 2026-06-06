using CairoMakie
using CSV
using DataFrames
using Dates
using Misfits
using Printf
using ProgressMeter
using Random
using Statistics

const REVISION_OUTPUT_ROOT = joinpath(dirname(dirname(@__FILE__)), "outputs")
const PUB_NAVY = RGBf(31 / 255, 78 / 255, 121 / 255)
const PUB_ORANGE = RGBf(224 / 255, 123 / 255, 39 / 255)
const PUB_GREEN = RGBf(46 / 255, 139 / 255, 87 / 255)
const PUB_CRIMSON = RGBf(192 / 255, 57 / 255, 43 / 255)
const PUB_GREY = RGBf(127 / 255, 140 / 255, 141 / 255)

function revision_mode_settings(args=ARGS)
    smoke = "--smoke" in args || "--quick" in args
    seed = 20260603
    seed_idx = findfirst(==("--seed"), args)
    if seed_idx !== nothing && seed_idx < length(args)
        seed = parse(Int, args[seed_idx + 1])
    end
    base = smoke ? quick_settings() : full_settings()
    settings = merge(base, (
        N = smoke ? 250 : 1000,
        path_samples = smoke ? 20 : 40,
        hazard_match_reps = 0,
        n_coarse = smoke ? 5 : base.n_coarse,
        n_refine = smoke ? 5 : base.n_refine,
        n_focal = smoke ? 5 : base.n_focal,
    ))
    return (smoke=smoke, seed=seed, settings=settings, mode=smoke ? "smoke" : "production")
end

function ensure_revision_dir(name::AbstractString)
    dir = joinpath(REVISION_OUTPUT_ROOT, name)
    mkpath(dir)
    return dir
end

function git_commit_hash()
    try
        return readchomp(pipeline(`git rev-parse HEAD`; stderr=devnull))
    catch
        return "unavailable"
    end
end

function command_string()
    return join([PROGRAM_FILE; ARGS], " ")
end

function json_escape(s::AbstractString)
    return replace(s, "\\" => "\\\\", "\"" => "\\\"")
end

function json_scalar(x)
    x === missing && return "null"
    x isa Symbol && return "\"" * string(x) * "\""
    x isa AbstractString && return "\"" * json_escape(x) * "\""
    x isa Bool && return x ? "true" : "false"
    x isa Integer && return string(x)
    x isa AbstractFloat && return isfinite(x) ? string(x) : "null"
    x isa NamedTuple && return "{" * join(["\"" * string(k) * "\":" * json_scalar(getproperty(x, k)) for k in keys(x)], ",") * "}"
    x isa AbstractDict && return "{" * join(["\"" * string(k) * "\":" * json_scalar(v) for (k, v) in x], ",") * "}"
    x isa AbstractVector && return "[" * join(json_scalar.(x), ",") * "]"
    return "\"" * json_escape(string(x)) * "\""
end

function write_revision_metadata(path::AbstractString, experiment::AbstractString, settings, seed, cells; extra=Dict{String,Any}())
    open(path, "w") do io
        println(io, "{")
        println(io, "  \"experiment\": ", json_scalar(experiment), ",")
        println(io, "  \"generated_at\": ", json_scalar(string(now())), ",")
        println(io, "  \"git_commit\": ", json_scalar(git_commit_hash()), ",")
        println(io, "  \"command\": ", json_scalar(command_string()), ",")
        println(io, "  \"master_seed\": ", seed, ",")
        println(io, "  \"julia_version\": ", json_scalar(string(VERSION)), ",")
        println(io, "  \"package_versions\": ", Misfits.package_versions_json(), ",")
        println(io, "  \"settings\": ", json_scalar(settings), ",")
        println(io, "  \"extra\": ", json_scalar(extra), ",")
        println(io, "  \"cells\": ", json_scalar(collect(cells)))
        println(io, "}")
    end
end

function quantile_or_missing(x, q)
    vals = collect(skipmissing(x))
    isempty(vals) && return missing
    return quantile(vals, q)
end

function median_or_missing(x)
    vals = collect(skipmissing(x))
    isempty(vals) && return missing
    return median(vals)
end

function summarize_revision_runs(df::DataFrame, groupcols::Vector{Symbol})
    grouped = groupby(df, groupcols)
    summary = combine(
        grouped,
        :cascade => mean => :cascade_prob,
        :final_adoption => median => :final_adoption_median,
        :final_adoption => (x -> quantile_or_missing(x, 0.05)) => :final_adoption_p05,
        :final_adoption => (x -> quantile_or_missing(x, 0.95)) => :final_adoption_p95,
        :t10 => median_or_missing => :t10_median,
        :t10 => (x -> quantile_or_missing(x, 0.05)) => :t10_p05,
        :t10 => (x -> quantile_or_missing(x, 0.95)) => :t10_p95,
        :t50 => median_or_missing => :t50_median,
        :t50 => (x -> quantile_or_missing(x, 0.05)) => :t50_p05,
        :t50 => (x -> quantile_or_missing(x, 0.95)) => :t50_p95,
        :t90 => median_or_missing => :t90_median,
        :t90 => (x -> quantile_or_missing(x, 0.05)) => :t90_p05,
        :t90 => (x -> quantile_or_missing(x, 0.95)) => :t90_p95,
        :transition_time => median_or_missing => :transition_time_median,
        :transition_time => (x -> quantile_or_missing(x, 0.05)) => :transition_time_p05,
        :transition_time => (x -> quantile_or_missing(x, 0.95)) => :transition_time_p95,
        :max_slope => median => :max_slope_median,
        :max_slope => (x -> quantile_or_missing(x, 0.05)) => :max_slope_p05,
        :max_slope => (x -> quantile_or_missing(x, 0.95)) => :max_slope_p95,
        nrow => :n_runs,
    )
    lows = Float64[]
    highs = Float64[]
    for row in eachrow(summary)
        low, high = Misfits.wilson_interval(row.cascade_prob, row.n_runs)
        push!(lows, low)
        push!(highs, high)
    end
    summary.cascade_prob_ci_low = lows
    summary.cascade_prob_ci_high = highs
    return summary
end

function markdown_table(df::DataFrame; digits=3, maxrows=nrow(df))
    cols = names(df)
    lines = String[]
    push!(lines, "| " * join(cols, " | ") * " |")
    push!(lines, "|" * join(fill("---", length(cols)), "|") * "|")
    for row in eachrow(first(df, min(maxrows, nrow(df))))
        vals = String[]
        for col in cols
            v = row[col]
            if v === missing
                push!(vals, "missing")
            elseif v isa AbstractFloat
                push!(vals, @sprintf("%.*f", digits, v))
            else
                push!(vals, string(v))
            end
        end
        push!(lines, "| " * join(vals, " | ") * " |")
    end
    return join(lines, "\n")
end

function write_summary_markdown(path::AbstractString, title::AbstractString, summary::DataFrame; notes::AbstractString="")
    open(path, "w") do io
        println(io, "# ", title, "\n")
        isempty(notes) || println(io, notes, "\n")
        println(io, markdown_table(summary))
    end
end

function run_revision_cells(cells::Vector{<:NamedTuple}, reps::Integer, settings, seed::Integer, experiment::AbstractString)
    rows = Dict{Symbol,Any}[]
    seed_rng = MersenneTwister(seed)
    run_index = 0
    @showprogress 1 "revision $experiment" for cell in cells
        for _ in 1:reps
            run_index += 1
            run_seed = rand(seed_rng, 1:typemax(Int32))
            row, _ = Misfits.run_single(cell, run_seed, run_index, "revision", settings, experiment)
            for k in keys(cell)
                if !(k in keys(row)) && !(k in (:threshold_params,))
                    row[k] = getproperty(cell, k)
                end
            end
            row[:requested_reps] = reps
            push!(rows, row)
        end
    end
    return DataFrame(rows)
end

function add_errorbars!(ax, xs, probs, lows, highs; color=:black)
    errorbars!(ax, xs, probs, probs .- lows, highs .- probs; color=color, whiskerwidth=8)
end

function save_revision_figure(fig::Figure, dir::AbstractString, basename::AbstractString)
    save(joinpath(dir, "$basename.png"), fig; px_per_unit=300/96)
    save(joinpath(dir, "$basename.pdf"), fig)
end

function base_revision_cell(settings; beta=0.4, seed_fraction=0.006, pi=0.05, threshold_treatment=:mixture, threshold_params=nothing)
    params = threshold_params === nothing ?
        (threshold_treatment == :mixture ? (theta_mean=settings.theta_mean, pi=pi, theta_low=0.05) : (theta_mean=settings.theta_mean,)) :
        threshold_params
    return (
        family=:small_world,
        beta=beta,
        k=settings.k,
        N=settings.N,
        threshold_treatment=threshold_treatment,
        threshold_params=params,
        seed_strategy=:random,
        seed_fraction=seed_fraction,
        pioneer_strategy=:random,
        vary_network=false,
        network_seed=6201,
        hazard_match_reps=0,
        replacement_digital_rule=:bernoulli_seed_probability,
    )
end
