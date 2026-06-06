using CairoMakie
using DataFrames
using Misfits
using Printf
using Statistics

function expA_cells(settings, seed)
    base = (
        family=:small_world,
        beta=1.0,
        k=settings.k,
        N=settings.N,
        threshold_treatment=:mixture,
        threshold_params=(theta_mean=settings.theta_mean, pi=0.10, theta_low=0.05),
        seed_strategy=:random,
        seed_fraction=0.01,
        pioneer_strategy=:random,
        vary_network=false,
        network_seed=seed + 100,
    )
    return [
        merge(base, (rule=:hazard, hazard_h=0.01)),
        merge(base, (rule=:simple,)),
        merge(base, (rule=:complex, focal=true)),
    ]
end

function plot_expA(runs::DataFrame, summary::DataFrame, figdir::AbstractString)
    rules = [:hazard, :simple, :complex]
    xs = [findfirst(==(r), rules) for r in runs.rule]
    fig = Figure(size=(900, 560))
    ax = Axis(fig[1, 1], ylabel="Final adoption", xlabel="Adoption rule", xticks=(1:3, string.(rules)))
    boxplot!(ax, xs, runs.final_adoption; color=xs)
    for (i, r) in enumerate(rules)
        srow = summary[summary.rule .== r, :]
        if nrow(srow) > 0
            text!(ax, i, 0.96; text=@sprintf("Pr(cascade)=%.2f", srow.cascade_prob[1]), align=(:center, :top), fontsize=13)
        end
    end
    ylims!(ax, 0, 1)
    save(joinpath(figdir, "expA_final_adoption_by_rule.png"), fig)
    save(joinpath(figdir, "expA_final_adoption_by_rule.pdf"), fig)
end

function run_expA(; quick=true, seed=20260603)
    root = dirname(dirname(@__FILE__))
    ensure_output_dirs(root)
    settings = quick ? quick_settings() : full_settings()
    cells = expA_cells(settings, seed)
    out = run_parameter_grid(
        "expA_nullmodels",
        cells;
        settings=settings,
        seed=seed,
        output_prefix="expA_nullmodels",
        result_dir=joinpath(root, "results"),
    )
    plot_expA(out.runs, out.summary, joinpath(root, "figures"))
    return out
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = parse_common_args(ARGS)
    run_expA(; quick=args.quick, seed=args.seed)
end
