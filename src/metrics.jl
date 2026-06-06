function first_crossing(series::AbstractVector{<:Real}, level::Real)
    idx = findfirst(a -> a >= level, series)
    idx === nothing && return missing
    return idx - 1
end

function transition_time(t10, t50)
    (t10 === missing || t50 === missing) && return missing
    return t50 - t10
end

function max_adoption_slope(series::AbstractVector{<:Real})
    length(series) < 2 && return (0.0, missing)
    diffs = diff(Float64.(series))
    idx = argmax(diffs)
    return (diffs[idx], idx)
end

function dynamic_cascade(
    final_adoption,
    trans_time,
    max_slope;
    final_cutoff::Real=0.5,
    transition_window::Integer=45,
    slope_min::Real=0.02,
)
    trans_time === missing && return false
    return final_adoption >= final_cutoff &&
        trans_time <= transition_window &&
        max_slope >= slope_min
end

"""
    run_model(model; ...)

Run one simulation and compute both the legacy threshold cascade indicator and
the pre-registered dynamic cascade components.
"""
function run_model(
    model;
    T::Integer=100,
    early_stop_A::Real=0.9,
    stall_window::Integer=20,
    cascade_final_cutoff::Real=0.5,
    cascade_transition_window::Integer=45,
    cascade_slope_min::Real=0.02,
)
    A = Float64[adoption_fraction(model)]
    bankruptcies = Int[]
    adoptions = Int[]
    stopped_reason = "T"
    no_increase = 0
    best_A = A[end]
    for _ in 1:T
        step_stats = model_step!(model)
        push!(bankruptcies, step_stats.bankruptcies)
        push!(adoptions, step_stats.adoptions)
        current_A = adoption_fraction(model)
        push!(A, current_A)
        if current_A >= early_stop_A
            stopped_reason = "A90"
            break
        end
        if current_A > best_A + eps(Float64)
            best_A = current_A
            no_increase = 0
        else
            no_increase += 1
        end
        if no_increase >= stall_window
            stopped_reason = "stall"
            break
        end
    end
    t10 = first_crossing(A, 0.1)
    t50 = first_crossing(A, 0.5)
    t90 = first_crossing(A, 0.9)
    trans_time = transition_time(t10, t50)
    slope, slope_period = max_adoption_slope(A)
    legacy50 = A[end] >= 0.5
    legacy70 = A[end] >= 0.7
    cascade50 = dynamic_cascade(
        A[end],
        trans_time,
        slope;
        final_cutoff=cascade_final_cutoff,
        transition_window=cascade_transition_window,
        slope_min=cascade_slope_min,
    )
    cascade70 = dynamic_cascade(
        A[end],
        trans_time,
        slope;
        final_cutoff=0.7,
        transition_window=cascade_transition_window,
        slope_min=cascade_slope_min,
    )
    return (
        A=A,
        final_adoption=A[end],
        cascade=cascade50,
        cascade_dynamic=cascade50,
        cascade_dynamic70=cascade70,
        cascade_threshold50=legacy50,
        cascade_threshold70=legacy70,
        t10=t10,
        t50=t50,
        t90=t90,
        transition_time=trans_time,
        max_slope=slope,
        max_slope_period=slope_period,
        cascade_final_cutoff=Float64(cascade_final_cutoff),
        cascade_transition_window=Int(cascade_transition_window),
        cascade_slope_min=Float64(cascade_slope_min),
        stop_time=length(A) - 1,
        stopped_reason=stopped_reason,
        valuation_cv=valuation_cv(model),
        total_bankruptcies=sum(bankruptcies; init=0),
        total_adoptions=sum(adoptions; init=0),
        adoption_log=copy(model.adoption_log),
    )
end

function pad_series(series::Vector{Float64}, T::Integer)
    if length(series) >= T + 1
        return series[1:T+1]
    end
    out = copy(series)
    append!(out, fill(series[end], T + 1 - length(series)))
    return out
end

function summarize_runs(df::DataFrame, groupcols::Vector{Symbol})
    isempty(df) && return DataFrame()
    grouped = groupby(df, groupcols)
    summary = combine(
        grouped,
        :final_adoption => mean => :final_adoption_mean,
        :final_adoption => median => :final_adoption_median,
        :final_adoption => (x -> quantile(skipmissing(x), 0.05)) => :final_adoption_p05,
        :final_adoption => (x -> quantile(skipmissing(x), 0.95)) => :final_adoption_p95,
        :cascade => mean => :cascade_prob,
        :cascade_threshold50 => mean => :cascade_threshold50_prob,
        :cascade_dynamic70 => mean => :cascade_dynamic70_prob,
        :t50 => (x -> isempty(collect(skipmissing(x))) ? missing : median(collect(skipmissing(x)))) => :t50_median,
        :t50 => (x -> isempty(collect(skipmissing(x))) ? missing : quantile(collect(skipmissing(x)), 0.05)) => :t50_p05,
        :t50 => (x -> isempty(collect(skipmissing(x))) ? missing : quantile(collect(skipmissing(x)), 0.95)) => :t50_p95,
        :transition_time => (x -> isempty(collect(skipmissing(x))) ? missing : median(collect(skipmissing(x)))) => :transition_time_median,
        :max_slope => median => :max_slope_median,
        :excess_over_hazard => (x -> isempty(collect(skipmissing(x))) ? missing : median(collect(skipmissing(x)))) => :excess_over_hazard_median,
        nrow => :n_runs,
    )
    lows = Float64[]
    highs = Float64[]
    for row in eachrow(summary)
        low, high = wilson_interval(row.cascade_prob, row.n_runs)
        push!(lows, low)
        push!(highs, high)
    end
    summary.cascade_prob_ci_low = lows
    summary.cascade_prob_ci_high = highs
    return summary
end

function wilson_interval(p::Real, n::Integer; z::Real=1.96)
    n <= 0 && return (missing, missing)
    denom = 1 + z^2 / n
    centre = (p + z^2 / (2n)) / denom
    half = z * sqrt((p * (1 - p) + z^2 / (4n)) / n) / denom
    return (max(0.0, centre - half), min(1.0, centre + half))
end
