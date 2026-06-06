const SMALL_WORLD_BETAS = [0.001, 0.005, 0.01, 0.05, 0.1, 0.2, 0.4, 0.7, 1.0]
const BA_MS = [2, 3, 5, 8, 12]
const MIXTURE_PIS = [0.01, 0.03, 0.05, 0.10]

function ensure_output_dirs(root::AbstractString=pwd())
    mkpath(joinpath(root, "results"))
    mkpath(joinpath(root, "figures"))
    return nothing
end

function parse_common_args(args=ARGS)
    quick = !("--full" in args)
    seed = 20260603
    seed_idx = findfirst(==("--seed"), args)
    if seed_idx !== nothing && seed_idx < length(args)
        seed = parse(Int, args[seed_idx + 1])
    end
    return (quick=quick, seed=seed, mode=quick ? "quick" : "full")
end

function quick_settings()
    return (
        N=500,
        T=100,
        n_coarse=20,
        n_refine=40,
        n_focal=60,
        stall_window=20,
        seed_fraction=0.003,
        k=4,
        theta_mean=0.70,
        path_samples=80,
        cascade_transition_window=45,
        cascade_slope_min=0.02,
        cascade_final_cutoff=0.5,
        hazard_match_reps=1,
    )
end

function full_settings()
    return (
        N=1000,
        T=100,
        n_coarse=50,
        n_refine=250,
        n_focal=1000,
        stall_window=20,
        seed_fraction=0.003,
        k=4,
        theta_mean=0.70,
        path_samples=100,
        cascade_transition_window=45,
        cascade_slope_min=0.02,
        cascade_final_cutoff=0.5,
        hazard_match_reps=1,
    )
end

function ntget(nt::NamedTuple, key::Symbol, default)
    return hasproperty(nt, key) ? getproperty(nt, key) : default
end

function merge_nt(a::NamedTuple, b::NamedTuple)
    return merge(a, b)
end

function cell_key(cell::NamedTuple)
    return join(string(k, "=", getproperty(cell, k)) for k in sort(collect(keys(cell))))
end

function make_cell_id(i::Integer, cell::NamedTuple)
    return string("cell_", lpad(i, 3, "0"), "_", hash(cell_key(cell)))
end

function prepare_thresholds(graph, threshold_treatment::Symbol, threshold_params::NamedTuple, cell::NamedTuple, settings::NamedTuple, rng)
    N = nv(graph)
    if threshold_treatment == :mixture
        pioneer_fraction = ntget(cell, :pioneer_fraction, ntget(threshold_params, :pioneer_fraction, ntget(threshold_params, :pi, 0.05)))
        pioneer_count = ntget(cell, :pioneer_count, seed_count_from_fraction(N, pioneer_fraction))
        pioneer_strategy = ntget(cell, :pioneer_strategy, :random)
        pioneer_nodes = choose_pioneers(graph, pioneer_count, pioneer_strategy; rng=rng)
        params = merge(threshold_params, (pioneer_fraction=pioneer_count / N,))
        return mixture_thresholds_with_pioneers(N, params, pioneer_nodes), pioneer_nodes, pioneer_strategy, pioneer_count, pioneer_count / N
    else
        return draw_thresholds(threshold_treatment, N, threshold_params; rng=rng), Int[], :none, 0, 0.0
    end
end

function matched_hazard_final(
    graph,
    seed_nodes,
    thresholds,
    cell::NamedTuple,
    settings::NamedTuple,
    run_seed::Integer,
)
    reps = ntget(cell, :hazard_match_reps, ntget(settings, :hazard_match_reps, 1))
    reps <= 0 && return missing
    finals = Float64[]
    for rep in 1:reps
        rng = MersenneTwister(run_seed + 9176 + rep)
        model = make_model(
            graph;
            rng=rng,
            v0=ntget(cell, :v0, 10.0),
            p_digital=ntget(cell, :p_digital, 0.01),
            seed_nodes=seed_nodes,
            thresholds=thresholds,
            threshold_treatment=ntget(cell, :threshold_treatment, :mixture),
            threshold_params=ntget(cell, :threshold_params, (theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05)),
            rule=:hazard,
            synchronous=ntget(cell, :synchronous, true),
            success_denominator=ntget(cell, :success_denominator, :better),
            min_successful_digital=ntget(cell, :min_successful_digital, 0),
            min_better_total=ntget(cell, :min_better_total, 0),
            hazard_h=ntget(cell, :hazard_h, 0.01),
            traditional_growth_mean=ntget(cell, :traditional_growth_mean, 0.15),
            traditional_growth_sd=ntget(cell, :traditional_growth_sd, 0.10),
            digital_growth_mean=ntget(cell, :digital_growth_mean, 1.50),
            digital_growth_sd=ntget(cell, :digital_growth_sd, 1.00),
            return_distribution=ntget(cell, :return_distribution, :normal),
            performance_benchmark=ntget(cell, :performance_benchmark, :own),
            benchmark_percentile=ntget(cell, :benchmark_percentile, 0.75),
            allow_abandonment=ntget(cell, :allow_abandonment, false),
            abandonment_h=ntget(cell, :abandonment_h, 0.0),
            replacement_digital_rule=ntget(cell, :replacement_digital_rule, :bernoulli_seed_probability),
        )
        result = run_model(
            model;
            T=settings.T,
            stall_window=settings.stall_window,
            cascade_transition_window=ntget(settings, :cascade_transition_window, 45),
            cascade_slope_min=ntget(settings, :cascade_slope_min, 0.02),
            cascade_final_cutoff=ntget(settings, :cascade_final_cutoff, 0.5),
        )
        push!(finals, result.final_adoption)
    end
    return mean(finals)
end

function run_single(cell::NamedTuple, run_seed::Integer, run_index::Integer, phase::String, settings::NamedTuple, experiment::String)
    rng = MersenneTwister(run_seed)
    vary_network = ntget(cell, :vary_network, true)
    network_seed = vary_network ? run_seed : ntget(cell, :network_seed, run_seed)
    net_rng = MersenneTwister(network_seed)
    N = ntget(cell, :N, settings.N)
    k = ntget(cell, :k, settings.k)
    family = ntget(cell, :family, :small_world)
    graph_params = (
        N=N,
        k=k,
        beta=ntget(cell, :beta, 0.1),
        m=ntget(cell, :m, max(1, round(Int, k / 2))),
        path_samples=ntget(cell, :path_samples, settings.path_samples),
    )
    graph, net_metrics = build_network(family, graph_params; rng=net_rng)
    seed_count = ntget(cell, :seed_count, seed_count_from_fraction(N, ntget(cell, :seed_fraction, settings.seed_fraction)))
    seed_strategy = ntget(cell, :seed_strategy, :random)
    seed_nodes = choose_seeds(graph, seed_count, seed_strategy; rng=rng)
    threshold_treatment = ntget(cell, :threshold_treatment, :mixture)
    threshold_params = ntget(cell, :threshold_params, (theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05))
    thresholds, pioneer_nodes, pioneer_strategy, pioneer_count, pioneer_fraction = prepare_thresholds(graph, threshold_treatment, threshold_params, cell, settings, rng)
    model = make_model(
        graph;
        rng=rng,
        v0=ntget(cell, :v0, 10.0),
        p_digital=ntget(cell, :p_digital, 0.01),
        seed_nodes=seed_nodes,
        thresholds=thresholds,
        threshold_treatment=threshold_treatment,
        threshold_params=threshold_params,
        rule=ntget(cell, :rule, :complex),
        synchronous=ntget(cell, :synchronous, true),
        performance_weighted=ntget(cell, :performance_weighted, false),
        success_denominator=ntget(cell, :success_denominator, :better),
        min_successful_digital=ntget(cell, :min_successful_digital, 0),
        min_better_total=ntget(cell, :min_better_total, 0),
        hazard_h=ntget(cell, :hazard_h, 0.01),
        count_k=ntget(cell, :count_k, 1),
        traditional_growth_mean=ntget(cell, :traditional_growth_mean, 0.15),
        traditional_growth_sd=ntget(cell, :traditional_growth_sd, 0.10),
        digital_growth_mean=ntget(cell, :digital_growth_mean, 1.50),
        digital_growth_sd=ntget(cell, :digital_growth_sd, 1.00),
        return_distribution=ntget(cell, :return_distribution, :normal),
        performance_benchmark=ntget(cell, :performance_benchmark, :own),
        benchmark_percentile=ntget(cell, :benchmark_percentile, 0.75),
        allow_abandonment=ntget(cell, :allow_abandonment, false),
        abandonment_h=ntget(cell, :abandonment_h, 0.0),
        replacement_digital_rule=ntget(cell, :replacement_digital_rule, :bernoulli_seed_probability),
    )
    result = run_model(
        model;
        T=settings.T,
        stall_window=settings.stall_window,
        cascade_transition_window=ntget(settings, :cascade_transition_window, 45),
        cascade_slope_min=ntget(settings, :cascade_slope_min, 0.02),
        cascade_final_cutoff=ntget(settings, :cascade_final_cutoff, 0.5),
    )
    hazard_final = ntget(cell, :rule, :complex) == :hazard ? result.final_adoption : matched_hazard_final(graph, seed_nodes, thresholds, cell, settings, run_seed)
    excess_over_hazard = hazard_final === missing ? missing : result.final_adoption - hazard_final
    base = Dict{Symbol,Any}(
        :experiment => experiment,
        :phase => phase,
        :run_index => run_index,
        :run_seed => run_seed,
        :network_seed => network_seed,
        :family => family,
        :N => N,
        :k => k,
        :beta => ntget(cell, :beta, missing),
        :m => ntget(cell, :m, missing),
        :rule => ntget(cell, :rule, :complex),
        :success_denominator => ntget(cell, :success_denominator, :better),
        :min_successful_digital => ntget(cell, :min_successful_digital, 0),
        :min_better_total => ntget(cell, :min_better_total, 0),
        :hazard_h => ntget(cell, :hazard_h, missing),
        :v0 => ntget(cell, :v0, 10.0),
        :p_digital => ntget(cell, :p_digital, 0.01),
        :traditional_growth_mean => ntget(cell, :traditional_growth_mean, 0.15),
        :traditional_growth_sd => ntget(cell, :traditional_growth_sd, 0.10),
        :digital_growth_mean => ntget(cell, :digital_growth_mean, 1.50),
        :digital_growth_sd => ntget(cell, :digital_growth_sd, 1.00),
        :return_distribution => ntget(cell, :return_distribution, :normal),
        :performance_benchmark => ntget(cell, :performance_benchmark, :own),
        :benchmark_percentile => ntget(cell, :benchmark_percentile, 0.75),
        :allow_abandonment => ntget(cell, :allow_abandonment, false),
        :abandonment_h => ntget(cell, :abandonment_h, 0.0),
        :replacement_digital_rule => ntget(cell, :replacement_digital_rule, :bernoulli_seed_probability),
        :threshold_treatment => threshold_treatment,
        :theta_mean => ntget(threshold_params, :theta_mean, settings.theta_mean),
        :pi => ntget(threshold_params, :pi, missing),
        :pioneer_fraction => pioneer_fraction,
        :pioneer_count => pioneer_count,
        :pioneer_strategy => pioneer_strategy,
        :pioneer_threshold => ntget(threshold_params, :pioneer_threshold, ntget(threshold_params, :theta_low, missing)),
        :theta_low => ntget(threshold_params, :theta_low, missing),
        :theta_low_mean => ntget(threshold_params, :theta_low_mean, missing),
        :theta_high => ntget(threshold_params, :theta_high, missing),
        :sigma => ntget(threshold_params, :sigma, missing),
        :sigma_high => ntget(threshold_params, :sigma_high, missing),
        :seed_strategy => seed_strategy,
        :seed_count => seed_count,
        :seed_fraction => seed_count / N,
        :vary_network => vary_network,
        :final_adoption => result.final_adoption,
        :cascade => result.cascade,
        :cascade_dynamic => result.cascade_dynamic,
        :cascade_dynamic70 => result.cascade_dynamic70,
        :cascade_threshold50 => result.cascade_threshold50,
        :cascade_threshold70 => result.cascade_threshold70,
        :t10 => result.t10,
        :t50 => result.t50,
        :t90 => result.t90,
        :transition_time => result.transition_time,
        :max_slope => result.max_slope,
        :max_slope_period => result.max_slope_period,
        :cascade_final_cutoff => result.cascade_final_cutoff,
        :cascade_transition_window => result.cascade_transition_window,
        :cascade_slope_min => result.cascade_slope_min,
        :hazard_matched_final_adoption => hazard_final,
        :excess_over_hazard => excess_over_hazard,
        :stop_time => result.stop_time,
        :stopped_reason => result.stopped_reason,
        :valuation_cv => result.valuation_cv,
        :total_bankruptcies => result.total_bankruptcies,
        :total_adoptions => result.total_adoptions,
        :effort_metric => missing,
        :effort_budget => missing,
        :effort_label => missing,
        :theta_crit => missing,
        :robustness_axis => missing,
        :premium_ratio => missing,
        :theta_sweep => missing,
        :seed_fraction_sweep => missing,
        :update_schedule => missing,
        :return_distribution_sweep => missing,
        :performance_benchmark_sweep => missing,
        :abandonment_sweep => missing,
    )
    for extra_key in (
        :effort_metric,
        :effort_budget,
        :effort_label,
        :theta_crit,
        :robustness_axis,
        :premium_ratio,
        :theta_sweep,
        :seed_fraction_sweep,
        :update_schedule,
        :return_distribution_sweep,
        :performance_benchmark_sweep,
        :abandonment_sweep,
    )
        if hasproperty(cell, extra_key)
            base[extra_key] = getproperty(cell, extra_key)
        end
    end
    for k2 in keys(net_metrics)
        base[k2] = getproperty(net_metrics, k2)
    end
    series = pad_series(result.A, settings.T)
    curves = [merge(copy(base), Dict{Symbol,Any}(:t => t - 1, :A => series[t])) for t in eachindex(series)]
    return base, curves
end

function append_runs!(rows, curve_rows, cell, reps, phase, seed_rng, settings, experiment, run_counter)
    for _ in 1:reps
        run_counter[] += 1
        run_seed = rand(seed_rng, 1:typemax(Int32))
        row, curves = run_single(cell, run_seed, run_counter[], phase, settings, experiment)
        push!(rows, row)
        append!(curve_rows, curves)
    end
end

function cell_mask(df::DataFrame, cell::NamedTuple)
    mask = trues(nrow(df))
    for col in cell_group_columns(df)
        value = cell_value(cell, col)
        if value !== nothing
            mask .&= df[!, col] .== value
        end
    end
    return mask
end

function cell_value(cell::NamedTuple, col::Symbol)
    hasproperty(cell, col) && return getproperty(cell, col)
    if hasproperty(cell, :threshold_params)
        params = cell.threshold_params
        hasproperty(params, col) && return getproperty(params, col)
    end
    return nothing
end

function run_parameter_grid(
    experiment::String,
    cells::Vector{<:NamedTuple};
    settings::NamedTuple=quick_settings(),
    seed::Integer=20260603,
    output_prefix::String=experiment,
    result_dir::String="results",
    boundary::Tuple{Float64,Float64}=(0.1, 0.9),
)
    rows = Vector{Dict{Symbol,Any}}()
    curve_rows = Vector{Dict{Symbol,Any}}()
    seed_rng = MersenneTwister(seed)
    run_counter = Ref(0)
    @showprogress 1 "coarse $experiment" for cell in cells
        append_runs!(rows, curve_rows, cell, settings.n_coarse, "coarse", seed_rng, settings, experiment, run_counter)
    end
    coarse_df = DataFrame(rows)
    groupcols = cell_group_columns(coarse_df)
    summary = summarize_runs(coarse_df, groupcols)
    boundary_cells = NamedTuple[]
    for (i, cell) in pairs(cells)
        mask = cell_mask(coarse_df, cell)
        cp = mean(coarse_df[mask, :cascade])
        if boundary[1] <= cp <= boundary[2]
            push!(boundary_cells, cell)
        end
    end
    for cell in boundary_cells
        extra = max(settings.n_refine - settings.n_coarse, 0)
        append_runs!(rows, curve_rows, cell, extra, "refine", seed_rng, settings, experiment, run_counter)
    end
    for cell in cells
        if ntget(cell, :focal, false)
            current = nrow(DataFrame(rows)[cell_mask(DataFrame(rows), cell), :])
            extra = max(settings.n_focal - current, 0)
            append_runs!(rows, curve_rows, cell, extra, "focal", seed_rng, settings, experiment, run_counter)
        end
    end
    runs_df = DataFrame(rows)
    curves_df = DataFrame(curve_rows)
    summary_df = summarize_runs(runs_df, cell_group_columns(runs_df))
    mkpath(result_dir)
    CSV.write(joinpath(result_dir, "$(output_prefix)_runs.csv"), runs_df)
    CSV.write(joinpath(result_dir, "$(output_prefix)_curves.csv"), curves_df)
    CSV.write(joinpath(result_dir, "$(output_prefix)_summary.csv"), summary_df)
    write_sidecar_json(joinpath(result_dir, "$(output_prefix)_metadata.json"), experiment, seed, settings, cells)
    return (runs=runs_df, curves=curves_df, summary=summary_df)
end

function cell_group_columns(df::DataFrame)
    candidates = [
        :experiment,
        :family,
        :beta,
        :m,
        :rule,
        :success_denominator,
        :min_successful_digital,
        :min_better_total,
        :threshold_treatment,
        :theta_mean,
        :pi,
        :pioneer_strategy,
        :pioneer_count,
        :seed_strategy,
        :seed_count,
        :vary_network,
        :effort_metric,
        :effort_budget,
        :effort_label,
        :robustness_axis,
        :premium_ratio,
        :digital_growth_sd,
        :theta_sweep,
        :seed_fraction_sweep,
        :update_schedule,
        :return_distribution,
        :return_distribution_sweep,
        :performance_benchmark,
        :performance_benchmark_sweep,
        :allow_abandonment,
        :abandonment_sweep,
        :replacement_digital_rule,
    ]
    return [c for c in candidates if c in propertynames(df)]
end

function json_value(x)
    x === missing && return "null"
    x isa Symbol && return "\"" * string(x) * "\""
    x isa AbstractString && return "\"" * replace(x, "\"" => "\\\"") * "\""
    x isa Bool && return x ? "true" : "false"
    x isa NamedTuple && return "{" * join(["\"" * string(k) * "\":" * json_value(getproperty(x, k)) for k in keys(x)], ",") * "}"
    x isa AbstractVector && return "[" * join(json_value.(x), ",") * "]"
    return string(x)
end

function package_versions_json()
    deps = Pkg.dependencies()
    names = ["Agents", "Graphs", "Distributions", "StatsBase", "DataFrames", "CSV", "CairoMakie", "ProgressMeter"]
    parts = String[]
    for name in names
        for dep in values(deps)
            if dep.name == name
                push!(parts, "\"" * name * "\":\"" * string(dep.version) * "\"")
                break
            end
        end
    end
    return "{" * join(parts, ",") * "}"
end

function write_sidecar_json(path::AbstractString, experiment::String, seed::Integer, settings::NamedTuple, cells)
    open(path, "w") do io
        println(io, "{")
        println(io, "  \"experiment\": ", json_value(experiment), ",")
        println(io, "  \"master_seed\": ", seed, ",")
        println(io, "  \"generated_at\": ", json_value(string(now())), ",")
        println(io, "  \"julia_version\": ", json_value(string(VERSION)), ",")
        println(io, "  \"package_versions\": ", package_versions_json(), ",")
        println(io, "  \"settings\": ", json_value(settings), ",")
        println(io, "  \"cells\": ", json_value(collect(cells)))
        println(io, "}")
    end
end
