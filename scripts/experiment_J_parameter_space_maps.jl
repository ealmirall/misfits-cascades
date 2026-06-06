include(joinpath(@__DIR__, "revision_robustness_common.jl"))

const THETA_GRID = [0.55, 0.60, 0.65, 0.70, 0.75]
const SEED_FRACTION_GRID = [0.001, 0.003, 0.005, 0.01]
const MAP_BETAS = [0.4, 1.0]
const PREMIUM_GRID = [2, 3, 5, 10]
const DIGITAL_SIGMA_GRID = [0.25, 1.00]
const BETA_PI_BETAS = [0.05, 0.10, 0.20, 0.40, 0.70, 1.00]
const BETA_PI_GRID = [0.00, 0.01, 0.05, 0.10]

function experiment_J_cells(settings)
    cells = NamedTuple[]

    for beta in MAP_BETAS, theta_mean in THETA_GRID, seed_fraction in SEED_FRACTION_GRID
        base = base_revision_cell(settings; beta=beta, seed_fraction=seed_fraction, pi=0.05, threshold_params=(theta_mean=theta_mean, pi=0.05, theta_low=0.05))
        push!(cells, merge(base, (
            map_type=:theta_seed,
            map_label="theta x seed",
            map_panel=Symbol("beta_", replace(string(beta), "." => "p")),
            variant=:success_original,
            variant_label="success original",
            network_seed=6500 + round(Int, beta * 10),
            theta_mean=theta_mean,
            theta_sweep=theta_mean,
            seed_fraction_sweep=seed_fraction,
            rule=:complex,
            success_denominator=:better,
            min_successful_digital=0,
            min_better_total=0,
            count_k=1,
        )))
    end

    for premium in PREMIUM_GRID, sigma in DIGITAL_SIGMA_GRID
        for variant in (
            (variant=:success_original, variant_label="success original", min_successful_digital=0),
            (variant=:success_min2, variant_label="success: >=2 digital", min_successful_digital=2),
        )
            base = base_revision_cell(settings; beta=0.4, seed_fraction=0.006, pi=0.05)
            push!(cells, merge(base, (
                map_type=:premium_variance,
                map_label="premium x variance",
                map_panel=variant.variant,
                variant=variant.variant,
                variant_label=variant.variant_label,
                network_seed=6521,
                premium_ratio=premium,
                digital_growth_mean=0.15 * premium,
                digital_growth_sd=sigma,
                rule=:complex,
                success_denominator=:better,
                min_successful_digital=variant.min_successful_digital,
                min_better_total=0,
                count_k=1,
            )))
        end
    end

    for beta in BETA_PI_BETAS, pi in BETA_PI_GRID
        base = base_revision_cell(settings; beta=beta, seed_fraction=0.006, pi=pi, threshold_params=(theta_mean=settings.theta_mean, pi=pi, theta_low=0.05))
        push!(cells, merge(base, (
            map_type=:beta_pi,
            map_label="beta x pi",
            map_panel=:success_original,
            variant=:success_original,
            variant_label="success original",
            network_seed=6600 + round(Int, beta * 100),
            pi=pi,
            rule=:complex,
            success_denominator=:better,
            min_successful_digital=0,
            min_better_total=0,
            count_k=1,
        )))
    end

    return cells
end

function map_value(summary::DataFrame, filters::Pair...)
    mask = trues(nrow(summary))
    for (col, val) in filters
        mask .&= string.(summary[!, col]) .== string(val)
    end
    rows = summary[mask, :]
    nrow(rows) == 0 && return NaN
    return rows.cascade_prob[1]
end

function add_heat_text!(ax, xs, ys, z)
    for (i, x) in enumerate(xs), (j, y) in enumerate(ys)
        val = z[i, j]
        isnan(val) && continue
        text!(ax, x, y; text=@sprintf("%.2f", val), align=(:center, :center), fontsize=9, color=val > 0.55 ? :white : :black)
    end
end

function heat_matrix(summary::DataFrame, xs, ys, filters::AbstractVector{<:Pair}; xcol::Symbol, ycol::Symbol)
    z = fill(NaN, length(xs), length(ys))
    for (i, x) in enumerate(xs), (j, y) in enumerate(ys)
        z[i, j] = map_value(summary, [filters; [xcol => x, ycol => y]]...)
    end
    return z
end

function plot_theta_seed_map(summary::DataFrame, outdir::AbstractString)
    fig = Figure(size=(980, 440))
    for (idx, beta) in enumerate(MAP_BETAS)
        z = heat_matrix(
            summary,
            SEED_FRACTION_GRID,
            THETA_GRID,
            [:map_type => :theta_seed, :beta => beta],
            xcol=:seed_fraction_sweep,
            ycol=:theta_sweep,
        )
        ax = Axis(
            fig[1, idx],
            title=idx == 1 ? "Transition map at beta=0.4" : "Connected map at beta=1.0",
            xlabel="Initial digital seed fraction",
            ylabel=idx == 1 ? "Mean threshold θ̄" : "",
            xticks=(SEED_FRACTION_GRID, [@sprintf("%.3f", x) for x in SEED_FRACTION_GRID]),
            yticks=(THETA_GRID, [@sprintf("%.2f", y) for y in THETA_GRID]),
        )
        heatmap!(ax, SEED_FRACTION_GRID, THETA_GRID, z; colormap=:viridis, colorrange=(0, 1))
        add_heat_text!(ax, SEED_FRACTION_GRID, THETA_GRID, z)
    end
    Colorbar(fig[1, 3], limits=(0, 1), colormap=:viridis, label="Dynamic cascade probability")
    Label(fig[2, 1:3], "Mixture threshold treatment with pi=5%, theta_low=0.05. Dynamic cascade: final adoption >=0.5, t50-t10 <=45, max slope >=0.02."; fontsize=9, halign=:left, tellwidth=false)
    save_revision_figure(fig, outdir, "figure_theta_seed_map")
end

function plot_premium_variance_map(summary::DataFrame, outdir::AbstractString)
    panels = [:success_original, :success_min2]
    fig = Figure(size=(900, 400))
    for (idx, variant) in enumerate(panels)
        z = heat_matrix(
            summary,
            PREMIUM_GRID,
            DIGITAL_SIGMA_GRID,
            [:map_type => :premium_variance, :variant => variant],
            xcol=:premium_ratio,
            ycol=:digital_growth_sd,
        )
        ax = Axis(
            fig[1, idx],
            title=variant == :success_original ? "Premium map: original success rule" : "Premium map: >=2 successful digital neighbours",
            xlabel="Digital premium over traditional mean",
            ylabel=idx == 1 ? "Digital return σ" : "",
            xticks=(PREMIUM_GRID, string.(PREMIUM_GRID)),
            yticks=(DIGITAL_SIGMA_GRID, [@sprintf("%.2f", y) for y in DIGITAL_SIGMA_GRID]),
        )
        heatmap!(ax, PREMIUM_GRID, DIGITAL_SIGMA_GRID, z; colormap=:viridis, colorrange=(0, 1))
        add_heat_text!(ax, PREMIUM_GRID, DIGITAL_SIGMA_GRID, z)
    end
    Colorbar(fig[1, 3], limits=(0, 1), colormap=:viridis, label="Dynamic cascade probability")
    Label(fig[2, 1:3], "Beta=0.4, theta=0.70, seed fraction=0.006, pi=5%. Premium p means digital mean return = 0.15p."; fontsize=9, halign=:left, tellwidth=false)
    save_revision_figure(fig, outdir, "figure_premium_variance_map")
end

function plot_beta_pi_map(summary::DataFrame, outdir::AbstractString)
    z = heat_matrix(
        summary,
        BETA_PI_BETAS,
        BETA_PI_GRID,
        [:map_type => :beta_pi],
        xcol=:beta,
        ycol=:pi,
    )
    fig = Figure(size=(760, 430))
    ax = Axis(
        fig[1, 1],
        title="Misfit share matters only past the connectivity frontier",
        xlabel="Small-world beta",
        ylabel="Low-threshold share pi",
        xticks=(BETA_PI_BETAS, [@sprintf("%.2f", x) for x in BETA_PI_BETAS]),
        yticks=(BETA_PI_GRID, [@sprintf("%.2f", y) for y in BETA_PI_GRID]),
    )
    heatmap!(ax, BETA_PI_BETAS, BETA_PI_GRID, z; colormap=:viridis, colorrange=(0, 1))
    add_heat_text!(ax, BETA_PI_BETAS, BETA_PI_GRID, z)
    contour!(ax, BETA_PI_BETAS, BETA_PI_GRID, z; levels=[0.5], color=PUB_CRIMSON, linewidth=3)
    Colorbar(fig[1, 2], limits=(0, 1), colormap=:viridis, label="Dynamic cascade probability")
    Label(fig[2, 1:2], "Theta=0.70, seed fraction=0.006, theta_low=0.05. Crimson contour is cascade probability 0.5."; fontsize=9, halign=:left, tellwidth=false)
    save_revision_figure(fig, outdir, "figure_beta_pi_map")
end

function write_J_markdown(outdir::AbstractString, summary::DataFrame)
    function p(filters...)
        val = map_value(summary, filters...)
        isnan(val) ? "missing" : @sprintf("%.3f", val)
    end
    notes = """
    ## Direct answers

    - Theta/seed map, beta=0.4 at theta=0.70 and seed=0.006 is not on the exact grid; nearest seed=0.005 gives $(p(:map_type => :theta_seed, :beta => 0.4, :theta_sweep => 0.70, :seed_fraction_sweep => 0.005)).
    - Theta/seed map, beta=1.0 at theta=0.70 and seed=0.005 gives $(p(:map_type => :theta_seed, :beta => 1.0, :theta_sweep => 0.70, :seed_fraction_sweep => 0.005)).
    - Premium/variance map at baseline premium=10 and sigma=1.0 gives original $(p(:map_type => :premium_variance, :variant => :success_original, :premium_ratio => 10, :digital_growth_sd => 1.0)) and min2 $(p(:map_type => :premium_variance, :variant => :success_min2, :premium_ratio => 10, :digital_growth_sd => 1.0)).
    - Beta/pi map at beta=0.4, pi=0.05 gives $(p(:map_type => :beta_pi, :beta => 0.4, :pi => 0.05)); at beta=1.0, pi=0.10 gives $(p(:map_type => :beta_pi, :beta => 1.0, :pi => 0.10)).
    - These maps use the calibrated production replacement-entry rule (`bernoulli_seed_probability`); Experiment I reports the ablation against `traditional_only`.
    """
    write_summary_markdown(joinpath(outdir, "summary.md"), "Experiment J: Parameter-Space Maps", summary; notes=notes)
end

function run_experiment_J(; args=ARGS)
    mode = revision_mode_settings(args)
    outdir = ensure_revision_dir("experiment_J_parameter_space_maps")
    cells = experiment_J_cells(mode.settings)
    reps = mode.smoke ? 5 : 100
    runs = run_revision_cells(cells, reps, mode.settings, mode.seed, "experiment_J_parameter_space_maps")
    groupcols = [
        :map_type,
        :map_label,
        :map_panel,
        :variant,
        :variant_label,
        :beta,
        :theta_mean,
        :theta_sweep,
        :seed_fraction_sweep,
        :pi,
        :premium_ratio,
        :digital_growth_sd,
        :success_denominator,
        :min_successful_digital,
        :replacement_digital_rule,
    ]
    summary = summarize_revision_runs(runs, groupcols)
    sort!(summary, [:map_type, :map_panel, :beta, :theta_sweep, :seed_fraction_sweep, :pi, :premium_ratio, :digital_growth_sd])
    CSV.write(joinpath(outdir, "raw_runs.csv"), runs)
    CSV.write(joinpath(outdir, "summary.csv"), summary)
    write_J_markdown(outdir, summary)
    plot_theta_seed_map(summary, outdir)
    plot_premium_variance_map(summary, outdir)
    plot_beta_pi_map(summary, outdir)
    write_revision_metadata(joinpath(outdir, "metadata.json"), "experiment_J_parameter_space_maps", mode.settings, mode.seed, cells; extra=Dict("mode" => mode.mode, "reps_per_cell" => reps, "replacement_rule" => "bernoulli_seed_probability"))
    return summary
end

if abspath(PROGRAM_FILE) == @__FILE__
    run_experiment_J()
end
