using CairoMakie
using CSV
using DataFrames
using LinearAlgebra
using Random
using Statistics

function logistic_fit(X, y; maxiter=50, ridge=1.0e-6)
    beta = zeros(size(X, 2))
    for _ in 1:maxiter
        eta = X * beta
        p = 1.0 ./ (1.0 .+ exp.(-eta))
        w = clamp.(p .* (1 .- p), 1.0e-6, Inf)
        z = eta .+ (y .- p) ./ w
        Xw = X .* sqrt.(w)
        zw = z .* sqrt.(w)
        beta_new = (Xw' * Xw + ridge * I) \ (Xw' * zw)
        norm(beta_new - beta) < 1.0e-8 && (beta = beta_new; break)
        beta = beta_new
    end
    eta = X * beta
    p = 1.0 ./ (1.0 .+ exp.(-eta))
    w = clamp.(p .* (1 .- p), 1.0e-6, Inf)
    vcov = inv(X' * Diagonal(w) * X + ridge * I)
    return beta, sqrt.(diag(vcov))
end

function interpolate_beta_crossing(betas::Vector{Float64}, probs::Vector{Float64}; level=0.5)
    order = sortperm(betas)
    xs = betas[order]
    ys = probs[order]
    for i in 1:(length(xs) - 1)
        y1, y2 = ys[i], ys[i + 1]
        y1 == level && return xs[i]
        if (y1 - level) * (y2 - level) <= 0 && y1 != y2
            lx1, lx2 = log10(xs[i]), log10(xs[i + 1])
            frac = (level - y1) / (y2 - y1)
            return 10.0 ^ (lx1 + frac * (lx2 - lx1))
        end
    end
    return missing
end

function write_beta_tipping_ci(runs::DataFrame, result_dir::AbstractString; B::Int=1000, seed::Int=20260603)
    sw = runs[string.(runs.family) .== "small_world", :]
    dropmissing!(sw, [:beta, :cascade])
    betas = sort(unique(Float64.(sw.beta)))
    probs = [mean(Float64.(sw.cascade[sw.beta .== beta])) for beta in betas]
    beta_star = interpolate_beta_crossing(betas, probs)
    rng = MersenneTwister(seed)
    draws = Float64[]
    for _ in 1:B
        boot_probs = Float64[]
        for beta in betas
            outcomes = Float64.(sw.cascade[sw.beta .== beta])
            sampled = outcomes[rand(rng, 1:length(outcomes), length(outcomes))]
            push!(boot_probs, mean(sampled))
        end
        crossing = interpolate_beta_crossing(betas, boot_probs)
        crossing === missing || push!(draws, crossing)
    end
    ci_low = isempty(draws) ? missing : quantile(draws, 0.025)
    ci_high = isempty(draws) ? missing : quantile(draws, 0.975)
    out = DataFrame(
        beta_star=beta_star,
        ci_low=ci_low,
        ci_high=ci_high,
        bootstrap_draws=B,
        usable_draws=length(draws),
        missing_crossing_share=1 - length(draws) / B,
    )
    CSV.write(joinpath(result_dir, "topology_beta_tipping_ci.csv"), out)
    return out
end

function main()
    root = dirname(dirname(@__FILE__))
    result_dir = joinpath(root, "results")
    fig_dir = joinpath(root, "figures")
    mkpath(result_dir)
    mkpath(fig_dir)
    runs = CSV.read(joinpath(result_dir, "expB_topology_runs.csv"), DataFrame)
    dropmissing!(runs, [:cascade, :avg_path_length, :realised_mean_degree, :clustering, :degree_variance, :family])
    families = sort(unique(string.(runs.family)))
    y = Float64.(runs.cascade)
    cols = [
        ones(nrow(runs)),
        Float64.(runs.avg_path_length),
        Float64.(runs.realised_mean_degree),
        Float64.(runs.clustering),
        Float64.(runs.degree_variance),
    ]
    names = ["intercept", "avg_path_length", "mean_degree", "clustering", "degree_variance"]
    for fam in families[2:end]
        push!(cols, Float64.(string.(runs.family) .== fam))
        push!(names, "family=$(fam)")
    end
    X = hcat(cols...)
    beta, se = logistic_fit(X, y)
    coef = DataFrame(term=names, estimate=beta, std_error=se, odds_ratio=exp.(beta))
    CSV.write(joinpath(result_dir, "topology_regression_coefficients.csv"), coef)

    path_grid = range(quantile(runs.avg_path_length, 0.05), quantile(runs.avg_path_length, 0.95), length=120)
    degree_fixed = mean(runs.realised_mean_degree)
    clustering_fixed = mean(runs.clustering)
    degree_var_fixed = mean(runs.degree_variance)
    family_dummies = zeros(length(families) - 1)
    pred = Float64[]
    for path in path_grid
        x = vcat([1.0, path, degree_fixed, clustering_fixed, degree_var_fixed], family_dummies)
        push!(pred, 1 / (1 + exp(-dot(x, beta))))
    end
    partial = DataFrame(avg_path_length=collect(path_grid), cascade_probability=pred, mean_degree_fixed=degree_fixed)
    CSV.write(joinpath(result_dir, "topology_partial_effect_avg_path.csv"), partial)
    write_beta_tipping_ci(runs, result_dir)

    fig = Figure(size=(720, 430))
    ax = Axis(fig[1, 1], title="Average path length predicts cascades after degree control", xlabel="Average path length", ylabel="Predicted dynamic cascade probability")
    lines!(ax, partial.avg_path_length, partial.cascade_probability; color=RGBf(31/255, 78/255, 121/255), linewidth=2.5)
    hlines!(ax, [0.5]; color=(:black, 0.45), linestyle=:dot)
    ylims!(ax, 0, 1)
    save(joinpath(fig_dir, "topology_partial_effect_avg_path.png"), fig; px_per_unit=300/96)
    save(joinpath(fig_dir, "topology_partial_effect_avg_path.pdf"), fig)
    println(coef)
end

main()
