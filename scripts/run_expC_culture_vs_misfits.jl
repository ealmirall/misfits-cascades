using CairoMakie
using DataFrames
using Misfits
using Printf
using Statistics

function expC_cells(settings, quick)
    pis = quick ? [0.01, 0.05, 0.10] : Misfits.MIXTURE_PIS
    connectivity = quick ? [0.05, 0.2, 0.7] : [0.05, 0.1, 0.2, 0.4, 0.7]
    cells = NamedTuple[]
    base = (
        family=:small_world,
        beta=0.4,
        k=settings.k,
        N=settings.N,
        seed_strategy=:random,
        seed_fraction=0.01,
        vary_network=false,
        network_seed=9001,
    )
    push!(cells, merge(base, (threshold_treatment=:homogeneous, threshold_params=(theta_mean=settings.theta_mean,), focal=true)))
    lower_theta_mean = max(settings.theta_mean - 0.02, 0.0)
    push!(cells, merge(base, (threshold_treatment=:lower_mean, threshold_params=(theta_mean=settings.theta_mean, theta_low_mean=lower_theta_mean), focal=true)))
    push!(cells, merge(base, (threshold_treatment=:higher_variance, threshold_params=(theta_mean=settings.theta_mean, sigma_high=0.15), focal=true)))
    for pi in pis
        push!(cells, merge(base, (threshold_treatment=:mixture, threshold_params=(theta_mean=settings.theta_mean, pi=pi, theta_low=0.05), focal=pi == 0.05)))
    end
    for beta in connectivity, pi in pis
        push!(cells, (
            family=:small_world,
            beta=beta,
            k=settings.k,
            N=settings.N,
            threshold_treatment=:mixture,
            threshold_params=(theta_mean=settings.theta_mean, pi=pi, theta_low=0.05),
            seed_strategy=:random,
            seed_fraction=0.01,
            vary_network=true,
        ))
    end
    return cells
end

function treatment_label(row)
    if row.threshold_treatment == :mixture
        return @sprintf("mixture pi=%.2f", row.pi)
    else
        return string(row.threshold_treatment)
    end
end

function add_treatment_labels!(df::DataFrame)
    df.treatment_label = [treatment_label(row) for row in eachrow(df)]
    return df
end

function plot_expC(runs::DataFrame, curves::DataFrame, figdir::AbstractString)
    add_treatment_labels!(runs)
    add_treatment_labels!(curves)
    main = curves[curves.beta .== 0.4, :]
    curve_summary = combine(
        groupby(main, [:treatment_label, :t]),
        :A => median => :A_median,
        :A => (x -> quantile(x, 0.05)) => :A_p05,
        :A => (x -> quantile(x, 0.95)) => :A_p95,
    )
    labels = unique(curve_summary.treatment_label)
    palette = [:steelblue, :darkorange, :forestgreen, :crimson, :purple, :brown, :black]
    colors = palette[1:length(labels)]
    fig1 = Figure(size=(900, 560))
    ax = Axis(fig1[1, 1], xlabel="Period", ylabel="Digital adoption")
    for (i, label) in enumerate(labels)
        d = curve_summary[curve_summary.treatment_label .== label, :]
        sort!(d, :t)
        band!(ax, d.t, d.A_p05, d.A_p95; color=(colors[i], 0.18))
        lines!(ax, d.t, d.A_median; color=colors[i], linewidth=2, label=label)
    end
    axislegend(ax; position=:rb)
    ylims!(ax, 0, 1)
    save(joinpath(figdir, "expC_adoption_curves.png"), fig1)
    save(joinpath(figdir, "expC_adoption_curves.pdf"), fig1)

    main_runs = runs[runs.beta .== 0.4, :]
    xs = [findfirst(==(x), unique(main_runs.treatment_label)) for x in main_runs.treatment_label]
    fig2 = Figure(size=(1000, 520))
    ax2 = Axis(fig2[1, 1], xlabel="Treatment", ylabel="Final adoption", xticks=(1:length(unique(main_runs.treatment_label)), unique(main_runs.treatment_label)))
    boxplot!(ax2, xs, main_runs.final_adoption; color=xs)
    ylims!(ax2, 0, 1)
    save(joinpath(figdir, "expC_final_adoption_by_treatment.png"), fig2)
    save(joinpath(figdir, "expC_final_adoption_by_treatment.pdf"), fig2)

    mix = runs[runs.threshold_treatment .== :mixture, :]
    heat = combine(groupby(mix, [:pi, :beta]), :cascade => mean => :cascade_prob)
    pis = sort(unique(heat.pi))
    betas = sort(unique(heat.beta))
    z = fill(NaN, length(pis), length(betas))
    for row in eachrow(heat)
        z[findfirst(==(row.pi), pis), findfirst(==(row.beta), betas)] = row.cascade_prob
    end
    fig3 = Figure(size=(760, 520))
    ax3 = Axis(fig3[1, 1], xlabel="Small-world beta", ylabel="Misfit share pi", xticks=(1:length(betas), string.(betas)), yticks=(1:length(pis), string.(pis)))
    heatmap!(ax3, 1:length(betas), 1:length(pis), z')
    Colorbar(fig3[1, 2], limits=(0, 1), label="Cascade probability")
    save(joinpath(figdir, "expC_mixture_heatmap.png"), fig3)
    save(joinpath(figdir, "expC_mixture_heatmap.pdf"), fig3)
end

function run_expC(; quick=true, seed=20260603)
    root = dirname(dirname(@__FILE__))
    ensure_output_dirs(root)
    settings = quick ? quick_settings() : full_settings()
    out = run_parameter_grid(
        "expC_culture_vs_misfits",
        expC_cells(settings, quick);
        settings=settings,
        seed=seed,
        output_prefix="expC_culture_vs_misfits",
        result_dir=joinpath(root, "results"),
    )
    plot_expC(out.runs, out.curves, joinpath(root, "figures"))
    return out
end

if abspath(PROGRAM_FILE) == @__FILE__
    args = parse_common_args(ARGS)
    run_expC(; quick=args.quick, seed=args.seed)
end
