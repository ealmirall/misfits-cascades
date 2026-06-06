include(joinpath(@__DIR__, "revision_robustness_common.jl"))

const REPLACEMENT_RULES = [:traditional_only, :bernoulli_seed_probability]

function replacement_rule_label(rule)
    string(rule) == "traditional_only" && return "traditional only"
    string(rule) == "bernoulli_seed_probability" && return "Bernoulli p_digital"
    return string(rule)
end

function experiment_I_cells(settings)
    cells = NamedTuple[]
    seed_count = seed_count_from_fraction(settings.N, 0.006)
    pioneer_count = seed_count_from_fraction(settings.N, 0.05)
    placement_strategies = [:random, :hub_bridge]

    mechanism_variants = [
        (variant=:hazard, variant_label="hazard", rule=:hazard),
        (variant=:frequency_based, variant_label="frequency-based", rule=:simple),
        (variant=:success_original, variant_label="success-based", rule=:complex),
    ]
    threshold_variants = [
        (
            variant=:homogeneous,
            variant_label="homogeneous",
            threshold_treatment=:homogeneous,
            threshold_params=(theta_mean=settings.theta_mean,),
        ),
        (
            variant=:mixture_pi05,
            variant_label="mixture pi=5%",
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
        ),
    ]

    for replacement_rule in REPLACEMENT_RULES
        for variant in mechanism_variants
            base = base_revision_cell(settings; beta=1.0, seed_fraction=0.01, pi=0.10)
            push!(cells, merge(base, (
                setting=:experiment_A,
                setting_label="Exp A focal",
                network_seed=6401,
                replacement_digital_rule=replacement_rule,
                variant=variant.variant,
                variant_label=variant.variant_label,
                rule=variant.rule,
                success_denominator=:better,
                min_successful_digital=0,
                min_better_total=0,
                count_k=1,
            )))
        end

        for variant in threshold_variants
            base = base_revision_cell(
                settings;
                beta=0.4,
                seed_fraction=0.006,
                pi=0.05,
                threshold_treatment=variant.threshold_treatment,
                threshold_params=variant.threshold_params,
            )
            push!(cells, merge(base, (
                setting=:transition_beta04,
                setting_label="Transition beta=0.4",
                network_seed=6402,
                replacement_digital_rule=replacement_rule,
                variant=variant.variant,
                variant_label=variant.variant_label,
                rule=:complex,
                success_denominator=:better,
                min_successful_digital=0,
                min_better_total=0,
                count_k=1,
            )))
        end

        for seed_strategy in placement_strategies, pioneer_strategy in placement_strategies
            base = base_revision_cell(settings; beta=0.4, seed_fraction=0.006, pi=0.05)
            placement_label = string(
                "seed ", seed_strategy == :hub_bridge ? "hub/bridge" : seed_strategy,
                "; pioneer ", pioneer_strategy == :hub_bridge ? "hub/bridge" : pioneer_strategy,
            )
            push!(cells, merge(base, (
                setting=:seed_pioneer_placement,
                setting_label="Seed x pioneer placement",
                network_seed=6403,
                replacement_digital_rule=replacement_rule,
                variant=Symbol("seed_", seed_strategy, "_pioneer_", pioneer_strategy),
                variant_label=placement_label,
                rule=:complex,
                success_denominator=:better,
                min_successful_digital=0,
                min_better_total=0,
                count_k=1,
                seed_strategy=seed_strategy,
                seed_count=seed_count,
                seed_fraction=seed_count / settings.N,
                pioneer_strategy=pioneer_strategy,
                pioneer_count=pioneer_count,
                pioneer_fraction=pioneer_count / settings.N,
            )))
        end
    end
    return cells
end

function panel_variant_order(setting)
    string(setting) == "experiment_A" && return [:hazard, :frequency_based, :success_original]
    string(setting) == "transition_beta04" && return [:homogeneous, :mixture_pi05]
    return [:seed_random_pioneer_random, :seed_hub_bridge_pioneer_random, :seed_random_pioneer_hub_bridge, :seed_hub_bridge_pioneer_hub_bridge]
end

function panel_variant_label(summary, setting, variant)
    rows = summary[(string.(summary.setting) .== string(setting)) .& (string.(summary.variant) .== string(variant)), :]
    nrow(rows) == 0 && return string(variant)
    return string(rows.variant_label[1])
end

function replacement_summary_value(summary, setting, variant, rule, col)
    rows = summary[
        (string.(summary.setting) .== string(setting)) .&
        (string.(summary.variant) .== string(variant)) .&
        (string.(summary.replacement_digital_rule) .== string(rule)),
        :,
    ]
    nrow(rows) == 0 && return missing
    return rows[1, col]
end

function plot_experiment_I(summary::DataFrame, outdir::AbstractString)
    panels = [
        (:experiment_A, "Replacement ablation: mechanism focal cells"),
        (:transition_beta04, "Replacement ablation: transition cells"),
        (:seed_pioneer_placement, "Replacement ablation: placement cells"),
    ]
    fig = Figure(size=(1180, 720))
    for (panel_idx, (setting, title)) in enumerate(panels)
        variants = panel_variant_order(setting)
        ax = Axis(
            fig[panel_idx, 1],
            title=title,
            ylabel="Dynamic cascade probability",
            xticklabelrotation=panel_idx == 3 ? pi / 6 : pi / 8,
        )
        xs = collect(1:length(variants))
        width = 0.34
        for (rule_idx, replacement_rule) in enumerate(REPLACEMENT_RULES)
            offset = rule_idx == 1 ? -width / 2 : width / 2
            vals = [replacement_summary_value(summary, setting, variant, replacement_rule, :cascade_prob) for variant in variants]
            lows = [replacement_summary_value(summary, setting, variant, replacement_rule, :cascade_prob_ci_low) for variant in variants]
            highs = [replacement_summary_value(summary, setting, variant, replacement_rule, :cascade_prob_ci_high) for variant in variants]
            clean_vals = Float64[v === missing ? NaN : v for v in vals]
            clean_lows = Float64[v === missing ? NaN : v for v in lows]
            clean_highs = Float64[v === missing ? NaN : v for v in highs]
            color = rule_idx == 1 ? PUB_CRIMSON : PUB_GREY
            barplot!(ax, xs .+ offset, clean_vals; width=width, color=color, label=replacement_rule_label(replacement_rule))
            add_errorbars!(ax, xs .+ offset, clean_vals, clean_lows, clean_highs; color=:black)
            for (x, y) in zip(xs .+ offset, clean_vals)
                isnan(y) && continue
                text!(ax, x, min(y + 0.035, 1.03); text=@sprintf("%.2f", y), align=(:center, :bottom), fontsize=8)
            end
        end
        ax.xticks = (xs, [panel_variant_label(summary, setting, variant) for variant in variants])
        ylims!(ax, 0, 1.08)
        panel_idx == 1 && axislegend(ax; position=:rt, framevisible=false)
    end
    Label(fig[4, 1], "Error bars: Wilson 95% CIs. Dynamic cascade: final adoption >=0.5, t50-t10 <=45, max slope >=0.02."; fontsize=9, halign=:left, tellwidth=false)
    save_revision_figure(fig, outdir, "figure_replacement_dynamics_ablation")
end

function write_I_markdown(outdir::AbstractString, summary::DataFrame)
    function p(setting, variant, rule)
        val = replacement_summary_value(summary, setting, variant, rule, :cascade_prob)
        val === missing ? "missing" : @sprintf("%.3f", val)
    end
    notes = """
    ## Direct answers

    - Experiment A success-based, traditional-only vs Bernoulli replacement: $(p(:experiment_A, :success_original, :traditional_only)) / $(p(:experiment_A, :success_original, :bernoulli_seed_probability)).
    - Experiment A hazard, traditional-only vs Bernoulli replacement: $(p(:experiment_A, :hazard, :traditional_only)) / $(p(:experiment_A, :hazard, :bernoulli_seed_probability)).
    - Transition mixture pi=5%, traditional-only vs Bernoulli replacement: $(p(:transition_beta04, :mixture_pi05, :traditional_only)) / $(p(:transition_beta04, :mixture_pi05, :bernoulli_seed_probability)).
    - Placement best-cell sensitivity should be read from the placement panel and table below; the key question is whether the rank ordering survives the replacement assumption.
    """
    write_summary_markdown(joinpath(outdir, "summary.md"), "Experiment I: Replacement Dynamics Ablation", summary; notes=notes)
end

function run_experiment_I(; args=ARGS)
    mode = revision_mode_settings(args)
    outdir = ensure_revision_dir("experiment_I_replacement_dynamics")
    cells = experiment_I_cells(mode.settings)
    reps = mode.smoke ? 5 : 250
    runs = run_revision_cells(cells, reps, mode.settings, mode.seed, "experiment_I_replacement_dynamics")
    groupcols = [
        :setting,
        :setting_label,
        :variant,
        :variant_label,
        :replacement_digital_rule,
        :rule,
        :threshold_treatment,
        :theta_mean,
        :pi,
        :seed_strategy,
        :pioneer_strategy,
        :pioneer_count,
    ]
    summary = summarize_revision_runs(runs, groupcols)
    sort!(summary, [:setting_label, :variant, :replacement_digital_rule])
    CSV.write(joinpath(outdir, "raw_runs.csv"), runs)
    CSV.write(joinpath(outdir, "summary.csv"), summary)
    write_I_markdown(outdir, summary)
    plot_experiment_I(summary, outdir)
    write_revision_metadata(joinpath(outdir, "metadata.json"), "experiment_I_replacement_dynamics", mode.settings, mode.seed, cells; extra=Dict("mode" => mode.mode, "reps_per_cell" => reps))
    return summary
end

if abspath(PROGRAM_FILE) == @__FILE__
    run_experiment_I()
end
