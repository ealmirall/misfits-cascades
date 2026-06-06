using CairoMakie
using DataFrames
using Misfits
using Statistics

function equal_effort_cells(settings)
    cells = NamedTuple[]
    budgets = [0.02, 0.05]
    theta_low = 0.05
    for budget in budgets
        lower_mean = max(settings.theta_mean - budget, 0.0)
        sigma_high = budget * sqrt(pi / 2)
        pi_l1 = clamp(budget / (2 * max(settings.theta_mean - theta_low, eps())), 0.005, 0.20)
        for (treatment, params, label) in [
            (:lower_mean, (theta_mean=settings.theta_mean, theta_low_mean=lower_mean), :l1_lower_mean),
            (:higher_variance, (theta_mean=settings.theta_mean, sigma_high=sigma_high), :l1_higher_variance),
            (:mixture, (theta_mean=settings.theta_mean, pi=pi_l1, theta_low=theta_low), :l1_mixture),
        ]
            push!(cells, (
                family=:small_world,
                beta=0.4,
                k=settings.k,
                N=settings.N,
                threshold_treatment=treatment,
                threshold_params=params,
                effort_metric=:l1,
                effort_budget=budget,
                effort_label=label,
                seed_strategy=:random,
                seed_fraction=0.01,
                pioneer_strategy=:random,
                vary_network=false,
                network_seed=3301,
                focal=true,
            ))
        end
    end
    masses = [0.03, 0.05]
    theta_crit = 0.10
    for mass in masses
        for (treatment, params, label) in [
            (:lower_mean, (theta_mean=settings.theta_mean, theta_low_mean=theta_crit), :mass_lower_mean),
            (:higher_variance, (theta_mean=settings.theta_mean, sigma_high=(settings.theta_mean - theta_crit) / 1.645), :mass_higher_variance),
            (:mixture, (theta_mean=settings.theta_mean, pi=mass, theta_low=theta_low), :mass_mixture),
        ]
            push!(cells, (
                family=:small_world,
                beta=0.4,
                k=settings.k,
                N=settings.N,
                threshold_treatment=treatment,
                threshold_params=params,
                effort_metric=:mass_below_crit,
                effort_budget=mass,
                theta_crit=theta_crit,
                effort_label=label,
                seed_strategy=:random,
                seed_fraction=0.01,
                pioneer_strategy=:random,
                vary_network=false,
                network_seed=3302,
                focal=true,
            ))
        end
    end
    return cells
end

function plot_equal_effort(summary::DataFrame, figdir::AbstractString)
    fig = Figure(size=(900, 420))
    ax = Axis(fig[1, 1], title="Equal-effort threshold shifts: lower-tail mass remains pivotal", xlabel="Effort treatment", ylabel="Dynamic cascade probability")
    labels = string.(summary.effort_label)
    xs = 1:nrow(summary)
    colors = [occursin("mixture", l) ? :steelblue : occursin("variance", l) ? :seagreen : :grey for l in labels]
    barplot!(ax, xs, summary.cascade_prob; color=colors)
    ax.xticks = (xs, labels)
    ylims!(ax, 0, 1)
    save(joinpath(figdir, "expC_equal_effort.png"), fig)
    save(joinpath(figdir, "expC_equal_effort.pdf"), fig)
end

function run_equal_effort(; quick=true, seed=20260603)
    root = dirname(dirname(@__FILE__))
    ensure_output_dirs(root)
    settings = quick ? quick_settings() : full_settings()
    out = run_parameter_grid(
        "expC_equal_effort",
        equal_effort_cells(settings);
        settings=settings,
        seed=seed,
        output_prefix="expC_equal_effort",
        result_dir=joinpath(root, "results"),
    )
    plot_equal_effort(out.summary, joinpath(root, "figures"))
    return out
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = parse_common_args(ARGS)
    run_equal_effort(; quick=args.quick, seed=args.seed)
end
