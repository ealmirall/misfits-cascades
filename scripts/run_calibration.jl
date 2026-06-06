using CSV
using DataFrames
using Misfits
using Statistics

function calibration_settings(; quick=false)
    base = quick ? quick_settings() : full_settings()
    reps = quick ? 30 : base.n_coarse
    return merge(base, (n_coarse=reps, n_refine=reps, n_focal=reps))
end

function calibration_cell(theta_mean, treatment; seed=20260603, settings=calibration_settings())
    threshold_params = treatment == :mixture ?
        (theta_mean=theta_mean, pi=0.05, theta_low=0.05) :
        (theta_mean=theta_mean,)
    return (
        family=:small_world,
        beta=0.2,
        k=settings.k,
        N=settings.N,
        threshold_treatment=treatment,
        threshold_params=threshold_params,
        seed_strategy=:random,
        seed_fraction=settings.seed_fraction,
        vary_network=false,
        network_seed=seed + 777,
    )
end

function run_calibration(; seed=20260603, quick=false)
    root = dirname(dirname(@__FILE__))
    settings = calibration_settings(; quick=quick)
    thetas = collect(0.2:0.05:0.7)
    rows = Dict{Symbol,Any}[]
    for theta in thetas
        for treatment in (:homogeneous, :mixture)
            cascades = Bool[]
            finals = Float64[]
            t50s = Union{Missing,Int}[]
            for rep in 1:settings.n_coarse
                cell = calibration_cell(theta, treatment; seed=seed, settings=settings)
                run_seed = seed + round(Int, 10_000 * theta) + 1000 * (treatment == :mixture) + rep
                row, _ = Misfits.run_single(cell, run_seed, rep, "calibration", settings, "calibration")
                push!(cascades, row[:cascade])
                push!(finals, row[:final_adoption])
                push!(t50s, row[:t50])
            end
            push!(rows, Dict{Symbol,Any}(
                :theta_mean => theta,
                :threshold_treatment => treatment,
                :cascade_prob => mean(cascades),
                :cascade_prob_ci_low => Misfits.wilson_interval(mean(cascades), length(cascades))[1],
                :cascade_prob_ci_high => Misfits.wilson_interval(mean(cascades), length(cascades))[2],
                :final_adoption_median => median(finals),
                :final_adoption_p05 => quantile(finals, 0.05),
                :final_adoption_p95 => quantile(finals, 0.95),
                :t50_median => isempty(collect(skipmissing(t50s))) ? missing : median(collect(skipmissing(t50s))),
                :n_runs => length(cascades),
            ))
        end
    end
    df = DataFrame(rows)
    mkpath(joinpath(root, "results"))
    CSV.write(joinpath(root, "results", "calibration_summary.csv"), df)
    println(df)
    return df
end

if abspath(PROGRAM_FILE) == @__FILE__
    quick = "--quick" in ARGS
    seed = 20260603
    seed_idx = findfirst(==("--seed"), ARGS)
    if seed_idx !== nothing && seed_idx < length(ARGS)
        seed = parse(Int, ARGS[seed_idx + 1])
    end
    run_calibration(; seed=seed, quick=quick)
end
