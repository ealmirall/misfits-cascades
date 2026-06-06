const DEFAULT_THETA_MEAN = 0.25

function clamp01(x::Real)
    return clamp(Float64(x), 0.0, 1.0)
end

function threshold_param(params::NamedTuple, key::Symbol, default)
    return hasproperty(params, key) ? getproperty(params, key) : default
end

"""
    draw_thresholds(treatment, N, params; rng)

Draw thresholds in [0, 1]. Mixtures choose `theta_high` so the expected
population mean equals `theta_mean`.
"""
function draw_thresholds(treatment::Symbol, N::Integer, params::NamedTuple=NamedTuple(); rng=Random.default_rng())
    theta_mean = threshold_param(params, :theta_mean, DEFAULT_THETA_MEAN)
    if treatment == :homogeneous
        sigma = threshold_param(params, :sigma, 0.01)
        return [clamp01(rand(rng, Normal(theta_mean, sigma))) for _ in 1:N]
    elseif treatment == :lower_mean
        theta_low_mean = threshold_param(params, :theta_low_mean, 0.15)
        sigma = threshold_param(params, :sigma, 0.01)
        return [clamp01(rand(rng, Normal(theta_low_mean, sigma))) for _ in 1:N]
    elseif treatment == :higher_variance
        sigma_high = threshold_param(params, :sigma_high, 0.15)
        return [clamp01(rand(rng, Normal(theta_mean, sigma_high))) for _ in 1:N]
    elseif treatment == :mixture
        pi = threshold_param(params, :pi, 0.05)
        theta_low = threshold_param(params, :theta_low, 0.05)
        @assert 0.0 <= pi < 1.0 "mixture fraction pi must be in [0, 1)"
        theta_high = threshold_param(params, :theta_high, (theta_mean - pi * theta_low) / (1.0 - pi))
        theta_high = clamp01(theta_high)
        n_low = clamp(round(Int, pi * N), 0, N)
        thresholds = fill(theta_high, N)
        if n_low > 0
            idx = sample(rng, collect(1:N), n_low; replace=false)
            thresholds[idx] .= theta_low
        end
        return thresholds
    else
        error("Unknown threshold treatment: $treatment")
    end
end

function draw_one_threshold(treatment::Symbol, params::NamedTuple; rng=Random.default_rng())
    if treatment == :mixture
        theta_mean = threshold_param(params, :theta_mean, DEFAULT_THETA_MEAN)
        pi = threshold_param(params, :pioneer_fraction, threshold_param(params, :pi, 0.05))
        theta_low = threshold_param(params, :pioneer_threshold, threshold_param(params, :theta_low, 0.05))
        @assert 0.0 <= pi < 1.0 "mixture fraction pi must be in [0, 1)"
        theta_high = threshold_param(params, :theta_high, (theta_mean - pi * theta_low) / (1.0 - pi))
        return rand(rng) < pi ? clamp01(theta_low) : clamp01(theta_high)
    end
    return only(draw_thresholds(treatment, 1, params; rng=rng))
end

function mixture_thresholds_with_pioneers(N::Integer, params::NamedTuple, pioneer_nodes::AbstractVector{<:Integer})
    theta_mean = threshold_param(params, :theta_mean, DEFAULT_THETA_MEAN)
    pioneer_fraction = threshold_param(params, :pioneer_fraction, threshold_param(params, :pi, 0.05))
    theta_low = threshold_param(params, :pioneer_threshold, threshold_param(params, :theta_low, 0.05))
    theta_high = threshold_param(params, :theta_high, (theta_mean - pioneer_fraction * theta_low) / max(1.0 - pioneer_fraction, eps()))
    thresholds = fill(clamp01(theta_high), N)
    for node in pioneer_nodes
        1 <= node <= N && (thresholds[node] = clamp01(theta_low))
    end
    return thresholds
end
