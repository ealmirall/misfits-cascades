using CairoMakie
using DataFrames
using Misfits
using Printf
using Statistics

function robustness_cells(settings, quick)
    cells = NamedTuple[]
    focal_beta = 0.4
    focal_seed_fraction = 0.006
    premiums = quick ? [2.0, 5.0, 10.0] : [1.5, 2.0, 3.0, 5.0, 10.0]
    sigmas = quick ? [0.5, 1.0] : [0.25, 0.75, 1.0]
    for premium in premiums, sigmaD in sigmas
        push!(cells, (
            family=:small_world,
            beta=focal_beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=focal_seed_fraction,
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=4101,
            traditional_growth_mean=0.15,
            traditional_growth_sd=0.10,
            digital_growth_mean=0.15 * premium,
            digital_growth_sd=sigmaD,
            premium_ratio=premium,
            robustness_axis=:premium_sigma,
            focal=false,
        ))
    end
    for theta in (settings.theta_mean - 0.05, settings.theta_mean, settings.theta_mean + 0.05)
        push!(cells, (
            family=:small_world,
            beta=focal_beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=theta, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=focal_seed_fraction,
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=4102,
            theta_sweep=theta,
            robustness_axis=:theta_mean,
            focal=false,
        ))
    end
    for seed_frac in (focal_seed_fraction / 2, focal_seed_fraction, focal_seed_fraction * 2)
        push!(cells, (
            family=:small_world,
            beta=focal_beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=seed_frac,
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=4103,
            seed_fraction_sweep=seed_frac,
            robustness_axis=:seed_fraction,
            focal=false,
        ))
    end
    for sync in (true, false)
        push!(cells, (
            family=:small_world,
            beta=focal_beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=focal_seed_fraction,
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=4104,
            synchronous=sync,
            update_schedule=sync ? :synchronous : :asynchronous,
            robustness_axis=:update_schedule,
            focal=false,
        ))
    end
    for distribution in (:normal, :truncated_normal, :lognormal)
        push!(cells, (
            family=:small_world,
            beta=focal_beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=focal_seed_fraction,
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=4105,
            return_distribution=distribution,
            return_distribution_sweep=distribution,
            robustness_axis=:return_distribution,
            focal=false,
        ))
    end
    for benchmark in (:own, :mean, :median, :p75)
        push!(cells, (
            family=:small_world,
            beta=focal_beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=focal_seed_fraction,
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=4106,
            performance_benchmark=benchmark,
            benchmark_percentile=0.75,
            performance_benchmark_sweep=benchmark,
            robustness_axis=:performance_benchmark,
            focal=false,
        ))
    end
    for (label, enabled, h) in [(:absorbing, false, 0.0), (:nonabsorbing, true, 0.02)]
        push!(cells, (
            family=:small_world,
            beta=focal_beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=focal_seed_fraction,
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=4107,
            allow_abandonment=enabled,
            abandonment_h=h,
            abandonment_sweep=label,
            robustness_axis=:abandonment,
            focal=false,
        ))
    end
    return cells
end

function plot_robustness(summary::DataFrame, figdir::AbstractString)
    sort!(summary, [:robustness_axis, :premium_ratio, :digital_growth_sd, :theta_sweep, :seed_fraction_sweep, :update_schedule, :return_distribution_sweep, :performance_benchmark_sweep, :abandonment_sweep])
    fig = Figure(size=(1120, 460))
    ax = Axis(fig[1, 1], title="Robustness: dynamic cascades across focal parameter sweeps", xlabel="Robustness cell", ylabel="Dynamic cascade probability")
    labels = String[]
    for row in eachrow(summary)
        axis = string(row.robustness_axis)
        detail =
            axis == "premium_sigma" ? @sprintf("%.1fx, σ=%.2f", row.premium_ratio, row.digital_growth_sd) :
            axis == "theta_mean" ? @sprintf("θ̄=%.2f", row.theta_sweep) :
            axis == "seed_fraction" ? @sprintf("seed=%.3f", row.seed_fraction_sweep) :
            axis == "update_schedule" ? string(row.update_schedule) :
            axis == "return_distribution" ? string(row.return_distribution_sweep) :
            axis == "performance_benchmark" ? string(row.performance_benchmark_sweep) :
            axis == "abandonment" ? string(row.abandonment_sweep) :
            axis
        push!(labels, string(axis, "\n", detail))
    end
    xs = 1:nrow(summary)
    barplot!(ax, xs, summary.cascade_prob; color=:steelblue)
    errorbars!(
        ax,
        xs,
        summary.cascade_prob,
        summary.cascade_prob .- summary.cascade_prob_ci_low,
        summary.cascade_prob_ci_high .- summary.cascade_prob;
        color=:black,
        whiskerwidth=6,
    )
    ax.xticks = (xs, labels)
    ax.xticklabelrotation = pi / 4
    ylims!(ax, 0, 1)
    save(joinpath(figdir, "robustness_summary.png"), fig)
    save(joinpath(figdir, "robustness_summary.pdf"), fig)
end

function run_robustness(; quick=true, seed=20260603)
    root = dirname(dirname(@__FILE__))
    ensure_output_dirs(root)
    settings = quick ? quick_settings() : full_settings()
    out = run_parameter_grid(
        "robustness",
        robustness_cells(settings, quick);
        settings=settings,
        seed=seed,
        output_prefix="robustness",
        result_dir=joinpath(root, "results"),
    )
    plot_robustness(out.summary, joinpath(root, "figures"))
    return out
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = parse_common_args(ARGS)
    run_robustness(; quick=args.quick, seed=args.seed)
end
