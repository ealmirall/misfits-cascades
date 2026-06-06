using CairoMakie
using DataFrames
using Misfits
using Printf
using Statistics

function expE_cells(settings)
    strategies = [:random, :hub_bridge]
    cells = NamedTuple[]
    seed_count = seed_count_from_fraction(settings.N, 0.006)
    pioneer_count = seed_count_from_fraction(settings.N, 0.05)
    for seed_strategy in strategies, pioneer_strategy in strategies
        push!(cells, (
            family=:small_world,
            beta=0.4,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=seed_strategy,
            seed_count=seed_count,
            seed_fraction=seed_count / settings.N,
            pioneer_strategy=pioneer_strategy,
            pioneer_count=pioneer_count,
            pioneer_fraction=pioneer_count / settings.N,
            vary_network=false,
            network_seed=2701,
            focal=true,
        ))
    end
    return cells
end

function plot_expE(summary::DataFrame, figdir::AbstractString)
    seed_levels = [:random, :hub_bridge]
    pioneer_levels = [:random, :hub_bridge]
    z = fill(0.0, 2, 2)
    for row in eachrow(summary)
        sx = findfirst(==(row.seed_strategy), seed_levels)
        py = findfirst(==(row.pioneer_strategy), pioneer_levels)
        sx !== nothing && py !== nothing && (z[sx, py] = row.cascade_prob)
    end
    fig = Figure(size=(620, 500))
    ax = Axis(fig[1, 1], title="Initial seeds and receptive pioneers both shape takeoff", xlabel="Initial digital seed placement", ylabel="Low-threshold pioneer placement", xticks=(1:2, ["random", "hub/bridge"]), yticks=(1:2, ["random", "hub/bridge"]))
    heatmap!(ax, 1:2, 1:2, z; colormap=:viridis, colorrange=(0, 1))
    for i in 1:2, j in 1:2
        text!(ax, i, j; text=@sprintf("%.2f", z[i, j]), align=(:center, :center), color=z[i, j] > 0.55 ? :white : :black)
    end
    Colorbar(fig[1, 2], limits=(0, 1), colormap=:viridis, label="Dynamic cascade probability")
    save(joinpath(figdir, "expE_seed_x_pioneer.png"), fig)
    save(joinpath(figdir, "expE_seed_x_pioneer.pdf"), fig)
end

function run_expE(; quick=true, seed=20260603)
    root = dirname(dirname(@__FILE__))
    ensure_output_dirs(root)
    settings = quick ? quick_settings() : full_settings()
    out = run_parameter_grid(
        "expE_seed_x_pioneer",
        expE_cells(settings);
        settings=settings,
        seed=seed,
        output_prefix="expE_seed_x_pioneer",
        result_dir=joinpath(root, "results"),
    )
    plot_expE(out.summary, joinpath(root, "figures"))
    return out
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = parse_common_args(ARGS)
    run_expE(; quick=args.quick, seed=args.seed)
end
