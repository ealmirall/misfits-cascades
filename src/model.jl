@agent struct Firm(GraphAgent)
    is_digital::Bool
    valuation::Float64
    threshold::Float64
    age::Int
end

Base.@kwdef mutable struct ModelParams
    graph::SimpleGraph
    node_to_id::Vector{Int}
    v0::Float64 = 10.0
    p_digital::Float64 = 0.01
    threshold_treatment::Symbol = :homogeneous
    threshold_params::NamedTuple = (theta_mean=DEFAULT_THETA_MEAN,)
    rule::Symbol = :complex
    synchronous::Bool = true
    performance_weighted::Bool = false
    success_denominator::Symbol = :better
    min_successful_digital::Int = 0
    min_better_total::Int = 0
    hazard_h::Float64 = 0.01
    count_k::Int = 1
    traditional_growth_mean::Float64 = 0.15
    traditional_growth_sd::Float64 = 0.10
    digital_growth_mean::Float64 = 1.50
    digital_growth_sd::Float64 = 1.00
    return_distribution::Symbol = :normal
    performance_benchmark::Symbol = :own
    benchmark_percentile::Float64 = 0.75
    allow_abandonment::Bool = false
    abandonment_h::Float64 = 0.0
    replacement_digital_rule::Symbol = :bernoulli_seed_probability
    bankruptcy_floor::Float64 = 1.0
    current_period::Int = 0
    adoption_log::Vector{NamedTuple} = NamedTuple[]
end

function make_model(
    graph::SimpleGraph;
    rng=Random.default_rng(),
    v0::Real=10.0,
    p_digital::Real=0.01,
    seed_nodes::AbstractVector{<:Integer}=Int[],
    thresholds::Union{Nothing,AbstractVector{<:Real}}=nothing,
    threshold_treatment::Symbol=:homogeneous,
    threshold_params::NamedTuple=(theta_mean=DEFAULT_THETA_MEAN,),
    rule::Symbol=:complex,
    synchronous::Bool=true,
    performance_weighted::Bool=false,
    success_denominator::Symbol=:better,
    min_successful_digital::Integer=0,
    min_better_total::Integer=0,
    hazard_h::Real=0.01,
    count_k::Integer=1,
    traditional_growth_mean::Real=0.15,
    traditional_growth_sd::Real=0.10,
    digital_growth_mean::Real=1.50,
    digital_growth_sd::Real=1.00,
    return_distribution::Symbol=:normal,
    performance_benchmark::Symbol=:own,
    benchmark_percentile::Real=0.75,
    allow_abandonment::Bool=false,
    abandonment_h::Real=0.0,
    replacement_digital_rule::Symbol=:bernoulli_seed_probability,
    bankruptcy_floor::Real=1.0,
)
    N = nv(graph)
    th = thresholds === nothing ? draw_thresholds(threshold_treatment, N, threshold_params; rng=rng) : Float64.(thresholds)
    length(th) == N || error("threshold vector length $(length(th)) does not match N=$N")
    seedset = Set(Int.(seed_nodes))
    node_to_id = zeros(Int, N)
    props = ModelParams(;
        graph=graph,
        node_to_id=node_to_id,
        v0=Float64(v0),
        p_digital=Float64(p_digital),
        threshold_treatment=threshold_treatment,
        threshold_params=threshold_params,
        rule=rule,
        synchronous=synchronous,
        performance_weighted=performance_weighted,
        success_denominator=success_denominator,
        min_successful_digital=Int(min_successful_digital),
        min_better_total=Int(min_better_total),
        hazard_h=Float64(hazard_h),
        count_k=Int(count_k),
        traditional_growth_mean=Float64(traditional_growth_mean),
        traditional_growth_sd=Float64(traditional_growth_sd),
        digital_growth_mean=Float64(digital_growth_mean),
        digital_growth_sd=Float64(digital_growth_sd),
        return_distribution=return_distribution,
        performance_benchmark=performance_benchmark,
        benchmark_percentile=Float64(benchmark_percentile),
        allow_abandonment=allow_abandonment,
        abandonment_h=Float64(abandonment_h),
        replacement_digital_rule=replacement_digital_rule,
        bankruptcy_floor=Float64(bankruptcy_floor),
        current_period=0,
        adoption_log=NamedTuple[],
    )
    model = StandardABM(Firm, GraphSpace(graph); agent_step! = agent -> nothing, properties=props, rng=rng)
    for node in 1:N
        initial_digital = isempty(seedset) ? (rand(rng) < p_digital) : (node in seedset)
        agent = add_agent!(node, model, initial_digital, Float64(v0), th[node], 0)
        node_to_id[node] = agent.id
    end
    return model
end

function agent_at_node(model, node::Integer)
    id = model.node_to_id[node]
    return model[id]
end

function adoption_fraction(model)
    n = nagents(model)
    n == 0 && return 0.0
    return count(a -> a.is_digital, allagents(model)) / n
end

function valuation_cv(model)
    vals = [a.valuation for a in allagents(model)]
    isempty(vals) && return missing
    mu = mean(vals)
    return iszero(mu) ? missing : std(vals) / abs(mu)
end

function draw_growth(rng, mu::Real, sigma::Real, distribution::Symbol)
    if distribution == :normal
        return rand(rng, Normal(mu, sigma))
    elseif distribution == :truncated_normal
        return rand(rng, truncated(Normal(mu, sigma), -0.99, Inf))
    elseif distribution == :lognormal
        mu > 0 || error("lognormal growth requires positive mean return")
        sigma <= 0 && return Float64(mu)
        sigma2 = log1p((sigma^2) / (mu^2))
        location = log(mu) - sigma2 / 2
        return rand(rng, LogNormal(location, sqrt(sigma2)))
    else
        error("Unknown return distribution: $distribution")
    end
end

function grow_agents!(model)
    rng = abmrng(model)
    for agent in allagents(model)
        mu = agent.is_digital ? model.digital_growth_mean : model.traditional_growth_mean
        sigma = agent.is_digital ? model.digital_growth_sd : model.traditional_growth_sd
        g = draw_growth(rng, mu, sigma, model.return_distribution)
        agent.valuation *= (1.0 + g)
        agent.age += 1
    end
    return nothing
end

function replace_bankrupt!(model)
    rng = abmrng(model)
    bankrupt = [(a.id, a.pos) for a in allagents(model) if a.valuation < model.bankruptcy_floor]
    for (id, node) in bankrupt
        remove_agent!(id, model)
        is_digital =
            model.replacement_digital_rule == :traditional_only ? false :
            model.replacement_digital_rule == :bernoulli_seed_probability ? rand(rng) < model.p_digital :
            error("Unknown replacement digital rule: $(model.replacement_digital_rule)")
        threshold = draw_one_threshold(model.threshold_treatment, model.threshold_params; rng=rng)
        new_agent = add_agent!(node, model, is_digital, model.v0, threshold, 0)
        model.node_to_id[node] = new_agent.id
    end
    return length(bankrupt)
end

function benchmark_value(model, agent, neigh::Vector{Int})
    if model.performance_benchmark == :own
        return agent.valuation
    end
    vals = [agent_at_node(model, node).valuation for node in neigh]
    isempty(vals) && return agent.valuation
    if model.performance_benchmark == :mean
        return mean(vals)
    elseif model.performance_benchmark == :median
        return median(vals)
    elseif model.performance_benchmark == :percentile || model.performance_benchmark == :p75
        return quantile(vals, model.benchmark_percentile)
    else
        error("Unknown performance benchmark: $(model.performance_benchmark)")
    end
end

function better_performing_nodes(model, agent)
    neigh = collect(neighbors(model.graph, agent.pos))
    isempty(neigh) && return Int[]
    cutoff = benchmark_value(model, agent, neigh)
    return [node for node in neigh if agent_at_node(model, node).valuation > cutoff]
end

function success_exposure_stats(model, agent)
    better = better_performing_nodes(model, agent)
    neigh = collect(neighbors(model.graph, agent.pos))
    digital_better = count(node -> agent_at_node(model, node).is_digital, better)
    return (better=better, neigh=neigh, digital_better=digital_better)
end

function exposure_share_complex(model, agent)
    snapshot = complex_exposure_snapshot(model, agent)
    snapshot === nothing && return nothing
    return snapshot.exposure_share
end

function complex_exposure_snapshot(model, agent)
    stats = success_exposure_stats(model, agent)
    better = stats.better
    better_count = length(better)
    isempty(better) && return nothing
    stats.digital_better < model.min_successful_digital && return nothing
    better_count < model.min_better_total && return nothing
    vi = agent.valuation
    denom = 0.0
    phi = 0.0
    if model.performance_weighted
        numer = 0.0
        for node in better
            nb = agent_at_node(model, node)
            w = nb.valuation - vi
            denom += w
            nb.is_digital && (numer += w)
        end
        phi = denom <= 0 ? 0.0 : numer / denom
    else
        denom =
            model.success_denominator == :better ? better_count :
            model.success_denominator == :all_neighbors ? length(stats.neigh) :
            error("Unknown success denominator: $(model.success_denominator)")
        denom <= 0 && return nothing
        phi = stats.digital_better / denom
    end
    return (
        better_count=better_count,
        successful_digital_count=stats.digital_better,
        exposure_denominator=Float64(denom),
        exposure_share=Float64(phi),
    )
end

function exposure_share_simple(model, agent)
    neigh = collect(neighbors(model.graph, agent.pos))
    isempty(neigh) && return nothing
    return count(node -> agent_at_node(model, node).is_digital, neigh) / length(neigh)
end

function abandonment_decision(model, agent)
    (!model.allow_abandonment || !agent.is_digital) && return false
    neigh = collect(neighbors(model.graph, agent.pos))
    isempty(neigh) && return false
    local_benchmark = median([agent_at_node(model, node).valuation for node in neigh])
    return agent.valuation < local_benchmark && rand(abmrng(model)) < model.abandonment_h
end

function adoption_decision(model, agent)
    agent.is_digital && return false
    if model.rule == :hazard
        return rand(abmrng(model)) < model.hazard_h
    elseif model.rule == :complex
        snapshot = complex_exposure_snapshot(model, agent)
        return snapshot !== nothing && snapshot.exposure_share >= agent.threshold
    elseif model.rule == :simple
        phi = exposure_share_simple(model, agent)
        return phi !== nothing && phi >= agent.threshold
    elseif model.rule == :count_legacy
        better_digital = 0
        vi = agent.valuation
        for node in neighbors(model.graph, agent.pos)
            nb = agent_at_node(model, node)
            if nb.valuation > vi && nb.is_digital
                better_digital += 1
            end
        end
        return better_digital >= model.count_k
    else
        error("Unknown adoption rule: $(model.rule)")
    end
end

function log_complex_adoption!(model, agent, snapshot)
    push!(
        model.adoption_log,
        (
            t=model.current_period,
            agent_id=agent.id,
            node=agent.pos,
            better_count=snapshot.better_count,
            successful_digital_count=snapshot.successful_digital_count,
            exposure_denominator=snapshot.exposure_denominator,
            exposure_share=snapshot.exposure_share,
            threshold=agent.threshold,
            success_denominator=model.success_denominator,
            min_successful_digital=model.min_successful_digital,
            min_better_total=model.min_better_total,
        ),
    )
    return nothing
end

function apply_adoption!(model)
    if model.synchronous
        adopters = Int[]
        if model.rule == :complex
            for agent in allagents(model)
                agent.is_digital && continue
                snapshot = complex_exposure_snapshot(model, agent)
                if snapshot !== nothing && snapshot.exposure_share >= agent.threshold
                    push!(adopters, agent.id)
                    log_complex_adoption!(model, agent, snapshot)
                end
            end
        else
            adopters = [a.id for a in allagents(model) if adoption_decision(model, a)]
        end
        abandoners = [a.id for a in allagents(model) if abandonment_decision(model, a)]
        for id in adopters
            hasid(model, id) && (model[id].is_digital = true)
        end
        for id in abandoners
            hasid(model, id) && (model[id].is_digital = false)
        end
        return length(adopters)
    else
        ids = collect(allids(model))
        shuffle!(abmrng(model), ids)
        adopted = 0
        for id in ids
            if hasid(model, id)
                agent = model[id]
                if model.rule == :complex && !agent.is_digital
                    snapshot = complex_exposure_snapshot(model, agent)
                    if snapshot !== nothing && snapshot.exposure_share >= agent.threshold
                        log_complex_adoption!(model, agent, snapshot)
                        agent.is_digital = true
                        adopted += 1
                    elseif abandonment_decision(model, agent)
                        agent.is_digital = false
                    end
                elseif adoption_decision(model, agent)
                    agent.is_digital = true
                    adopted += 1
                elseif abandonment_decision(model, agent)
                    agent.is_digital = false
                end
            end
        end
        return adopted
    end
end

"""
    model_step!(model)

Growth, bankruptcy/replacement, and adoption. Adoption is synchronous by default.
"""
function model_step!(model)
    grow_agents!(model)
    bankruptcies = replace_bankrupt!(model)
    model.current_period += 1
    adoptions = apply_adoption!(model)
    return (bankruptcies=bankruptcies, adoptions=adoptions)
end
