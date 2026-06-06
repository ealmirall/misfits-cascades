using CairoMakie
using DataFrames
using Misfits
using Statistics

function expD_cells(settings)
    strategies = [:random, :high_degree, :bridge, :clustered]
    cells = NamedTuple[]
    for strategy in strategies
        push!(cells, (
            family=:small_world,
            beta=0.4,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=strategy,
            seed_fraction=0.006,
            seed_count=seed_count_from_fraction(settings.N, 0.006),
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=1701,
            focal=strategy == :bridge,
        ))
        push!(cells, (
            family=:power_law,
            m=2,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=strategy,
            seed_fraction=settings.seed_fraction,
            seed_count=seed_count_from_fraction(settings.N, settings.seed_fraction),
            pioneer_strategy=:random,
            vary_network=false,
            network_seed=1702,
            focal=strategy == :high_degree,
        ))
    end
    return cells
end

function plot_expD(runs::DataFrame, figdir::AbstractString)
    agg = combine(groupby(runs, [:family, :seed_strategy]), :cascade => mean => :cascade_prob, :t50 => (x -> isempty(collect(skipmissing(x))) ? missing : median(collect(skipmissing(x)))) => :t50_median)
    families = [:small_world, :power_law]
    strategies = [:random, :high_degree, :bridge, :clustered]
    x = Float64[]
    heights = Float64[]
    colors = Symbol[]
    labels = String[]
    for (fi, fam) in enumerate(families), (si, strategy) in enumerate(strategies)
        row = agg[(agg.family .== fam) .& (agg.seed_strategy .== strategy), :]
        push!(x, si + (fi - 1) * (length(strategies) + 1))
        push!(heights, nrow(row) == 0 ? 0.0 : row.cascade_prob[1])
        push!(colors, fi == 1 ? :steelblue : :darkorange)
        push!(labels, string(strategy))
    end
    fig = Figure(size=(1050, 520))
    ax = Axis(fig[1, 1], xlabel="Initial digital seed placement", ylabel="Cascade probability", xticks=(x, labels))
    barplot!(ax, x, heights; color=colors)
    text!(ax, mean(x[1:4]), 0.98; text="small_world", align=(:center, :top))
    text!(ax, mean(x[5:8]), 0.98; text="power_law", align=(:center, :top))
    ylims!(ax, 0, 1)
    save(joinpath(figdir, "expD_seedplacement_cascade.png"), fig)
    save(joinpath(figdir, "expD_seedplacement_cascade.pdf"), fig)
end

function run_expD(; quick=true, seed=20260603)
    root = dirname(dirname(@__FILE__))
    ensure_output_dirs(root)
    settings = quick ? quick_settings() : full_settings()
    out = run_parameter_grid(
        "expD_seedplacement",
        expD_cells(settings);
        settings=settings,
        seed=seed,
        output_prefix="expD_seedplacement",
        result_dir=joinpath(root, "results"),
    )
    plot_expD(out.runs, joinpath(root, "figures"))
    return out
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = parse_common_args(ARGS)
    run_expD(; quick=args.quick, seed=args.seed)
end
