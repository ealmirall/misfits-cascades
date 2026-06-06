include(joinpath(@__DIR__, "revision_robustness_common.jl"))

function success_rule_variants()
    return [
        (variant=:hazard, variant_label="hazard", rule=:hazard, success_denominator=:better, min_successful_digital=0, min_better_total=0, count_k=1),
        (variant=:frequency_based, variant_label="frequency-based", rule=:simple, success_denominator=:better, min_successful_digital=0, min_better_total=0, count_k=1),
        (variant=:success_original, variant_label="success: better denom", rule=:complex, success_denominator=:better, min_successful_digital=0, min_better_total=0, count_k=1),
        (variant=:success_min2, variant_label="success: better denom + >=2 digital", rule=:complex, success_denominator=:better, min_successful_digital=2, min_better_total=0, count_k=1),
        (variant=:success_min3, variant_label="success: better denom + >=3 digital", rule=:complex, success_denominator=:better, min_successful_digital=3, min_better_total=0, count_k=1),
        (variant=:success_all_neighbors, variant_label="success: all-neighbour denom", rule=:complex, success_denominator=:all_neighbors, min_successful_digital=0, min_better_total=0, count_k=1),
        (variant=:success_all_neighbors_min2, variant_label="all-neighbour denom + >=2 digital", rule=:complex, success_denominator=:all_neighbors, min_successful_digital=2, min_better_total=0, count_k=1),
        (variant=:success_all_neighbors_min3, variant_label="all-neighbour denom + >=3 digital", rule=:complex, success_denominator=:all_neighbors, min_successful_digital=3, min_better_total=0, count_k=1),
        (variant=:success_min_better2, variant_label="success: require >=2 better", rule=:complex, success_denominator=:better, min_successful_digital=0, min_better_total=2, count_k=1),
        (variant=:success_min_better3, variant_label="success: require >=3 better", rule=:complex, success_denominator=:better, min_successful_digital=0, min_better_total=3, count_k=1),
        (variant=:count_1, variant_label="absolute count >=1", rule=:count_legacy, success_denominator=:better, min_successful_digital=0, min_better_total=0, count_k=1),
        (variant=:count_2, variant_label="absolute count >=2", rule=:count_legacy, success_denominator=:better, min_successful_digital=0, min_better_total=0, count_k=2),
        (variant=:count_3, variant_label="absolute count >=3", rule=:count_legacy, success_denominator=:better, min_successful_digital=0, min_better_total=0, count_k=3),
    ]
end

function experiment_G_cells(settings)
    settings_specs = [
        (
            setting=:experiment_A,
            setting_label="Exp A focal",
            beta=1.0,
            seed_fraction=0.01,
            pi=0.10,
            network_seed=6301,
        ),
        (
            setting=:transition_beta04,
            setting_label="Transition beta=0.4",
            beta=0.4,
            seed_fraction=0.006,
            pi=0.05,
            network_seed=6302,
        ),
    ]
    cells = NamedTuple[]
    for spec in settings_specs, variant in success_rule_variants()
        base = base_revision_cell(settings; beta=spec.beta, seed_fraction=spec.seed_fraction, pi=spec.pi)
        push!(cells, merge(base, (
            setting=spec.setting,
            setting_label=spec.setting_label,
            network_seed=spec.network_seed,
            variant=variant.variant,
            variant_label=variant.variant_label,
            rule=variant.rule,
            success_denominator=variant.success_denominator,
            min_successful_digital=variant.min_successful_digital,
            min_better_total=variant.min_better_total,
            count_k=variant.count_k,
        )))
    end
    return cells
end

function plot_experiment_G(summary::DataFrame, outdir::AbstractString)
    sort!(summary, [:setting_label, :variant])
    settings = unique(summary.setting_label)
    fig = Figure(size=(1180, 620))
    for (i, setting) in enumerate(settings)
        d = summary[summary.setting_label .== setting, :]
        ax = Axis(fig[i, 1], title=string(setting), ylabel="Dynamic cascade probability")
        xs = 1:nrow(d)
        colors = [occursin("frequency", row.variant_label) ? PUB_ORANGE :
                  occursin("hazard", row.variant_label) ? PUB_GREY :
                  occursin("count", row.variant_label) ? PUB_GREEN : PUB_NAVY for row in eachrow(d)]
        barplot!(ax, xs, d.cascade_prob; color=colors)
        add_errorbars!(ax, xs, d.cascade_prob, d.cascade_prob_ci_low, d.cascade_prob_ci_high)
        ax.xticks = (xs, string.(d.variant_label))
        ax.xticklabelrotation = pi / 5
        ylims!(ax, 0, 1.05)
    end
    Label(fig[3, 1], "Error bars: Wilson 95% CIs. Dynamic cascade: final adoption >=0.5, t50-t10 <=45, max slope >=0.02."; fontsize=9, halign=:left, tellwidth=false)
    save_revision_figure(fig, outdir, "figure_success_rule_robustness")
end

function write_G_markdown(outdir::AbstractString, summary::DataFrame)
    expA = summary[string.(summary.setting) .== "experiment_A", :]
    trans = summary[string.(summary.setting) .== "transition_beta04", :]
    function cp(df, variant)
        row = df[string.(df.variant) .== string(variant), :]
        nrow(row) == 0 && return missing
        return @sprintf("%.3f", row.cascade_prob[1])
    end
    notes = """
    ## Direct answers

    - In the Experiment A focal setting, success-based imitation remains distinguishable from hazard/frequency if `success_original` is high while `hazard` and `frequency_based` are low.
    - Survival under `success_min2` and `success_min3` is the test of stricter complex contagion.
    - Survival under `success_all_neighbors` variants is the test of the small-denominator concern.
    - If all-neighbour denominator variants fail while better-denominator variants hold, the safer manuscript phrase is "performance-conditioned imitation" or "success-conditioned threshold adoption" rather than a broad claim of complex contagion.

    Experiment A quick read: original=$(cp(expA, :success_original)), min2=$(cp(expA, :success_min2)), min3=$(cp(expA, :success_min3)), all-neighbour=$(cp(expA, :success_all_neighbors)).

    Transition quick read: original=$(cp(trans, :success_original)), min2=$(cp(trans, :success_min2)), min3=$(cp(trans, :success_min3)), all-neighbour=$(cp(trans, :success_all_neighbors)).
    """
    write_summary_markdown(joinpath(outdir, "summary.md"), "Experiment G: Success-Rule Robustness", summary; notes=notes)
end

function run_experiment_G(; args=ARGS)
    mode = revision_mode_settings(args)
    outdir = ensure_revision_dir("experiment_G_success_rule_robustness")
    cells = experiment_G_cells(mode.settings)
    reps = mode.smoke ? 5 : 250
    runs = run_revision_cells(cells, reps, mode.settings, mode.seed, "experiment_G_success_rule_robustness")
    groupcols = [:setting, :setting_label, :variant, :variant_label, :rule, :success_denominator, :min_successful_digital, :min_better_total, :count_k]
    summary = summarize_revision_runs(runs, groupcols)
    CSV.write(joinpath(outdir, "raw_runs.csv"), runs)
    CSV.write(joinpath(outdir, "summary.csv"), summary)
    write_G_markdown(outdir, summary)
    plot_experiment_G(summary, outdir)
    write_revision_metadata(joinpath(outdir, "metadata.json"), "experiment_G_success_rule_robustness", mode.settings, mode.seed, cells; extra=Dict("mode" => mode.mode, "reps_per_cell" => reps))
    return summary
end

if abspath(PROGRAM_FILE) == @__FILE__
    run_experiment_G()
end
