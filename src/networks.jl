function graph_param(params::NamedTuple, key::Symbol, default)
    return hasproperty(params, key) ? getproperty(params, key) : default
end

function mean_degree(g::AbstractGraph)
    nv(g) == 0 && return 0.0
    return 2.0 * ne(g) / nv(g)
end

function degree_variance(g::AbstractGraph)
    deg = degree(g)
    length(deg) <= 1 && return 0.0
    return var(Float64.(deg))
end

function safe_global_clustering(g::AbstractGraph)
    try
        return Float64(global_clustering_coefficient(g))
    catch
        return missing
    end
end

function giant_component_fraction(g::AbstractGraph)
    nv(g) == 0 && return 0.0
    comps = connected_components(g)
    isempty(comps) && return 0.0
    return maximum(length.(comps)) / nv(g)
end

function average_shortest_path_sample(g::AbstractGraph; rng=Random.default_rng(), nsamples::Int=100)
    n = nv(g)
    n <= 1 && return 0.0
    sources = n <= nsamples ? collect(1:n) : sample(rng, collect(1:n), nsamples; replace=false)
    total = 0.0
    count = 0
    for s in sources
        dist = gdistances(g, s)
        for d in dist
            if d > 0 && d < typemax(Int)
                total += d
                count += 1
            end
        end
    end
    return count == 0 ? missing : total / count
end

function estimate_powerlaw_exponent(g::AbstractGraph)
    deg = Float64.(degree(g))
    tail = deg[deg .>= max(2.0, quantile(deg, 0.75))]
    length(tail) < 5 && return missing
    xmin = minimum(tail)
    denom = sum(log.(tail ./ xmin))
    denom <= 0 && return missing
    return 1.0 + length(tail) / denom
end

function network_metrics(g::AbstractGraph, family::Symbol; rng=Random.default_rng(), path_samples::Int=100, generator::Symbol=family, target_mean_degree=missing)
    return (
        network_generator = generator,
        target_mean_degree = target_mean_degree,
        realised_N = nv(g),
        realised_edges = ne(g),
        realised_mean_degree = mean_degree(g),
        degree_variance = degree_variance(g),
        clustering = safe_global_clustering(g),
        avg_path_length = average_shortest_path_sample(g; rng=rng, nsamples=path_samples),
        giant_component_fraction = giant_component_fraction(g),
        powerlaw_alpha = family == :power_law ? estimate_powerlaw_exponent(g) : missing,
    )
end

function ring_lattice(N::Integer, k::Integer)
    @assert 0 <= k < N "ring lattice requires 0 <= k < N"
    @assert iseven(k) || iseven(N) "odd degree ring lattice requires even N"
    g = SimpleGraph(N)
    halfk = fld(k, 2)
    for i in 1:N
        for d in 1:halfk
            add_edge!(g, i, mod1(i + d, N))
        end
        if isodd(k)
            add_edge!(g, i, mod1(i + div(N, 2), N))
        end
    end
    return g
end

function watts_strogatz_rewire(N::Integer, k::Integer, beta::Real; rng=Random.default_rng())
    g = ring_lattice(N, k)
    halfk = fld(k, 2)
    for i in 1:N
        for d in 1:halfk
            j = mod1(i + d, N)
            rand(rng) < beta || continue
            rem_edge!(g, i, j)
            candidates = [v for v in 1:N if v != i && !has_edge(g, i, v)]
            newj = rand(rng, candidates)
            add_edge!(g, i, newj)
        end
        if isodd(k)
            j = mod1(i + div(N, 2), N)
            i < j || continue
            rand(rng) < beta || continue
            rem_edge!(g, i, j)
            candidates = [v for v in 1:N if v != i && !has_edge(g, i, v)]
            newj = rand(rng, candidates)
            add_edge!(g, i, newj)
        end
    end
    return g
end

"""
    build_network(family, params; rng)

Build a supported network family and return `(graph, metrics)`.
"""
function build_network(family::Symbol, params::NamedTuple; rng=Random.default_rng())
    N = graph_param(params, :N, 1000)
    k = graph_param(params, :k, 10)
    path_samples = graph_param(params, :path_samples, min(100, N))
    if family == :small_world
        beta = graph_param(params, :beta, 0.1)
        g = watts_strogatz_rewire(N, k, beta; rng=rng)
        generator = :watts_strogatz_rewire
    elseif family == :power_law
        m = graph_param(params, :m, max(1, round(Int, k / 2)))
        g = barabasi_albert(N, m; rng=rng)
        generator = :barabasi_albert_degree_varies
    elseif family == :degree_matched_random
        edge_count = round(Int, N * k / 2)
        g = erdos_renyi(N, edge_count; rng=rng)
        generator = :erdos_renyi_degree_matched
    else
        error("Unknown network family: $family")
    end
    return g, network_metrics(g, family; rng=rng, path_samples=path_samples, generator=generator, target_mean_degree=k)
end
