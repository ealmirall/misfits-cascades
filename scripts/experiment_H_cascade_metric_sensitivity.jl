include(joinpath(@__DIR__, "revision_robustness_common.jl"))

function metric_grid()
    rows = NamedTuple[]
    for final_cutoff in (0.50, 0.70), window in (30, 45, 60), slope_min in (0.01, 0.015, 0.02, 0.025, 0.03)
        push!(rows, (final_cutoff=final_cutoff, transition_window=window, slope_min=slope_min))
    end
    return rows
end

function comparison_label(source::String, row)
    if source == "expA"
        rule = string(row.rule)
        return rule == "simple" ? "A frequency-based" : rule == "complex" ? "A success-based" : "A hazard"
    elseif source == "expB"
        return string("B ", row.family, " beta=", row.beta, " m=", row.m)
    elseif source == "expC"
        pi = row.pi === missing ? "" : string(" pi=", row.pi)
        return string("C ", row.threshold_treatment, pi, " beta=", row.beta, " vary=", row.vary_network)
    elseif source == "expD"
        return string("D ", row.family, " seed=", row.seed_strategy)
    elseif source == "expE"
        return string("E seed=", row.seed_strategy, " pioneer=", row.pioneer_strategy)
    elseif source == "robustness"
        bits = String[]
        for col in (:robustness_axis, :premium_ratio, :digital_growth_sd, :theta_sweep, :seed_fraction_sweep, :update_schedule, :return_distribution_sweep, :performance_benchmark_sweep, :abandonment_sweep)
            if col in propertynames(row) && row[col] !== missing
                push!(bits, string(col, "=", row[col]))
            end
        end
        return "F " * join(bits, " ")
    end
    return source
end

function load_metric_source(result_dir::AbstractString, source::String, filename::String)
    path = joinpath(result_dir, filename)
    isfile(path) || error("Missing source file for metric sensitivity: $path")
    df = CSV.read(path, DataFrame)
    df.source_experiment = fill(source, nrow(df))
    df.comparison = [comparison_label(source, row) for row in eachrow(df)]
    return df
end

function recompute_cascade(row, final_cutoff, window, slope_min)
    row.final_adoption >= final_cutoff &&
        row.transition_time !== missing &&
        row.transition_time <= window &&
        row.max_slope >= slope_min
end

function run_metric_grid(runs::DataFrame)
    rows = Dict{Symbol,Any}[]
    for grid in metric_grid()
        for group in groupby(runs, [:source_experiment, :comparison])
            outcomes = [recompute_cascade(row, grid.final_cutoff, grid.transition_window, grid.slope_min) for row in eachrow(group)]
            p = mean(outcomes)
            lo, hi = Misfits.wilson_interval(p, length(outcomes))
            push!(rows, Dict{Symbol,Any}(
                :source_experiment => group.source_experiment[1],
                :comparison => group.comparison[1],
                :final_cutoff => grid.final_cutoff,
                :transition_window => grid.transition_window,
                :slope_min => grid.slope_min,
                :cascade_prob => p,
                :cascade_prob_ci_low => lo,
                :cascade_prob_ci_high => hi,
                :n_runs => length(outcomes),
            ))
        end
    end
    return DataFrame(rows)
end

function plot_metric_sensitivity(summary::DataFrame, outdir::AbstractString)
    selected = ["A hazard", "A frequency-based", "A success-based"]
    fig = Figure(size=(1050, 360))
    slope_vals = sort(unique(summary.slope_min))
    window_vals = sort(unique(summary.transition_window))
    for (i, label) in enumerate(selected)
        d = summary[(summary.comparison .== label) .& (summary.final_cutoff .== 0.5), :]
        z = fill(NaN, length(slope_vals), length(window_vals))
        for row in eachrow(d)
            x = findfirst(==(row.slope_min), slope_vals)
            y = findfirst(==(row.transition_window), window_vals)
            z[x, y] = row.cascade_prob
        end
        ax = Axis(fig[1, i], title=label, xlabel="s_min", ylabel=i == 1 ? "W" : "", xticks=(slope_vals, string.(slope_vals)), yticks=(window_vals, string.(window_vals)))
        heatmap!(ax, slope_vals, window_vals, z; colorrange=(0, 1), colormap=:viridis)
        for x in slope_vals, y in window_vals
            ix = findfirst(==(x), slope_vals)
            iy = findfirst(==(y), window_vals)
            val = z[ix, iy]
            isnan(val) || text!(ax, x, y; text=@sprintf("%.2f", val), align=(:center, :center), fontsize=9, color=val > 0.55 ? :white : :black)
        end
    end
    Colorbar(fig[1, 4], limits=(0, 1), colormap=:viridis, label="Dynamic cascade probability")
    Label(fig[2, :], "Heatmaps use final adoption threshold 0.50. Full metric grid, including final threshold 0.70, is in metric_grid_summary.csv."; fontsize=9, halign=:left, tellwidth=false)
    save_revision_figure(fig, outdir, "figure_metric_sensitivity_heatmap")
end

function write_H_markdown(outdir::AbstractString, summary::DataFrame)
    base = summary[(summary.final_cutoff .== 0.5) .& (summary.transition_window .== 45) .& (summary.slope_min .== 0.02), :]
    loose = summary[(summary.final_cutoff .== 0.5) .& (summary.transition_window .== 60) .& (summary.slope_min .== 0.01), :]
    strict = summary[(summary.final_cutoff .== 0.7) .& (summary.transition_window .== 30) .& (summary.slope_min .== 0.03), :]
    function p(df, comp)
        r = df[df.comparison .== comp, :]
        nrow(r) == 0 ? missing : r.cascade_prob[1]
    end
    notes = """
    ## Direct answers

    - Baseline A hazard/simple/success: $(p(base, "A hazard")) / $(p(base, "A frequency-based")) / $(p(base, "A success-based")).
    - Loose A hazard/simple/success (W=60, s_min=0.01): $(p(loose, "A hazard")) / $(p(loose, "A frequency-based")) / $(p(loose, "A success-based")).
    - Strict A hazard/simple/success (final>=0.70, W=30, s_min=0.03): $(p(strict, "A hazard")) / $(p(strict, "A frequency-based")) / $(p(strict, "A success-based")).
    - The full grid below should be used to identify claims that depend on W=45 or s_min=0.02.
    """
    write_summary_markdown(joinpath(outdir, "metric_grid_summary.md"), "Experiment H: Cascade Metric Sensitivity", summary; notes=notes)
end

function run_experiment_H(; args=ARGS)
    mode = revision_mode_settings(args)
    root = dirname(dirname(@__FILE__))
    result_dir = joinpath(root, "results")
    outdir = ensure_revision_dir("experiment_H_cascade_metric_sensitivity")
    sources = [
        ("expA", "expA_nullmodels_runs.csv"),
        ("expB", "expB_topology_runs.csv"),
        ("expC", "expC_culture_vs_misfits_runs.csv"),
        ("expD", "expD_seedplacement_runs.csv"),
        ("expE", "expE_seed_x_pioneer_runs.csv"),
        ("robustness", "robustness_runs.csv"),
    ]
    runs = vcat([load_metric_source(result_dir, src, file) for (src, file) in sources]...; cols=:union)
    summary = run_metric_grid(runs)
    CSV.write(joinpath(outdir, "metric_grid_summary.csv"), summary)
    write_H_markdown(outdir, summary)
    plot_metric_sensitivity(summary, outdir)
    write_revision_metadata(joinpath(outdir, "metadata.json"), "experiment_H_cascade_metric_sensitivity", mode.settings, mode.seed, sources; extra=Dict("mode" => mode.mode, "source_results_dir" => result_dir, "reran_simulations" => false))
    return summary
end

if abspath(PROGRAM_FILE) == @__FILE__
    run_experiment_H()
end
