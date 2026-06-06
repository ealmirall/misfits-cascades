include(joinpath(@__DIR__, "revision_robustness_common.jl"))

using Distributions

const K_OUTPUT_NAME = "experiment_K_realistic_degree"
const K_BETAS = [0.05, 0.10, 0.20, 0.40, 0.70, 1.00]
const K_CALIBRATION_BETA = 0.70
const K_MIXTURE_PIS = [0.01, 0.05, 0.10]
const K_RULE_VARIANTS = [
    (variant=:success_original, variant_label="fractional success", rule=:complex, success_denominator=:better, min_successful_digital=0, count_k=1),
    (variant=:success_min2, variant_label="fractional success + >=2", rule=:complex, success_denominator=:better, min_successful_digital=2, count_k=1),
    (variant=:success_min3, variant_label="fractional success + >=3", rule=:complex, success_denominator=:better, min_successful_digital=3, count_k=1),
    (variant=:success_all_neighbors, variant_label="all-neighbour denominator", rule=:complex, success_denominator=:all_neighbors, min_successful_digital=0, count_k=1),
    (variant=:count_1, variant_label="count >=1", rule=:count_legacy, success_denominator=:better, min_successful_digital=0, count_k=1),
    (variant=:count_2, variant_label="count >=2", rule=:count_legacy, success_denominator=:better, min_successful_digital=0, count_k=2),
    (variant=:count_3, variant_label="count >=3", rule=:count_legacy, success_denominator=:better, min_successful_digital=0, count_k=3),
]

function k_mode_settings(args=ARGS)
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
    degrees = smoke ? [20] : [20, 50, 100]
    theta_grid = smoke ? [0.65, 0.75, 0.85] : [0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.90, 0.95, 0.9525]
    seed_grid = smoke ? [0.003, 0.01] : [0.001, 0.003, 0.006, 0.010]
    reps_by_degree = Dict(20 => smoke ? 3 : 80, 50 => smoke ? 3 : 80, 100 => smoke ? 3 : 40)
    calibration_reps = smoke ? 2 : 20
    return (
        smoke=smoke,
        mode=smoke ? "smoke" : "production",
        seed=seed,
        settings=settings,
        degrees=degrees,
        theta_grid=theta_grid,
        seed_grid=seed_grid,
        calibration_reps=calibration_reps,
        reps_by_degree=reps_by_degree,
    )
end

function k_cell(;
    section,
    section_label,
    k,
    theta_mean,
    seed_fraction,
    beta=K_CALIBRATION_BETA,
    threshold_treatment=:mixture,
    threshold_params=(theta_mean=theta_mean, pi=0.05, theta_low=0.05),
    treatment_label=string(threshold_treatment),
    rule=:complex,
    variant=:success_original,
    variant_label="success original",
    seed_strategy=:random,
    pioneer_strategy=:random,
    pioneer_count=nothing,
    collect_exposures=false,
    success_denominator=:better,
    min_successful_digital=0,
    min_better_total=0,
    count_k=1,
    network_seed=7001,
)
    base = (
        section=section,
        section_label=section_label,
        family=:small_world,
        beta=beta,
        k=k,
        theta_mean=theta_mean,
        seed_fraction=seed_fraction,
        threshold_treatment=threshold_treatment,
        threshold_params=threshold_params,
        treatment_label=treatment_label,
        rule=rule,
        variant=variant,
        variant_label=variant_label,
        seed_strategy=seed_strategy,
        pioneer_strategy=pioneer_strategy,
        vary_network=false,
        network_seed=network_seed,
        collect_exposures=collect_exposures,
        success_denominator=success_denominator,
        min_successful_digital=min_successful_digital,
        min_better_total=min_better_total,
        count_k=count_k,
        hazard_match_reps=0,
        replacement_digital_rule=:traditional_only,
    )
    if pioneer_count === nothing
        return base
    end
    return merge(base, (pioneer_count=pioneer_count,))
end

function calibration_cells(mode)
    cells = NamedTuple[]
    for k in mode.degrees, theta_mean in mode.theta_grid, seed_fraction in mode.seed_grid
        for (treatment, params, label) in [
            (:homogeneous, (theta_mean=theta_mean,), :homogeneous),
            (:mixture, (theta_mean=theta_mean, pi=0.05, theta_low=0.05), :mixture_pi05),
        ]
            push!(cells, k_cell(
                section=:calibration,
                section_label="calibration",
                k=k,
                theta_mean=theta_mean,
                seed_fraction=seed_fraction,
                beta=K_CALIBRATION_BETA,
                threshold_treatment=treatment,
                threshold_params=params,
                treatment_label=string(label),
                variant=label,
                variant_label=string(label),
                network_seed=7100 + k,
            ))
        end
    end
    return cells
end

function cell_param(cell::NamedTuple, key::Symbol, default=missing)
    hasproperty(cell, key) && return getproperty(cell, key)
    hasproperty(cell, :threshold_params) && hasproperty(cell.threshold_params, key) && return getproperty(cell.threshold_params, key)
    return default
end

function run_k_cell(cell::NamedTuple, reps::Integer, settings, seed_rng, run_counter::Base.RefValue{Int}; experiment=K_OUTPUT_NAME)
    N = cell_param(cell, :N, settings.N)
    graph_params = (
        N=N,
        k=cell.k,
        beta=cell.beta,
        path_samples=settings.path_samples,
    )
    net_rng = MersenneTwister(cell.network_seed)
    graph, net_metrics = build_network(cell.family, graph_params; rng=net_rng)
    rows = Dict{Symbol,Any}[]
    exposure_rows = Dict{Symbol,Any}[]
    for _ in 1:reps
        run_counter[] += 1
        run_index = run_counter[]
        run_seed = rand(seed_rng, 1:typemax(Int32))
        rng = MersenneTwister(run_seed)
        seed_count = seed_count_from_fraction(N, cell.seed_fraction)
        seed_nodes = choose_seeds(graph, seed_count, cell.seed_strategy; rng=rng)
        thresholds, pioneer_nodes, pioneer_strategy, pioneer_count, pioneer_fraction =
            Misfits.prepare_thresholds(graph, cell.threshold_treatment, cell.threshold_params, cell, settings, rng)
        model = make_model(
            graph;
            rng=rng,
            v0=10.0,
            p_digital=0.01,
            seed_nodes=seed_nodes,
            thresholds=thresholds,
            threshold_treatment=cell.threshold_treatment,
            threshold_params=cell.threshold_params,
            rule=cell.rule,
            synchronous=true,
            success_denominator=cell.success_denominator,
            min_successful_digital=cell.min_successful_digital,
            min_better_total=cell.min_better_total,
            hazard_h=0.01,
            count_k=cell.count_k,
            replacement_digital_rule=cell.replacement_digital_rule,
        )
        result = run_model(
            model;
            T=settings.T,
            stall_window=settings.stall_window,
            cascade_transition_window=settings.cascade_transition_window,
            cascade_slope_min=settings.cascade_slope_min,
            cascade_final_cutoff=settings.cascade_final_cutoff,
        )
        row = Dict{Symbol,Any}(
            :experiment => experiment,
            :section => cell.section,
            :section_label => cell.section_label,
            :run_index => run_index,
            :run_seed => run_seed,
            :network_seed => cell.network_seed,
            :family => cell.family,
            :N => N,
            :k => cell.k,
            :beta => cell.beta,
            :rule => cell.rule,
            :variant => cell.variant,
            :variant_label => cell.variant_label,
            :success_denominator => cell.success_denominator,
            :min_successful_digital => cell.min_successful_digital,
            :min_better_total => cell.min_better_total,
            :count_k => cell.count_k,
            :threshold_treatment => cell.threshold_treatment,
            :treatment_label => cell.treatment_label,
            :theta_mean => cell.theta_mean,
            :pi => cell_param(cell.threshold_params, :pi, missing),
            :theta_low => cell_param(cell.threshold_params, :theta_low, missing),
            :theta_low_mean => cell_param(cell.threshold_params, :theta_low_mean, missing),
            :sigma_high => cell_param(cell.threshold_params, :sigma_high, missing),
            :seed_strategy => cell.seed_strategy,
            :seed_count => seed_count,
            :seed_fraction => seed_count / N,
            :pioneer_strategy => pioneer_strategy,
            :pioneer_count => pioneer_count,
            :pioneer_fraction => pioneer_fraction,
            :replacement_digital_rule => cell.replacement_digital_rule,
            :final_adoption => result.final_adoption,
            :cascade => result.cascade,
            :cascade_dynamic70 => result.cascade_dynamic70,
            :cascade_threshold50 => result.cascade_threshold50,
            :t10 => result.t10,
            :t50 => result.t50,
            :t90 => result.t90,
            :transition_time => result.transition_time,
            :max_slope => result.max_slope,
            :max_slope_period => result.max_slope_period,
            :stop_time => result.stop_time,
            :stopped_reason => result.stopped_reason,
            :valuation_cv => result.valuation_cv,
            :total_bankruptcies => result.total_bankruptcies,
            :total_adoptions => result.total_adoptions,
            :adoption_exposure_events => length(result.adoption_log),
        )
        for k2 in keys(net_metrics)
            row[k2] = getproperty(net_metrics, k2)
        end
        push!(rows, row)

        if cell.collect_exposures
            for event in result.adoption_log
                push!(exposure_rows, Dict{Symbol,Any}(
                    :experiment => experiment,
                    :section => cell.section,
                    :section_label => cell.section_label,
                    :run_index => run_index,
                    :run_seed => run_seed,
                    :k => cell.k,
                    :beta => cell.beta,
                    :rule => cell.rule,
                    :variant => cell.variant,
                    :variant_label => cell.variant_label,
                    :threshold_treatment => cell.threshold_treatment,
                    :treatment_label => cell.treatment_label,
                    :theta_mean => cell.theta_mean,
                    :pi => cell_param(cell.threshold_params, :pi, missing),
                    :seed_strategy => cell.seed_strategy,
                    :seed_fraction => seed_count / N,
                    :pioneer_strategy => pioneer_strategy,
                    :replacement_digital_rule => cell.replacement_digital_rule,
                    :t => event.t,
                    :agent_id => event.agent_id,
                    :node => event.node,
                    :better_count => event.better_count,
                    :successful_digital_count => event.successful_digital_count,
                    :exposure_denominator => event.exposure_denominator,
                    :exposure_share => event.exposure_share,
                    :threshold => event.threshold,
                    :success_denominator => event.success_denominator,
                    :min_successful_digital => event.min_successful_digital,
                    :min_better_total => event.min_better_total,
                ))
            end
        end
    end
    return rows, exposure_rows
end

function run_k_cells(cells::Vector{<:NamedTuple}, reps_for_cell, settings, seed::Integer; experiment=K_OUTPUT_NAME)
    seed_rng = MersenneTwister(seed)
    rows = Dict{Symbol,Any}[]
    exposures = Dict{Symbol,Any}[]
    run_counter = Ref(0)
    @showprogress 1 "realistic-degree $experiment" for cell in cells
        reps = reps_for_cell(cell)
        cell_rows, cell_exposures = run_k_cell(cell, reps, settings, seed_rng, run_counter; experiment=experiment)
        append!(rows, cell_rows)
        append!(exposures, cell_exposures)
    end
    return DataFrame(rows), DataFrame(exposures)
end

function summarize_k_runs(df::DataFrame, groupcols::Vector{Symbol})
    summary = summarize_revision_runs(df, groupcols)
    sort!(summary, groupcols)
    return summary
end

function summarize_k_exposures(exposures::DataFrame)
    isempty(exposures) && return DataFrame()
    groupcols = [:section, :section_label, :k, :beta, :variant, :variant_label, :threshold_treatment, :treatment_label, :theta_mean, :pi, :seed_strategy, :pioneer_strategy]
    summary = combine(
        groupby(exposures, groupcols),
        :successful_digital_count => median => :successful_exemplar_median,
        :successful_digital_count => (x -> quantile_or_missing(x, 0.05)) => :successful_exemplar_p05,
        :successful_digital_count => (x -> quantile_or_missing(x, 0.95)) => :successful_exemplar_p95,
        :better_count => median => :better_count_median,
        :better_count => (x -> quantile_or_missing(x, 0.05)) => :better_count_p05,
        :better_count => (x -> quantile_or_missing(x, 0.95)) => :better_count_p95,
        :exposure_share => median => :exposure_share_median,
        :threshold => median => :threshold_median,
        nrow => :n_adoptions,
    )
    sort!(summary, groupcols)
    return summary
end

function choose_calibration(calibration_summary::DataFrame)
    chosen = Dict{Int,NamedTuple}()
    rows = Dict{Symbol,Any}[]
    for k in sort(unique(calibration_summary.k))
        d = calibration_summary[(calibration_summary.k .== k) .& (string.(calibration_summary.threshold_treatment) .== "homogeneous"), :]
        d.score = abs.(d.cascade_prob .- 0.30)
        d.neg_theta_mean = -d.theta_mean
        sort!(d, [:score, :seed_fraction, :neg_theta_mean])
        choice = d[1, :]
        mix = calibration_summary[
            (calibration_summary.k .== k) .&
            (string.(calibration_summary.threshold_treatment) .== "mixture") .&
            (calibration_summary.theta_mean .== choice.theta_mean) .&
            (calibration_summary.seed_fraction .== choice.seed_fraction),
            :,
        ]
        mixture_prob = nrow(mix) == 0 ? missing : mix.cascade_prob[1]
        in_target = 0.20 <= choice.cascade_prob <= 0.40
        row = Dict{Symbol,Any}(
            :k => k,
            :theta_mean => choice.theta_mean,
            :seed_fraction => choice.seed_fraction,
            :homogeneous_cascade_prob => choice.cascade_prob,
            :homogeneous_ci_low => choice.cascade_prob_ci_low,
            :homogeneous_ci_high => choice.cascade_prob_ci_high,
            :mixture_pi05_cascade_prob => mixture_prob,
            :target_hit => in_target,
            :selection_note => in_target ? "homogeneous baseline in 0.2-0.4 target band" : "nearest homogeneous baseline to 0.3",
        )
        push!(rows, row)
        chosen[Int(k)] = (k=Int(k), theta_mean=Float64(choice.theta_mean), seed_fraction=Float64(choice.seed_fraction))
    end
    return DataFrame(rows), chosen
end

function main_cells_from_calibration(mode, chosen::Dict{Int,<:NamedTuple})
    cells = NamedTuple[]
    for degree in mode.degrees
        cal = chosen[degree]
        theta = cal.theta_mean
        seed_fraction = cal.seed_fraction
        for (rule, variant, label) in [
            (:hazard, :hazard, "hazard"),
            (:simple, :frequency_based, "frequency-based"),
            (:complex, :success_original, "performance-conditioned"),
        ]
            push!(cells, k_cell(
                section=:K_A_mechanism,
                section_label="K-A mechanism",
                k=degree,
                theta_mean=theta,
                seed_fraction=seed_fraction,
                beta=K_CALIBRATION_BETA,
                threshold_treatment=:mixture,
                threshold_params=(theta_mean=theta, pi=0.05, theta_low=0.05),
                treatment_label="mixture pi=5%",
                rule=rule,
                variant=variant,
                variant_label=label,
                collect_exposures=rule == :complex,
                network_seed=7200 + degree,
            ))
        end

        for beta in K_BETAS
            push!(cells, k_cell(
                section=:K_B_topology,
                section_label="K-B beta sweep",
                k=degree,
                theta_mean=theta,
                seed_fraction=seed_fraction,
                beta=beta,
                threshold_treatment=:mixture,
                threshold_params=(theta_mean=theta, pi=0.05, theta_low=0.05),
                treatment_label="mixture pi=5%",
                rule=:complex,
                variant=Symbol("beta_", replace(string(beta), "." => "p")),
                variant_label=@sprintf("beta %.2f", beta),
                collect_exposures=false,
                network_seed=7300 + degree + round(Int, 100 * beta),
            ))
        end

        lower_mean = max(theta - 0.05, 0.0)
        sigma_high = 0.15
        effort_budget = 0.05
        equal_sigma = effort_budget * sqrt(pi / 2)
        equal_pi = clamp(effort_budget / (2 * max(theta - 0.05, eps())), 0.005, 0.20)
        treatments = [
            (:homogeneous, (theta_mean=theta,), "homogeneous", :homogeneous),
            (:lower_mean, (theta_mean=theta, theta_low_mean=lower_mean), "lower mean", :lower_mean),
            (:higher_variance, (theta_mean=theta, sigma_high=sigma_high), "higher variance", :higher_variance),
        ]
        for pi_val in K_MIXTURE_PIS
            push!(treatments, (:mixture, (theta_mean=theta, pi=pi_val, theta_low=0.05), @sprintf("mixture pi=%.0f%%", 100 * pi_val), Symbol("mixture_pi_", round(Int, 100 * pi_val))))
        end
        append!(treatments, [
            (:lower_mean, (theta_mean=theta, theta_low_mean=max(theta - effort_budget, 0.0)), "equal effort: lower mean", :equal_lower_mean),
            (:higher_variance, (theta_mean=theta, sigma_high=equal_sigma), "equal effort: variance", :equal_higher_variance),
            (:mixture, (theta_mean=theta, pi=equal_pi, theta_low=0.05), "equal effort: mixture", :equal_mixture),
        ])
        for (treatment, params, label, variant) in treatments
            push!(cells, k_cell(
                section=:K_C_thresholds,
                section_label="K-C thresholds",
                k=degree,
                theta_mean=theta,
                seed_fraction=seed_fraction,
                beta=K_CALIBRATION_BETA,
                threshold_treatment=treatment,
                threshold_params=params,
                treatment_label=label,
                rule=:complex,
                variant=variant,
                variant_label=label,
                collect_exposures=true,
                network_seed=7400 + degree,
            ))
        end

        for rv in K_RULE_VARIANTS
            push!(cells, k_cell(
                section=:K_G_rule_robustness,
                section_label="K-G rule robustness",
                k=degree,
                theta_mean=theta,
                seed_fraction=seed_fraction,
                beta=K_CALIBRATION_BETA,
                threshold_treatment=:mixture,
                threshold_params=(theta_mean=theta, pi=0.05, theta_low=0.05),
                treatment_label="mixture pi=5%",
                rule=rv.rule,
                variant=rv.variant,
                variant_label=rv.variant_label,
                success_denominator=rv.success_denominator,
                min_successful_digital=rv.min_successful_digital,
                count_k=rv.count_k,
                collect_exposures=rv.rule == :complex && rv.success_denominator == :better,
                network_seed=7500 + degree,
            ))
        end

        if degree in (20, 50)
            pioneer_count = seed_count_from_fraction(mode.settings.N, 0.05)
            for seed_strategy in (:random, :hub_bridge, :clustered), pioneer_strategy in (:random, :hub_bridge, :clustered)
                push!(cells, k_cell(
                    section=:K_P_placement,
                    section_label="K-P placement",
                    k=degree,
                    theta_mean=theta,
                    seed_fraction=seed_fraction,
                    beta=K_CALIBRATION_BETA,
                    threshold_treatment=:mixture,
                    threshold_params=(theta_mean=theta, pi=0.05, theta_low=0.05),
                    treatment_label="mixture pi=5%",
                    rule=:complex,
                    variant=Symbol("seed_", seed_strategy, "_pioneer_", pioneer_strategy),
                    variant_label=string("seed=", seed_strategy, "; pioneer=", pioneer_strategy),
                    seed_strategy=seed_strategy,
                    pioneer_strategy=pioneer_strategy,
                    pioneer_count=pioneer_count,
                    collect_exposures=false,
                    network_seed=7600 + degree,
                ))
            end
        end
    end
    return cells
end

function k_reps_for(mode)
    return cell -> mode.reps_by_degree[Int(cell.k)]
end

function interpolate_beta_star(beta, p)
    order = sortperm(beta)
    b = beta[order]
    y = p[order]
    for i in 1:length(b)-1
        if (y[i] <= 0.5 <= y[i+1]) || (y[i] >= 0.5 >= y[i+1])
            y[i] == y[i+1] && return b[i]
            return b[i] + (0.5 - y[i]) * (b[i+1] - b[i]) / (y[i+1] - y[i])
        end
    end
    return missing
end

function beta_star_table(summary::DataFrame; nboot=1000, seed=17)
    rows = Dict{Symbol,Any}[]
    rng = MersenneTwister(seed)
    topo = summary[string.(summary.section) .== "K_B_topology", :]
    for k in sort(unique(topo.k))
        d = topo[topo.k .== k, :]
        beta = Float64.(d.beta)
        p = Float64.(d.cascade_prob)
        n = Int.(d.n_runs)
        star = interpolate_beta_star(beta, p)
        boot = Float64[]
        for _ in 1:nboot
            sampled = [rand(rng, Binomial(n[i], p[i])) / n[i] for i in eachindex(p)]
            b = interpolate_beta_star(beta, sampled)
            b === missing || push!(boot, b)
        end
        push!(rows, Dict{Symbol,Any}(
            :k => k,
            :beta_star => star,
            :beta_star_ci_low => isempty(boot) ? missing : quantile(boot, 0.05),
            :beta_star_ci_high => isempty(boot) ? missing : quantile(boot, 0.95),
            :bootstrap_draws_with_crossing => length(boot),
        ))
    end
    return DataFrame(rows)
end

function before_after_table(summary::DataFrame, output_root::AbstractString)
    rows = Dict{Symbol,Any}[]
    g_path = joinpath(dirname(output_root), "experiment_G_success_rule_robustness", "summary.csv")
    if isfile(g_path)
        G = CSV.read(g_path, DataFrame)
        for variant in (:success_original, :success_min2, :success_min3)
            d = G[(string.(G.setting) .== "experiment_A") .& (string.(G.variant) .== string(variant)), :]
            if nrow(d) > 0
                push!(rows, Dict{Symbol,Any}(
                    :k => 4,
                    :source => "Experiment G k=4 Exp A focal",
                    :variant => variant,
                    :cascade_prob => d.cascade_prob[1],
                    :cascade_prob_ci_low => d.cascade_prob_ci_low[1],
                    :cascade_prob_ci_high => d.cascade_prob_ci_high[1],
                    :n_runs => d.n_runs[1],
                    :replacement_digital_rule => "bernoulli_seed_probability",
                ))
            end
        end
    end
    kg = summary[string.(summary.section) .== "K_G_rule_robustness", :]
    for row in eachrow(kg)
        if string(row.variant) in ("success_original", "success_min2", "success_min3")
            push!(rows, Dict{Symbol,Any}(
                :k => row.k,
                :source => "Experiment K realistic degree",
                :variant => row.variant,
                :cascade_prob => row.cascade_prob,
                :cascade_prob_ci_low => row.cascade_prob_ci_low,
                :cascade_prob_ci_high => row.cascade_prob_ci_high,
                :n_runs => row.n_runs,
                :replacement_digital_rule => row.replacement_digital_rule,
            ))
        end
    end
    return DataFrame(rows)
end

function plot_k_mechanism(summary::DataFrame, outdir::AbstractString)
    d = summary[string.(summary.section) .== "K_A_mechanism", :]
    degrees = sort(unique(d.k))
    rules = [:hazard, :frequency_based, :success_original]
    fig = Figure(size=(900, 420))
    ax = Axis(fig[1, 1], title="Realistic degree: success-conditioned rule vs nulls", xlabel="Degree and rule", ylabel="Dynamic cascade probability")
    xs = Float64[]
    vals = Float64[]
    lows = Float64[]
    highs = Float64[]
    labels = String[]
    colors = RGBf[]
    pos = 0.0
    for k in degrees
        for rule in rules
            row = d[(d.k .== k) .& (string.(d.variant) .== string(rule)), :]
            nrow(row) == 0 && continue
            pos += 1
            push!(xs, pos)
            push!(vals, row.cascade_prob[1])
            push!(lows, row.cascade_prob_ci_low[1])
            push!(highs, row.cascade_prob_ci_high[1])
            push!(labels, string("k=", k, "\n", rule == :success_original ? "success" : rule))
            push!(colors, rule == :success_original ? PUB_NAVY : rule == :frequency_based ? PUB_ORANGE : PUB_GREY)
        end
        pos += 0.6
    end
    barplot!(ax, xs, vals; color=colors, width=0.8)
    add_errorbars!(ax, xs, vals, lows, highs)
    ax.xticks = (xs, labels)
    ylims!(ax, 0, 1.05)
    save_revision_figure(fig, outdir, "mechanism_by_rule_realistic_degree")
end

function plot_k_beta(summary::DataFrame, beta_star::DataFrame, outdir::AbstractString)
    d = summary[string.(summary.section) .== "K_B_topology", :]
    fig = Figure(size=(900, 470))
    ax = Axis(fig[1, 1], title="Network reach frontier at realistic degree", xlabel="Small-world beta", ylabel="Dynamic cascade probability", xscale=log10, xticks=(K_BETAS, string.(K_BETAS)))
    palette = Dict(20 => PUB_NAVY, 50 => PUB_ORANGE, 100 => PUB_GREEN)
    for k in sort(unique(d.k))
        dk = sort(d[d.k .== k, :], :beta)
        lines!(ax, dk.beta, dk.cascade_prob; color=palette[Int(k)], linewidth=2, label="k=$k")
        scatter!(ax, dk.beta, dk.cascade_prob; color=palette[Int(k)], markersize=10)
        star = beta_star[beta_star.k .== k, :]
        if nrow(star) > 0 && star.beta_star[1] !== missing
            vlines!(ax, [star.beta_star[1]]; color=palette[Int(k)], linestyle=:dash)
        end
    end
    hlines!(ax, [0.5]; color=:black, linestyle=:dot)
    axislegend(ax; position=:rb, framevisible=false)
    ylims!(ax, 0, 1.05)
    save_revision_figure(fig, outdir, "beta_sweep_realistic_degree")
end

function plot_k_thresholds(summary::DataFrame, outdir::AbstractString)
    d = summary[string.(summary.section) .== "K_C_thresholds", :]
    keep = ["homogeneous", "lower mean", "higher variance", "mixture pi=1%", "mixture pi=5%", "mixture pi=10%", "equal effort: lower mean", "equal effort: variance", "equal effort: mixture"]
    d = d[in.(string.(d.treatment_label), Ref(keep)), :]
    fig = Figure(size=(1120, 520))
    ax = Axis(fig[1, 1], title="Threshold lower tails at realistic degree", xlabel="Treatment", ylabel="Dynamic cascade probability", xticklabelrotation=pi / 5)
    xs = Float64[]
    vals = Float64[]
    lows = Float64[]
    highs = Float64[]
    labels = String[]
    colors = RGBf[]
    pos = 0.0
    for k in sort(unique(d.k))
        for label in keep
            row = d[(d.k .== k) .& (string.(d.treatment_label) .== label), :]
            nrow(row) == 0 && continue
            pos += 1
            push!(xs, pos)
            push!(vals, row.cascade_prob[1])
            push!(lows, row.cascade_prob_ci_low[1])
            push!(highs, row.cascade_prob_ci_high[1])
            push!(labels, string("k=", k, "\n", label))
            push!(colors, occursin("mixture", label) ? PUB_NAVY : occursin("variance", label) ? PUB_GREEN : PUB_GREY)
        end
        pos += 0.8
    end
    barplot!(ax, xs, vals; color=colors, width=0.8)
    add_errorbars!(ax, xs, vals, lows, highs)
    ax.xticks = (xs, labels)
    ylims!(ax, 0, 1.05)
    save_revision_figure(fig, outdir, "threshold_treatments_realistic_degree")
end

function plot_k_rule_robustness(summary::DataFrame, outdir::AbstractString)
    d = summary[string.(summary.section) .== "K_G_rule_robustness", :]
    order = [:success_original, :success_min2, :success_min3, :success_all_neighbors, :count_1, :count_2, :count_3]
    fig = Figure(size=(980, 460))
    ax = Axis(fig[1, 1], title="Does the cascade survive explicit reinforcement?", xlabel="Rule variant", ylabel="Dynamic cascade probability", xticklabelrotation=pi / 6)
    xs = Float64[]
    vals = Float64[]
    lows = Float64[]
    highs = Float64[]
    labels = String[]
    colors = RGBf[]
    pos = 0.0
    for k in sort(unique(d.k))
        for variant in order
            row = d[(d.k .== k) .& (string.(d.variant) .== string(variant)), :]
            nrow(row) == 0 && continue
            pos += 1
            push!(xs, pos)
            push!(vals, row.cascade_prob[1])
            push!(lows, row.cascade_prob_ci_low[1])
            push!(highs, row.cascade_prob_ci_high[1])
            push!(labels, string("k=", k, "\n", row.variant_label[1]))
            push!(colors, occursin("count", string(variant)) ? PUB_GREEN : variant == :success_all_neighbors ? PUB_ORANGE : PUB_NAVY)
        end
        pos += 0.8
    end
    barplot!(ax, xs, vals; color=colors, width=0.8)
    add_errorbars!(ax, xs, vals, lows, highs)
    ax.xticks = (xs, labels)
    ylims!(ax, 0, 1.05)
    save_revision_figure(fig, outdir, "rule_robustness_realistic_degree")
end

function plot_k_exposure(exposure_summary::DataFrame, exposures::DataFrame, outdir::AbstractString)
    isempty(exposures) && return
    focal = exposures[(string.(exposures.section) .== "K_A_mechanism") .& (string.(exposures.variant) .== "success_original"), :]
    if isempty(focal)
        focal = exposures[string.(exposures.variant) .== "success_original", :]
    end
    fig = Figure(size=(820, 420))
    ax = Axis(fig[1, 1], title="Successful exemplars observed at adoption", xlabel="Successful digital neighbours in B_i", ylabel="Adoption events")
    colors = Dict(20 => PUB_NAVY, 50 => PUB_ORANGE, 100 => PUB_GREEN)
    for k in sort(unique(focal.k))
        vals = focal[focal.k .== k, :successful_digital_count]
        isempty(vals) && continue
        hist!(ax, vals; bins=0:1:(maximum(vals) + 1), normalization=:probability, color=(colors[Int(k)], 0.35), label="k=$k")
    end
    axislegend(ax; position=:rt, framevisible=false)
    save_revision_figure(fig, outdir, "successful_exemplar_histogram")
end

function write_k_summary_md(outdir, calibration, summary, exposure_summary, beta_star, before_after)
    open(joinpath(outdir, "summary.md"), "w") do io
        println(io, "# Experiment K: Realistic-Degree Re-Run\n")
        println(io, "All outputs are isolated under `outputs/experiment_K_realistic_degree/`. Replacement entrants use `traditional_only` in Experiment K.\n")
        println(io, "## Calibrated Regimes\n")
        println(io, markdown_table(calibration; digits=3))
        println(io, "\n## Beta Tipping Estimates\n")
        println(io, markdown_table(beta_star; digits=3))
        println(io, "\n## Before/After k=4 vs Realistic Degree\n")
        println(io, markdown_table(before_after; digits=3))
        println(io, "\n## Exposure Summary\n")
        println(io, markdown_table(exposure_summary; digits=3, maxrows=40))
        println(io, "\n## Run Summary\n")
        println(io, markdown_table(summary; digits=3, maxrows=120))
    end
end

function criterion_verdict(summary::DataFrame, exposure_summary::DataFrame)
    rows = Dict{Symbol,Any}[]
    overall = "not supported"
    for k in sort(unique(summary.k))
        ka_success = val_or_missing(summary, :section => :K_A_mechanism, :k => k, :variant => :success_original)
        ka_success_low = val_or_missing(summary, :section => :K_A_mechanism, :k => k, :variant => :success_original; col=:cascade_prob_ci_low)
        ka_hazard = val_or_missing(summary, :section => :K_A_mechanism, :k => k, :variant => :hazard)
        ka_simple = val_or_missing(summary, :section => :K_A_mechanism, :k => k, :variant => :frequency_based)
        exp_med = val_or_missing(exposure_summary, :section => :K_A_mechanism, :k => k, :variant => :success_original; col=:successful_exemplar_median)
        min2 = val_or_missing(summary, :section => :K_G_rule_robustness, :k => k, :variant => :success_min2)
        min3 = val_or_missing(summary, :section => :K_G_rule_robustness, :k => k, :variant => :success_min3)
        c1 = ka_success !== missing && ka_success_low !== missing && ka_success > 0 && ka_success_low > 0 && ka_hazard == 0 && ka_simple == 0
        c2 = exp_med !== missing && exp_med >= 2
        c3 = min2 !== missing && min2 >= 0.10
        c3_ideal = min3 !== missing && min3 >= 0.10
        verdict =
            c1 && c2 && c3_ideal ? "supported" :
            c1 && c2 && c3 ? "partially supported" :
            "not supported"
        if verdict == "supported"
            overall = "supported"
        elseif verdict == "partially supported" && overall != "supported"
            overall = "partially supported"
        end
        push!(rows, Dict{Symbol,Any}(
            :k => k,
            :criterion1_cascades_vs_nulls => c1,
            :success_cascade_prob => ka_success,
            :hazard_cascade_prob => ka_hazard,
            :frequency_cascade_prob => ka_simple,
            :criterion2_median_successful_exemplars_ge2 => c2,
            :median_successful_exemplars => exp_med,
            :criterion3_min2_survives => c3,
            :min2_cascade_prob => min2,
            :min3_cascade_prob => min3,
            :degree_verdict => verdict,
        ))
    end
    return overall, DataFrame(rows)
end

function val_or_missing(df::DataFrame, filters::Pair...; col=:cascade_prob)
    isempty(df) && return missing
    mask = trues(nrow(df))
    for (c, v) in filters
        mask .&= string.(df[!, c]) .== string(v)
    end
    rows = df[mask, :]
    nrow(rows) == 0 && return missing
    return rows[1, col]
end

function write_verdict(outdir, overall, verdict_table, calibration_by_degree)
    open(joinpath(outdir, "verdict.md"), "w") do io
        println(io, "# Experiment K Verdict\n")
        println(io, "**Pre-registered verdict:** $(overall).\n")
        println(io, "Criterion 1 requires performance-conditioned cascades with Wilson lower bound excluding 0 while hazard and frequency nulls do not cascade. Criterion 2 requires median successful digital neighbours at adoption >= 2. Criterion 3 requires the explicit >=2 successful-digital rule not to collapse to approximately zero; >=3 survival is treated as the stronger ideal.\n")
        if any(.!calibration_by_degree.target_hit)
            println(io, "**Calibration warning:** at least one realistic-degree calibration did not hit the pre-specified homogeneous baseline target band of 0.2-0.4. The selected cell is the nearest conservative grid point; see `calibration_by_degree.csv`.\n")
        end
        println(io, markdown_table(verdict_table; digits=3))
        println(io, "\nInterpretive note: `partially supported` means the realistic-degree model has direct reinforcement at adoption and survives >=2, but not the stricter >=3 ideal. `not supported` means at least one required criterion fails.")
    end
end

function run_experiment_K(; args=ARGS)
    mode = k_mode_settings(args)
    outdir = ensure_revision_dir(K_OUTPUT_NAME)
    calibration = calibration_cells(mode)
    cal_runs, _ = run_k_cells(calibration, _ -> mode.calibration_reps, mode.settings, mode.seed; experiment="experiment_K_calibration")
    cal_groupcols = [:section, :k, :beta, :threshold_treatment, :treatment_label, :theta_mean, :seed_fraction, :variant]
    cal_summary = summarize_k_runs(cal_runs, cal_groupcols)
    calibration_by_degree, chosen = choose_calibration(cal_summary)
    CSV.write(joinpath(outdir, "calibration_sweep_runs.csv"), cal_runs)
    CSV.write(joinpath(outdir, "calibration_sweep_summary.csv"), cal_summary)
    CSV.write(joinpath(outdir, "calibration_by_degree.csv"), calibration_by_degree)

    cells = main_cells_from_calibration(mode, chosen)
    runs, exposures = run_k_cells(cells, k_reps_for(mode), mode.settings, mode.seed + 100_000; experiment=K_OUTPUT_NAME)
    groupcols = [:section, :section_label, :k, :beta, :rule, :variant, :variant_label, :success_denominator, :min_successful_digital, :count_k, :threshold_treatment, :treatment_label, :theta_mean, :pi, :seed_strategy, :pioneer_strategy, :replacement_digital_rule]
    summary = summarize_k_runs(runs, groupcols)
    exposure_summary = summarize_k_exposures(exposures)
    beta_star = beta_star_table(summary; seed=mode.seed + 77)
    before_after = before_after_table(summary, outdir)
    overall, verdict_table = criterion_verdict(summary, exposure_summary)

    CSV.write(joinpath(outdir, "raw_runs.csv"), runs)
    CSV.write(joinpath(outdir, "summary.csv"), summary)
    CSV.write(joinpath(outdir, "exposure_at_adoption.csv"), exposures)
    CSV.write(joinpath(outdir, "exposure_summary.csv"), exposure_summary)
    CSV.write(joinpath(outdir, "beta_star.csv"), beta_star)
    CSV.write(joinpath(outdir, "before_after_min_count.csv"), before_after)
    CSV.write(joinpath(outdir, "verdict_table.csv"), verdict_table)

    plot_k_mechanism(summary, outdir)
    plot_k_beta(summary, beta_star, outdir)
    plot_k_thresholds(summary, outdir)
    plot_k_rule_robustness(summary, outdir)
    plot_k_exposure(exposure_summary, exposures, outdir)
    write_k_summary_md(outdir, calibration_by_degree, summary, exposure_summary, beta_star, before_after)
    write_verdict(outdir, overall, verdict_table, calibration_by_degree)
    write_revision_metadata(joinpath(outdir, "metadata.json"), K_OUTPUT_NAME, mode.settings, mode.seed, cells; extra=Dict(
        "mode" => mode.mode,
        "degrees" => mode.degrees,
        "calibration_reps" => mode.calibration_reps,
        "reps_by_degree" => mode.reps_by_degree,
        "replacement_digital_rule" => "traditional_only",
        "preregistered_verdict" => overall,
    ))
    return (calibration=calibration_by_degree, summary=summary, exposure_summary=exposure_summary, verdict=verdict_table)
end

if abspath(PROGRAM_FILE) == @__FILE__
    run_experiment_K()
end
