using CairoMakie
using DataFrames
using Misfits
using Statistics

function expB_cells(settings, quick)
    betas = quick ? [0.01, 0.1, 0.4, 1.0] : Misfits.SMALL_WORLD_BETAS
    ms = quick ? [2, 5, 8] : Misfits.BA_MS
    cells = NamedTuple[]
    for beta in betas
        push!(cells, (
            family=:small_world,
            beta=beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=0.006,
            pioneer_strategy=:random,
            vary_network=true,
            focal=beta == 0.4,
        ))
    end
    for m in ms
        push!(cells, (
            family=:power_law,
            m=m,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=0.006,
            pioneer_strategy=:random,
            vary_network=true,
            focal=m == 5,
        ))
        push!(cells, (
            family=:degree_matched_random,
            m=m,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=0.006,
            pioneer_strategy=:random,
            vary_network=true,
            focal=false,
        ))
    end
    return cells
end

function plot_expB(runs::DataFrame, figdir::AbstractString)
    sw = combine(groupby(runs[runs.family .== :small_world, :], :beta), :cascade => mean => :cascade_prob)
    sort!(sw, :beta)
    ba = combine(groupby(runs[runs.family .== :power_law, :], :m), :cascade => mean => :cascade_prob)
    sort!(ba, :m)
    pooled = combine(groupby(runs, [:family, :beta, :m]), :cascade => mean => :cascade_prob, :avg_path_length => mean => :avg_path)

    fig = Figure(size=(1200, 420))
    ax1 = Axis(fig[1, 1], xlabel="Small-world beta", ylabel="Cascade probability", xscale=log10)
    sw_beta = Float64.(sw.beta)
    lines!(ax1, sw_beta, sw.cascade_prob, linewidth=2)
    scatter!(ax1, sw_beta, sw.cascade_prob; marker=:circle, markersize=10)
    ylims!(ax1, 0, 1)
    ax2 = Axis(fig[1, 2], xlabel="BA m", ylabel="Cascade probability")
    ba_m = Float64.(ba.m)
    lines!(ax2, ba_m, ba.cascade_prob, linewidth=2, color=:darkorange)
    scatter!(ax2, ba_m, ba.cascade_prob; marker=:rect, markersize=10, color=:darkorange)
    ylims!(ax2, 0, 1)
    ax3 = Axis(fig[1, 3], xlabel="Average path length", ylabel="Cascade probability")
    point_colors = [fam == :small_world ? :steelblue : :darkorange for fam in pooled.family]
    scatter!(ax3, pooled.avg_path, pooled.cascade_prob; color=point_colors, markersize=12)
    ylims!(ax3, 0, 1)
    save(joinpath(figdir, "expB_topology_sweep.png"), fig)
    save(joinpath(figdir, "expB_topology_sweep.pdf"), fig)
end

function run_expB(; quick=true, seed=20260603)
    root = dirname(dirname(@__FILE__))
    ensure_output_dirs(root)
    settings = quick ? quick_settings() : full_settings()
    out = run_parameter_grid(
        "expB_topology",
        expB_cells(settings, quick);
        settings=settings,
        seed=seed,
        output_prefix="expB_topology",
        result_dir=joinpath(root, "results"),
    )
    plot_expB(out.runs, joinpath(root, "figures"))
    return out
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = parse_common_args(ARGS)
    run_expB(; quick=args.quick, seed=args.seed)
end
