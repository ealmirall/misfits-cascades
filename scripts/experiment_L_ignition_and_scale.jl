include(joinpath(@__DIR__, "experiment_K_realistic_degree.jl"))

const L_OUTPUT_NAME = "experiment_L_ignition_and_scale"
const L_HUMAN_SCALE_DEGREES = [10, 15, 30, 50, 100, 150]
const L_SCALE_DEGREES = [10, 15, 30, 50, 100, 150, 200]
const L_IGNITION_DEGREES = [20, 50]
const L_CORE_DEGREES = [20, 50]
const L_CALIBRATION_BETA = 0.70
const L_SEED_GRID = [0.001, 0.002, 0.003, 0.005, 0.010]
const L_IGNITION_SEEDS = [0.001, 0.005, 0.010, 0.020, 0.050]
const L_PLACEMENTS = [:random, :clustered, :hub_bridge]
const L_RULES = [
    (variant=:success_original, variant_label="fractional success", rule=:complex, min_successful_digital=0),
    (variant=:success_min2, variant_label="fractional success + >=2", rule=:complex, min_successful_digital=2),
    (variant=:success_min3, variant_label="fractional success + >=3", rule=:complex, min_successful_digital=3),
]

function l_mode_settings(args=ARGS)
    smoke = "--smoke" in args || "--quick" in args
    seed = 20260603
    seed_idx = findfirst(==("--seed"), args)
    if seed_idx !== nothing && seed_idx < length(args)
        seed = parse(Int, args[seed_idx + 1])
    end
    base = smoke ? quick_settings() : full_settings()
    settings = merge(base, (
        N=smoke ? 250 : 1000,
        T=smoke ? 70 : 100,
        path_samples=smoke ? 12 : 25,
        hazard_match_reps=0,
        stall_window=20,
        cascade_transition_window=45,
        cascade_slope_min=0.02,
        cascade_final_cutoff=0.5,
    ))
    theta_grid = smoke ? [0.90, 0.95, 0.99] : vcat([0.70, 0.75, 0.80], collect(0.85:0.01:1.00))
    degrees = smoke ? [20] : sort(unique(vcat(L_SCALE_DEGREES, L_IGNITION_DEGREES)))
    return (
        smoke=smoke,
        mode=smoke ? "smoke" : "production",
        seed=seed,
        settings=settings,
        degrees=degrees,
        theta_grid=Float64.(theta_grid),
        seed_grid=smoke ? [0.001, 0.005] : L_SEED_GRID,
        calibration_reps=smoke ? 3 : 12,
        ignition_reps=smoke ? 3 : 60,
        core_reps=smoke ? 3 : 60,
        scale_reps=smoke ? 3 : 50,
    )
end

function l_feasible_mixture_theta(pi=0.05, theta_low=0.05)
    return pi * theta_low + (1 - pi) * 1.0
end

function l_calibration_cells(mode)
    cells = NamedTuple[]
    for degree in mode.degrees, theta_mean in mode.theta_grid, seed_fraction in mode.seed_grid
        push!(cells, k_cell(
            section=:L_calibration,
            section_label="L calibration",
            k=degree,
            theta_mean=theta_mean,
            seed_fraction=seed_fraction,
            beta=L_CALIBRATION_BETA,
            threshold_treatment=:homogeneous,
            threshold_params=(theta_mean=theta_mean,),
            treatment_label="homogeneous",
            rule=:complex,
            variant=:homogeneous,
            variant_label="homogeneous baseline",
            collect_exposures=false,
            network_seed=8100 + degree,
        ))
    end
    return cells
end

function choose_l_calibration(calibration_summary::DataFrame)
    rows = Dict{Symbol,Any}[]
    chosen = Dict{Int,NamedTuple}()
    max_matched_theta = l_feasible_mixture_theta()
    for degree in sort(unique(calibration_summary.k))
        d = calibration_summary[calibration_summary.k .== degree, :]
        d.in_target = (d.cascade_prob .>= 0.25) .& (d.cascade_prob .<= 0.40)
        d.target_score = abs.(d.cascade_prob .- 0.325)
        d.neg_theta = -Float64.(d.theta_mean)
        if any(d.in_target)
            candidates = d[d.in_target, :]
            sort!(candidates, [:target_score, :neg_theta, :seed_fraction])
            choice = candidates[1, :]
            note = "homogeneous baseline in 0.25-0.40 target band"
        else
            sort!(d, [:target_score, :neg_theta, :seed_fraction])
            choice = d[1, :]
            note = "target band not hit; nearest grid point to 0.325"
        end
        mean_matched = choice.theta_mean <= max_matched_theta + eps(Float64)
        push!(rows, Dict{Symbol,Any}(
            :k => degree,
            :theta_mean => choice.theta_mean,
            :seed_fraction => choice.seed_fraction,
            :homogeneous_cascade_prob => choice.cascade_prob,
            :homogeneous_ci_low => choice.cascade_prob_ci_low,
            :homogeneous_ci_high => choice.cascade_prob_ci_high,
            :target_hit => 0.25 <= choice.cascade_prob <= 0.40,
            :mixture_pi05_mean_matched => mean_matched,
            :max_mean_matched_theta_for_pi05 => max_matched_theta,
            :selection_note => mean_matched ? note : string(note, "; pi=5% mixture cannot be exactly mean-matched above theta=", @sprintf("%.4f", max_matched_theta)),
        ))
        chosen[Int(degree)] = (
            k=Int(degree),
            theta_mean=Float64(choice.theta_mean),
            seed_fraction=Float64(choice.seed_fraction),
            target_hit=0.25 <= choice.cascade_prob <= 0.40,
            mixture_mean_matched=mean_matched,
        )
    end
    return DataFrame(rows), chosen
end

function l_cal_for_degree(chosen, degree)
    if haskey(chosen, degree)
        return chosen[degree]
    end
    # k=20 is intentionally included in the ignition/core tests even if the scale band
    # starts at k=10/15/30. Use nearest calibrated human-scale neighbour.
    nearest = argmin(abs.(collect(keys(chosen)) .- degree))
    key = collect(keys(chosen))[nearest]
    return merge(chosen[key], (k=degree,))
end

function l_main_cells(mode, chosen)
    cells = NamedTuple[]

    for degree in L_IGNITION_DEGREES
        cal = l_cal_for_degree(chosen, degree)
        for rule in L_RULES, seed_fraction in L_IGNITION_SEEDS, placement in L_PLACEMENTS
            push!(cells, k_cell(
                section=:L_ignition,
                section_label="L ignition",
                k=degree,
                theta_mean=cal.theta_mean,
                seed_fraction=seed_fraction,
                beta=L_CALIBRATION_BETA,
                threshold_treatment=:mixture,
                threshold_params=(theta_mean=cal.theta_mean, pi=0.05, theta_low=0.05),
                treatment_label="mixture pi=5%",
                rule=rule.rule,
                variant=rule.variant,
                variant_label=rule.variant_label,
                seed_strategy=placement,
                collect_exposures=false,
                min_successful_digital=rule.min_successful_digital,
                network_seed=8200 + degree,
            ))
        end
    end

    for degree in (mode.smoke ? [20] : L_SCALE_DEGREES)
        cal = chosen[degree]
        push!(cells, k_cell(
            section=:L_scale,
            section_label=degree > 150 ? "L scale beyond human" : "L scale",
            k=degree,
            theta_mean=cal.theta_mean,
            seed_fraction=0.010,
            beta=L_CALIBRATION_BETA,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=cal.theta_mean, pi=0.05, theta_low=0.05),
            treatment_label="mixture pi=5%",
            rule=:complex,
            variant=:scale_original_clustered,
            variant_label="original rule; 1% clustered seed",
            seed_strategy=:clustered,
            collect_exposures=false,
            network_seed=8300 + degree,
        ))
    end

    for degree in L_CORE_DEGREES
        cal = l_cal_for_degree(chosen, degree)
        for (rule, variant, label) in [
            (:hazard, :hazard, "hazard"),
            (:simple, :frequency_based, "frequency-based"),
            (:complex, :success_original, "performance-conditioned"),
        ]
            push!(cells, k_cell(
                section=:L_mechanism,
                section_label="L mechanism",
                k=degree,
                theta_mean=cal.theta_mean,
                seed_fraction=0.010,
                beta=L_CALIBRATION_BETA,
                threshold_treatment=:mixture,
                threshold_params=(theta_mean=cal.theta_mean, pi=0.05, theta_low=0.05),
                treatment_label="mixture pi=5%",
                rule=rule,
                variant=variant,
                variant_label=label,
                seed_strategy=:clustered,
                collect_exposures=rule == :complex,
                network_seed=8400 + degree,
            ))
        end

        lower_mean = max(cal.theta_mean - 0.05, 0.0)
        effort_budget = 0.05
        equal_sigma = effort_budget * sqrt(pi / 2)
        equal_pi = clamp(effort_budget / (2 * max(cal.theta_mean - 0.05, eps())), 0.005, 0.20)
        treatments = [
            (:homogeneous, (theta_mean=cal.theta_mean,), "homogeneous", :homogeneous),
            (:lower_mean, (theta_mean=cal.theta_mean, theta_low_mean=lower_mean), "lower mean", :lower_mean),
            (:higher_variance, (theta_mean=cal.theta_mean, sigma_high=0.15), "higher variance", :higher_variance),
            (:mixture, (theta_mean=cal.theta_mean, pi=0.01, theta_low=0.05), "mixture pi=1%", :mixture_pi_1),
            (:mixture, (theta_mean=cal.theta_mean, pi=0.05, theta_low=0.05), "mixture pi=5%", :mixture_pi_5),
            (:mixture, (theta_mean=cal.theta_mean, pi=0.10, theta_low=0.05), "mixture pi=10%", :mixture_pi_10),
            (:lower_mean, (theta_mean=cal.theta_mean, theta_low_mean=max(cal.theta_mean - effort_budget, 0.0)), "equal effort: lower mean", :equal_lower_mean),
            (:higher_variance, (theta_mean=cal.theta_mean, sigma_high=equal_sigma), "equal effort: variance", :equal_higher_variance),
            (:mixture, (theta_mean=cal.theta_mean, pi=equal_pi, theta_low=0.05), "equal effort: mixture", :equal_mixture),
        ]
        for (treatment, params, label, variant) in treatments
            push!(cells, k_cell(
                section=:L_thresholds,
                section_label="L thresholds",
                k=degree,
                theta_mean=cal.theta_mean,
                seed_fraction=0.010,
                beta=L_CALIBRATION_BETA,
                threshold_treatment=treatment,
                threshold_params=params,
                treatment_label=label,
                rule=:complex,
                variant=variant,
                variant_label=label,
                seed_strategy=:clustered,
                collect_exposures=true,
                network_seed=8500 + degree,
            ))
        end
    end

    return cells
end

function l_reps_for(mode)
    return cell -> begin
        section = string(cell.section)
        if section == "L_ignition"
            mode.ignition_reps
        elseif section == "L_scale"
            mode.scale_reps
        else
            mode.core_reps
        end
    end
end

function l_summary_groupcols()
    return [:section, :section_label, :k, :beta, :rule, :variant, :variant_label, :success_denominator, :min_successful_digital, :count_k, :threshold_treatment, :treatment_label, :theta_mean, :pi, :seed_strategy, :seed_fraction, :pioneer_strategy, :replacement_digital_rule, :realised_mean_degree, :avg_path_length, :clustering, :giant_component_fraction]
end

function l_ignition_grid(summary)
    d = summary[string.(summary.section) .== "L_ignition", :]
    select!(d, [:k, :variant, :variant_label, :min_successful_digital, :seed_fraction, :seed_strategy, :cascade_prob, :cascade_prob_ci_low, :cascade_prob_ci_high, :final_adoption_median, :final_adoption_p05, :final_adoption_p95, :t50_median, :t50_p05, :t50_p95, :n_runs])
    sort!(d, [:k, :variant, :seed_fraction, :seed_strategy])
    return d
end

function l_scale_curve(summary)
    d = summary[string.(summary.section) .== "L_scale", :]
    select!(d, [:k, :beta, :theta_mean, :seed_fraction, :seed_strategy, :realised_mean_degree, :avg_path_length, :clustering, :giant_component_fraction, :cascade_prob, :cascade_prob_ci_low, :cascade_prob_ci_high, :final_adoption_median, :final_adoption_p05, :final_adoption_p95, :n_runs])
    sort!(d, :k)
    return d
end

function l_min_ignition_table(ignition_grid)
    rows = Dict{Symbol,Any}[]
    for group in groupby(ignition_grid, [:k, :variant, :variant_label, :seed_strategy])
        g = sort(group, :seed_fraction)
        hit = g[g.cascade_prob_ci_low .> 0, :]
        if nrow(hit) > 0
            row = hit[1, :]
            push!(rows, Dict{Symbol,Any}(
                :k => row.k,
                :variant => row.variant,
                :variant_label => row.variant_label,
                :seed_strategy => row.seed_strategy,
                :minimum_seed_fraction_with_ci_excluding_zero => row.seed_fraction,
                :cascade_prob => row.cascade_prob,
                :cascade_prob_ci_low => row.cascade_prob_ci_low,
                :cascade_prob_ci_high => row.cascade_prob_ci_high,
                :t50_median => row.t50_median,
            ))
        else
            push!(rows, Dict{Symbol,Any}(
                :k => g.k[1],
                :variant => g.variant[1],
                :variant_label => g.variant_label[1],
                :seed_strategy => g.seed_strategy[1],
                :minimum_seed_fraction_with_ci_excluding_zero => missing,
                :cascade_prob => maximum(g.cascade_prob),
                :cascade_prob_ci_low => maximum(g.cascade_prob_ci_low),
                :cascade_prob_ci_high => missing,
                :t50_median => missing,
            ))
        end
    end
    return sort!(DataFrame(rows), [:k, :variant, :seed_strategy])
end

function l_scale_peak(scale_curve)
    isempty(scale_curve) && return (peak_k=missing, peak_prob=missing, human150_prob=missing, beyond200_prob=missing)
    human = scale_curve[scale_curve.k .<= 150, :]
    peak_idx = argmax(human.cascade_prob)
    human150 = scale_curve[scale_curve.k .== 150, :]
    beyond200 = scale_curve[scale_curve.k .== 200, :]
    return (
        peak_k=human.k[peak_idx],
        peak_prob=human.cascade_prob[peak_idx],
        human150_prob=nrow(human150) == 0 ? missing : human150.cascade_prob[1],
        beyond200_prob=nrow(beyond200) == 0 ? missing : beyond200.cascade_prob[1],
    )
end

function plot_l_ignition(ignition_grid, outdir)
    degrees = sort(unique(ignition_grid.k))
    rules = [:success_original, :success_min2, :success_min3]
    placements = [:random, :clustered, :hub_bridge]
    fig = Figure(size=(1180, 760))
    for (row_idx, degree) in enumerate(degrees), (col_idx, rule) in enumerate(rules)
        d = ignition_grid[(ignition_grid.k .== degree) .& (string.(ignition_grid.variant) .== string(rule)), :]
        ax = Axis(fig[row_idx, col_idx], title=string("k=", degree, " ", replace(string(rule), "_" => " ")), xlabel="Seed fraction", ylabel=col_idx == 1 ? "Cascade probability" : "", xticks=(L_IGNITION_SEEDS, [@sprintf("%.3f", s) for s in L_IGNITION_SEEDS]))
        for placement in placements
            dp = sort(d[string.(d.seed_strategy) .== string(placement), :], :seed_fraction)
            isempty(dp) && continue
            color = placement == :clustered ? PUB_NAVY : placement == :hub_bridge ? PUB_ORANGE : PUB_GREY
            lines!(ax, dp.seed_fraction, dp.cascade_prob; color=color, linewidth=2, label=string(placement))
            scatter!(ax, dp.seed_fraction, dp.cascade_prob; color=color, markersize=9)
        end
        hlines!(ax, [0.5]; color=:black, linestyle=:dot)
        ylims!(ax, 0, 1.05)
        row_idx == 1 && col_idx == 3 && axislegend(ax; position=:rb, framevisible=false)
    end
    Label(fig[length(degrees)+1, :], "Error bars are in ignition_grid.csv. A positive ignition hit requires Wilson lower CI > 0 in the minimum-ignition table.", fontsize=9, halign=:left, tellwidth=false)
    save_revision_figure(fig, outdir, "figure_ignition_grid")
end

function plot_l_scale(scale_curve, outdir)
    fig = Figure(size=(820, 430))
    ax = Axis(fig[1, 1], title="Cascade strength is bounded by observation scale", xlabel="Mean degree k", ylabel="Dynamic cascade probability", xticks=(scale_curve.k, string.(scale_curve.k)))
    band!(ax, [150, 200], [0, 0], [1.05, 1.05]; color=(PUB_GREY, 0.18))
    lines!(ax, scale_curve.k, scale_curve.cascade_prob; color=PUB_NAVY, linewidth=2)
    scatter!(ax, scale_curve.k, scale_curve.cascade_prob; color=PUB_NAVY, markersize=10)
    errorbars!(ax, scale_curve.k, scale_curve.cascade_prob, scale_curve.cascade_prob .- scale_curve.cascade_prob_ci_low, scale_curve.cascade_prob_ci_high .- scale_curve.cascade_prob; color=:black, whiskerwidth=8)
    text!(ax, 165, 0.95; text="Dunbar/beyond-human-scale region", fontsize=9, color=PUB_GREY)
    ylims!(ax, 0, 1.05)
    save_revision_figure(fig, outdir, "figure_scale_nonmonotonic")
end

function plot_l_thresholds(summary, outdir)
    d = summary[string.(summary.section) .== "L_thresholds", :]
    keep = ["homogeneous", "lower mean", "higher variance", "mixture pi=1%", "mixture pi=5%", "mixture pi=10%", "equal effort: lower mean", "equal effort: variance", "equal effort: mixture"]
    fig = Figure(size=(1100, 460))
    ax = Axis(fig[1, 1], title="Lower-tail treatments under adequate ignition", xlabel="Treatment", ylabel="Cascade probability", xticklabelrotation=pi / 5)
    xs = Float64[]
    labels = String[]
    vals = Float64[]
    lows = Float64[]
    highs = Float64[]
    colors = RGBf[]
    pos = 0.0
    for degree in sort(unique(d.k))
        for label in keep
            row = d[(d.k .== degree) .& (string.(d.treatment_label) .== label), :]
            nrow(row) == 0 && continue
            pos += 1
            push!(xs, pos)
            push!(labels, string("k=", degree, "\n", label))
            push!(vals, row.cascade_prob[1])
            push!(lows, row.cascade_prob_ci_low[1])
            push!(highs, row.cascade_prob_ci_high[1])
            push!(colors, occursin("mixture", label) ? PUB_NAVY : occursin("variance", label) ? PUB_GREEN : PUB_GREY)
        end
        pos += 0.7
    end
    barplot!(ax, xs, vals; color=colors, width=0.8)
    add_errorbars!(ax, xs, vals, lows, highs)
    ax.xticks = (xs, labels)
    ylims!(ax, 0, 1.05)
    save_revision_figure(fig, outdir, "figure_thresholds_core")
end

function l_verdict(summary, ignition_grid, exposure_summary, scale_curve)
    rows = Dict{Symbol,Any}[]
    c1_rows = summary[(string.(summary.section) .== "L_mechanism") .& (string.(summary.variant) .== "success_original"), :]
    c1 = any((c1_rows.cascade_prob_ci_low .> 0))
    null_rows = summary[(string.(summary.section) .== "L_mechanism") .& in.(string.(summary.variant), Ref(["hazard", "frequency_based"])), :]
    null_ok = isempty(null_rows) ? false : maximum(null_rows.cascade_prob) == 0
    c1 = c1 && null_ok

    exp_rows = exposure_summary[(string.(exposure_summary.section) .== "L_mechanism") .& (string.(exposure_summary.variant) .== "success_original"), :]
    c2 = !isempty(exp_rows) && minimum(exp_rows.successful_exemplar_median) >= 2
    c2_ideal = !isempty(exp_rows) && minimum(exp_rows.successful_exemplar_median) >= 3

    min2 = ignition_grid[string.(ignition_grid.variant) .== "success_min2", :]
    min3 = ignition_grid[string.(ignition_grid.variant) .== "success_min3", :]
    c3 = !isempty(min2) && maximum(min2.cascade_prob_ci_low) > 0
    c3_ideal = !isempty(min3) && maximum(min3.cascade_prob_ci_low) > 0

    scale = l_scale_peak(scale_curve)
    c4 = scale.peak_prob !== missing && scale.human150_prob !== missing && scale.peak_k <= 150 && scale.human150_prob < scale.peak_prob
    if scale.beyond200_prob !== missing
        c4 = c4 && scale.beyond200_prob <= scale.peak_prob
    end

    verdict = c1 && c2 && c3 && c4 ? (c3_ideal && c2_ideal ? "supported" : "partially supported") : "not supported"
    push!(rows, Dict{Symbol,Any}(
        :criterion => "C1 mechanism",
        :passed => c1,
        :detail => string("success rows with CI>0=", sum(c1_rows.cascade_prob_ci_low .> 0), "; max null cascade=", isempty(null_rows) ? "missing" : string(maximum(null_rows.cascade_prob))),
    ))
    push!(rows, Dict{Symbol,Any}(
        :criterion => "C2 reinforcement",
        :passed => c2,
        :detail => isempty(exp_rows) ? "missing exposure rows" : string("minimum median successful exemplars across mechanism cells=", minimum(exp_rows.successful_exemplar_median)),
    ))
    push!(rows, Dict{Symbol,Any}(
        :criterion => "C3 adequate ignition",
        :passed => c3,
        :detail => string("max >=2 lower CI=", isempty(min2) ? "missing" : string(maximum(min2.cascade_prob_ci_low)), "; max >=3 lower CI=", isempty(min3) ? "missing" : string(maximum(min3.cascade_prob_ci_low))),
    ))
    push!(rows, Dict{Symbol,Any}(
        :criterion => "C4 bounded scale",
        :passed => c4,
        :detail => string("peak k=", scale.peak_k, " p=", scale.peak_prob, "; k=150 p=", scale.human150_prob, "; k=200 p=", scale.beyond200_prob),
    ))
    return verdict, DataFrame(rows), scale
end

function write_l_reports(outdir, calibration, summary, ignition_grid, minimum_ignition, scale_curve, exposure_summary, verdict, verdict_table, scale_stats)
    open(joinpath(outdir, "summary.md"), "w") do io
        println(io, "# Experiment L: Ignition and Bounded Observation Scale\n")
        println(io, "All outputs are isolated under `outputs/experiment_L_ignition_and_scale/`. Replacement entrants use `traditional_only`. The optional bounded-observation cap variant was not run in this batch.\n")
        println(io, "## Plain-Language Read\n")
        println(io, "Experiment L tests whether explicit reinforcement rules fail because of ignition rather than because diffusion lacks reinforcement. The verdict is `$(verdict)`. See `verdict.md` for the four pre-registered criteria.\n")
        println(io, "## Calibration\n")
        println(io, markdown_table(calibration; digits=3, maxrows=nrow(calibration)))
        println(io, "\n## Minimum Ignition Table\n")
        println(io, markdown_table(minimum_ignition; digits=3, maxrows=nrow(minimum_ignition)))
        println(io, "\n## Scale Curve\n")
        println(io, markdown_table(scale_curve; digits=3, maxrows=nrow(scale_curve)))
        println(io, "\nScale peak: k=$(scale_stats.peak_k), p=$(scale_stats.peak_prob); k=150 p=$(scale_stats.human150_prob); k=200 p=$(scale_stats.beyond200_prob).\n")
        println(io, "## Exposure Summary\n")
        println(io, markdown_table(exposure_summary; digits=3, maxrows=80))
        println(io, "\n## Full Summary\n")
        println(io, markdown_table(summary; digits=3, maxrows=160))
    end

    open(joinpath(outdir, "verdict.md"), "w") do io
        println(io, "# Experiment L Verdict\n")
        println(io, "**Pre-registered verdict:** $(verdict).\n")
        println(io, markdown_table(verdict_table; digits=3, maxrows=nrow(verdict_table)))
        println(io, "\n## Ignition Threshold\n")
        println(io, markdown_table(minimum_ignition; digits=3, maxrows=nrow(minimum_ignition)))
        println(io, "\n## Scale Bound\n")
        println(io, "The scale curve peaks at k=$(scale_stats.peak_k) with cascade probability $(scale_stats.peak_prob). At k=150 the probability is $(scale_stats.human150_prob); at k=200 it is $(scale_stats.beyond200_prob).")
    end
end

function run_experiment_L(; args=ARGS)
    mode = l_mode_settings(args)
    outdir = ensure_revision_dir(L_OUTPUT_NAME)
    calibration_cells = l_calibration_cells(mode)
    calibration_runs, _ = run_k_cells(calibration_cells, _ -> mode.calibration_reps, mode.settings, mode.seed; experiment="experiment_L_calibration")
    cal_summary = summarize_k_runs(calibration_runs, [:section, :section_label, :k, :beta, :threshold_treatment, :treatment_label, :theta_mean, :seed_fraction, :variant])
    calibration_by_degree, chosen = choose_l_calibration(cal_summary)
    CSV.write(joinpath(outdir, "calibration_sweep_runs.csv"), calibration_runs)
    CSV.write(joinpath(outdir, "calibration_sweep_summary.csv"), cal_summary)
    CSV.write(joinpath(outdir, "calibration_by_degree.csv"), calibration_by_degree)

    cells = l_main_cells(mode, chosen)
    runs, exposures = run_k_cells(cells, l_reps_for(mode), mode.settings, mode.seed + 200_000; experiment=L_OUTPUT_NAME)
    summary = summarize_k_runs(runs, l_summary_groupcols())
    exposure_summary = summarize_k_exposures(exposures)
    ignition_grid = l_ignition_grid(summary)
    minimum_ignition = l_min_ignition_table(ignition_grid)
    scale_curve = l_scale_curve(summary)
    verdict, verdict_table, scale_stats = l_verdict(summary, ignition_grid, exposure_summary, scale_curve)

    CSV.write(joinpath(outdir, "raw_runs.csv"), runs)
    CSV.write(joinpath(outdir, "summary.csv"), summary)
    CSV.write(joinpath(outdir, "ignition_grid.csv"), ignition_grid)
    CSV.write(joinpath(outdir, "minimum_ignition_table.csv"), minimum_ignition)
    CSV.write(joinpath(outdir, "scale_curve.csv"), scale_curve)
    CSV.write(joinpath(outdir, "exposure_at_adoption.csv"), exposures)
    CSV.write(joinpath(outdir, "exposure_summary.csv"), exposure_summary)
    CSV.write(joinpath(outdir, "verdict_table.csv"), verdict_table)

    plot_l_ignition(ignition_grid, outdir)
    plot_l_scale(scale_curve, outdir)
    plot_l_thresholds(summary, outdir)
    plot_k_exposure(exposure_summary, exposures, outdir)
    write_l_reports(outdir, calibration_by_degree, summary, ignition_grid, minimum_ignition, scale_curve, exposure_summary, verdict, verdict_table, scale_stats)
    write_revision_metadata(joinpath(outdir, "metadata.json"), L_OUTPUT_NAME, mode.settings, mode.seed, cells; extra=Dict(
        "mode" => mode.mode,
        "degrees" => mode.degrees,
        "calibration_reps" => mode.calibration_reps,
        "ignition_reps" => mode.ignition_reps,
        "core_reps" => mode.core_reps,
        "scale_reps" => mode.scale_reps,
        "replacement_digital_rule" => "traditional_only",
        "optional_bounded_observation_variant" => "not run",
        "preregistered_verdict" => verdict,
    ))
    return (calibration=calibration_by_degree, summary=summary, ignition_grid=ignition_grid, exposure_summary=exposure_summary, verdict=verdict_table)
end

if abspath(PROGRAM_FILE) == @__FILE__
    run_experiment_L()
end
