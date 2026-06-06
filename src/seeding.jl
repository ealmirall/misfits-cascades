function seed_count_from_fraction(N::Integer, seed_fraction::Real)
    return clamp(round(Int, seed_fraction * N), 0, N)
end

function top_indices(values::AbstractVector, s::Integer)
    s <= 0 && return Int[]
    return collect(sortperm(values; rev=true)[1:min(s, length(values))])
end

function clustered_seed_nodes(g::AbstractGraph, s::Integer; rng=Random.default_rng())
    s <= 0 && return Int[]
    start = rand(rng, 1:nv(g))
    selected = Int[]
    seen = falses(nv(g))
    queue = [start]
    seen[start] = true
    while !isempty(queue) && length(selected) < s
        v = popfirst!(queue)
        push!(selected, v)
        for nb in neighbors(g, v)
            if !seen[nb]
                seen[nb] = true
                push!(queue, nb)
            end
        end
    end
    if length(selected) < s
        rest = setdiff(collect(1:nv(g)), selected)
        append!(selected, sample(rng, rest, min(s - length(selected), length(rest)); replace=false))
    end
    return selected
end

"""
    choose_seeds(g, s, strategy; rng)

Return node IDs that start digital.
"""
function choose_seeds(g::AbstractGraph, s::Integer, strategy::Symbol=:random; rng=Random.default_rng())
    s = clamp(s, 0, nv(g))
    strategy == :random && return sample(rng, collect(1:nv(g)), s; replace=false)
    strategy == :high_degree && return top_indices(degree(g), s)
    strategy == :bridge && return top_indices(betweenness_centrality(g), s)
    if strategy == :hub_bridge
        hub_n = ceil(Int, s / 2)
        hubs = top_indices(degree(g), hub_n)
        bridge_order = top_indices(betweenness_centrality(g), nv(g))
        selected = copy(hubs)
        for node in bridge_order
            length(selected) >= s && break
            node in selected || push!(selected, node)
        end
        return selected[1:s]
    end
    strategy == :clustered && return clustered_seed_nodes(g, s; rng=rng)
    error("Unknown seed strategy: $strategy")
end

choose_pioneers(g::AbstractGraph, s::Integer, strategy::Symbol=:random; rng=Random.default_rng()) =
    choose_seeds(g, s, strategy; rng=rng)
