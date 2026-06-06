using CairoMakie

const PUB_NAVY = RGBf(31 / 255, 78 / 255, 121 / 255)
const PUB_ORANGE = RGBf(224 / 255, 123 / 255, 39 / 255)
const PUB_GREEN = RGBf(46 / 255, 139 / 255, 87 / 255)
const PUB_CRIMSON = RGBf(192 / 255, 57 / 255, 43 / 255)
const PUB_GREY = RGBf(127 / 255, 140 / 255, 141 / 255)

function set_publication_theme!()
    set_theme!(
        Theme(
            fontsize = 11,
            font = "Helvetica",
            Axis = (
                topspinevisible = false,
                rightspinevisible = false,
                xgridvisible = false,
                ygridvisible = true,
                ygridcolor = (:grey80, 0.45),
                ygridwidth = 0.8,
                titlesize = 13,
                titlealign = :left,
                xlabelsize = 11,
                ylabelsize = 11,
                xticklabelsize = 9,
                yticklabelsize = 9,
            ),
            Legend = (
                framevisible = false,
                labelsize = 9,
                titlesize = 10,
            ),
        ),
    )
end

function save_publication_figure(fig::Figure, figdir::AbstractString, basename::AbstractString)
    mkpath(figdir)
    save(joinpath(figdir, "$basename.pdf"), fig)
    save(joinpath(figdir, "$basename.png"), fig; px_per_unit = 300 / 96)
    return nothing
end

function read_result(result_dir::AbstractString, filename::AbstractString)
    path = joinpath(result_dir, filename)
    isfile(path) || error("Missing result file: $path")
    return CSV.read(path, DataFrame)
end

as_string(x) = x === missing ? "" : string(x)
is_true_value(x) = x === true || lowercase(as_string(x)) == "true"
is_false_value(x) = x === false || lowercase(as_string(x)) == "false"

function maybe_float(x)
    x === missing && return missing
    x isa AbstractFloat && return Float64(x)
    x isa Integer && return Float64(x)
    s = strip(string(x))
    isempty(s) && return missing
    return parse(Float64, s)
end

function approx_value(x, target; atol=1e-8)
    v = maybe_float(x)
    return v !== missing && isapprox(v, target; atol=atol)
end

function row_label_treatment(row)
    treatment = as_string(row.threshold_treatment)
    if treatment == "mixture"
        pi = maybe_float(row.pi)
        return pi === missing ? "mixture" : @sprintf("mixture pi=%.2f", pi)
    end
    return treatment
end

function add_bar_labels!(ax, xs, ys; dy=0.025, color=:black)
    for (x, y) in zip(xs, ys)
        text!(ax, x, min(y + dy, 1.03); text=@sprintf("%.2f", y), align=(:center, :bottom), fontsize=9, color=color)
    end
end

function rep_text(df::DataFrame)
    if !(:n_runs in propertynames(df)) || nrow(df) == 0
        return "R reported in source CSV"
    end
    runs = collect(skipmissing(df.n_runs))
    isempty(runs) && return "R reported in source CSV"
    lo, hi = minimum(runs), maximum(runs)
    return lo == hi ? "R=$(lo)" : "R=$(lo)-$(hi) by cell"
end

function cascade_definition_text(result_dir::AbstractString, filename::AbstractString)
    path = joinpath(result_dir, filename)
    if isfile(path)
        rows = CSV.Rows(path; limit=1)
        for row in rows
            cutoff = hasproperty(row, :cascade_final_cutoff) ? row.cascade_final_cutoff : "0.5"
            window = hasproperty(row, :cascade_transition_window) ? row.cascade_transition_window : "45"
            slope = hasproperty(row, :cascade_slope_min) ? row.cascade_slope_min : "0.02"
            return "Dynamic cascade: final adoption >= $(cutoff), t50-t10 <= $(window), max one-period slope >= $(slope)."
        end
    end
    return "Dynamic cascade: final adoption >= 0.5, t50-t10 <= 45, max one-period slope >= 0.02."
end

function add_note!(fig::Figure, text::AbstractString)
    Label(fig[end + 1, :], text; fontsize=8, tellwidth=false, halign=:left)
    return nothing
end

function ci_vectors(df::DataFrame)
    p = Float64.(df.cascade_prob)
    lo = Float64.(df.cascade_prob_ci_low)
    hi = Float64.(df.cascade_prob_ci_high)
    return p, p .- lo, hi .- p
end

function add_y_ci!(ax, xs, df::DataFrame; whiskerwidth=7, color=:black)
    p, low, high = ci_vectors(df)
    errorbars!(ax, Float64.(xs), p, low, high; color=color, whiskerwidth=whiskerwidth)
    return nothing
end

function safe_only(v, default=missing)
    return isempty(v) ? default : only(v)
end

function treatment_display(treatment::AbstractString)
    treatment == "lower_mean" && return "lower mean"
    treatment == "higher_variance" && return "higher variance"
    treatment == "homogeneous" && return "homogeneous"
    treatment == "mixture" && return "mixture"
    return replace(treatment, "_" => " ")
end

function interpolate_crossing(xs::Vector{Float64}, ys::Vector{Float64}, level::Float64)
    for i in 1:(length(xs) - 1)
        y1, y2 = ys[i], ys[i + 1]
        if y1 == level
            return xs[i]
        elseif (y1 - level) * (y2 - level) <= 0 && y1 != y2
            lx1, lx2 = log10(xs[i]), log10(xs[i + 1])
            frac = (level - y1) / (y2 - y1)
            return 10.0 ^ (lx1 + frac * (lx2 - lx1))
        end
    end
    return missing
end

function figure1_mechanism(result_dir::AbstractString, figdir::AbstractString)
    runs = read_result(result_dir, "expA_nullmodels_runs.csv")
    summary = read_result(result_dir, "expA_nullmodels_summary.csv")
    rules = ["hazard", "simple", "complex"]
    rule_labels = ["exogenous hazard", "frequency-based", "success-based"]
    colors = Dict("hazard" => PUB_GREY, "simple" => PUB_ORANGE, "complex" => PUB_NAVY)

    fig = Figure(size=(860, 390))
    ax1 = Axis(fig[1, 1], title="(a) Success-based imitation creates the adoption jump", xlabel="Adoption rule", ylabel="Final adoption", xticks=(1:3, rule_labels))
    hlines!(ax1, [0.5]; color=(:black, 0.55), linestyle=:dot, linewidth=1.5)
    for (i, rule) in enumerate(rules)
        vals = runs.final_adoption[as_string.(runs.rule) .== rule]
        violin!(ax1, fill(i, length(vals)), vals; color=(colors[rule], 0.42), strokecolor=:transparent, width=0.75)
        boxplot!(ax1, fill(i, length(vals)), vals; color=(:white, 0.72), strokecolor=colors[rule], whiskerwidth=0.35, width=0.28)
    end
    ylims!(ax1, 0, 1.04)

    ax2 = Axis(fig[1, 2], title="(b) Dynamic cascades are mechanism-specific", xlabel="Adoption rule", ylabel="Cascade probability", xticks=(1:3, rule_labels))
    ordered = vcat([summary[as_string.(summary.rule) .== rule, :] for rule in rules]...)
    probs, lowerr, higherr = ci_vectors(ordered)
    barplot!(ax2, 1:3, probs; color=[colors[r] for r in rules], width=0.68)
    errorbars!(ax2, 1:3, probs, lowerr, higherr; color=:black, whiskerwidth=8)
    hlines!(ax2, [0.5]; color=(:black, 0.55), linestyle=:dot, linewidth=1.5)
    add_bar_labels!(ax2, 1:3, probs)
    ylims!(ax2, 0, 1.05)
    add_note!(fig, string(rep_text(summary), ". ", cascade_definition_text(result_dir, "expA_nullmodels_runs.csv")))

    save_publication_figure(fig, figdir, "fig1_mechanism")
end

function figure2_topology(result_dir::AbstractString, figdir::AbstractString)
    summary = read_result(result_dir, "expB_topology_summary.csv")
    runs = read_result(result_dir, "expB_topology_runs.csv")

    sw = summary[as_string.(summary.family) .== "small_world", :]
    sort!(sw, :beta)
    ba = summary[as_string.(summary.family) .== "power_law", :]
    sort!(ba, :m)
    beta_ci_path = joinpath(result_dir, "topology_beta_tipping_ci.csv")
    beta_ci = isfile(beta_ci_path) ? CSV.read(beta_ci_path, DataFrame) : DataFrame()

    grouped_runs = combine(groupby(runs, [:family, :beta, :m]), :avg_path_length => mean => :avg_path_length_mean)
    pooled = leftjoin(summary, grouped_runs; on=[:family, :beta, :m], matchmissing=:equal)
    pooled = pooled[.!ismissing.(pooled.avg_path_length_mean), :]

    fig = Figure(size=(1120, 380))
    ax1 = Axis(fig[1, 1], title="(a) Small-world: a sharp tipping point", xlabel="Rewiring β", ylabel="Cascade probability", xscale=log10)
    xs = Float64.(sw.beta)
    ys = Float64.(sw.cascade_prob)
    hspan!(ax1, 0.1, 0.9; color=(PUB_CRIMSON, 0.07))
    hlines!(ax1, [0.5]; color=(:black, 0.45), linestyle=:dot)
    lines!(ax1, xs, ys; color=PUB_NAVY, linewidth=2.4)
    scatter!(ax1, xs, ys; color=PUB_NAVY, markersize=10)
    add_y_ci!(ax1, xs, sw; whiskerwidth=6)
    beta_star = nrow(beta_ci) > 0 ? maybe_float(beta_ci.beta_star[1]) : interpolate_crossing(xs, ys, 0.5)
    if nrow(beta_ci) > 0 && beta_ci.ci_low[1] !== missing && beta_ci.ci_high[1] !== missing
        vspan!(ax1, beta_ci.ci_low[1], beta_ci.ci_high[1]; color=(PUB_CRIMSON, 0.12))
    end
    if beta_star !== missing
        vlines!(ax1, [beta_star]; color=PUB_CRIMSON, linestyle=:dash, linewidth=2)
        text!(ax1, beta_star * 1.08, 0.64; text=@sprintf("tipping point β* ≈ %.2f", beta_star), color=PUB_CRIMSON, fontsize=9, align=(:left, :center))
    end
    ylims!(ax1, 0, 1.05)

    ax2 = Axis(fig[1, 2], title="(b) Power-law: cascades at low m", xlabel="Attachment m", ylabel="Cascade probability")
    lines!(ax2, Float64.(ba.m), Float64.(ba.cascade_prob); color=PUB_ORANGE, linewidth=2.4)
    scatter!(ax2, Float64.(ba.m), Float64.(ba.cascade_prob); color=PUB_ORANGE, marker=:rect, markersize=11)
    add_y_ci!(ax2, Float64.(ba.m), ba; whiskerwidth=6)
    hlines!(ax2, [0.5]; color=(:black, 0.45), linestyle=:dot)
    ylims!(ax2, 0, 1.05)

    ax3 = Axis(fig[1, 3], title="(c) Cascades need short paths", xlabel="Average path length", ylabel="Cascade probability", xscale=log10)
    for (family, marker, color, label) in [
        ("small_world", :circle, PUB_NAVY, "small-world"),
        ("power_law", :rect, PUB_ORANGE, "power-law"),
        ("degree_matched_random", :utriangle, PUB_GREY, "degree-matched ER"),
    ]
        d = pooled[as_string.(pooled.family) .== family, :]
        nrow(d) == 0 && continue
        scatter!(ax3, Float64.(d.avg_path_length_mean), Float64.(d.cascade_prob); marker=marker, color=color, markersize=10, label=label)
        add_y_ci!(ax3, Float64.(d.avg_path_length_mean), d; whiskerwidth=5)
    end
    hlines!(ax3, [0.5]; color=(:black, 0.45), linestyle=:dot)
    ylims!(ax3, 0, 1.05)
    axislegend(ax3; position=:rt)
    add_note!(fig, string(rep_text(summary), ". ", cascade_definition_text(result_dir, "expB_topology_runs.csv"), " Error bars are Wilson 95% CIs. Shaded β band is the bootstrap CI."))

    save_publication_figure(fig, figdir, "fig2_topology")
end

function figure3_culture(result_dir::AbstractString, figdir::AbstractString)
    summary = read_result(result_dir, "expC_culture_vs_misfits_summary.csv")
    focal = summary[
        is_false_value.(summary.vary_network) .&
        approx_value.(summary.beta, 0.4),
        :
    ]

    labels = String[]
    probs = Float64[]
    colors = RGBf[]
    ordered_rows = DataFrame()
    specs = [
        ("homogeneous", missing, "homogeneous", PUB_GREY),
        ("lower_mean", missing, "lower mean", PUB_GREY),
        ("higher_variance", missing, "higher variance", PUB_GREEN),
        ("mixture", 0.01, "π=1%", PUB_NAVY),
        ("mixture", 0.03, "π=3%", PUB_NAVY),
        ("mixture", 0.05, "π=5%", PUB_NAVY),
        ("mixture", 0.10, "π=10%", PUB_NAVY),
    ]
    for (treatment, pi, label, color) in specs
        mask = as_string.(focal.threshold_treatment) .== treatment
        pi !== missing && (mask .&= approx_value.(focal.pi, pi))
        if any(mask)
            push!(labels, label)
            push!(probs, only(focal.cascade_prob[mask]))
            push!(colors, color)
            append!(ordered_rows, focal[mask, :])
        end
    end

    fig = Figure(size=(900, 420))
    ax = Axis(fig[1, 1], title="Same mean threshold θ̄=0.7 — lower-tail mass, not a modest mean shift, triggers cascades", xlabel="Threshold treatment", ylabel="Cascade probability", xticks=(1:length(labels), labels))
    barplot!(ax, 1:length(probs), probs; color=colors, width=0.68)
    add_y_ci!(ax, 1:length(probs), ordered_rows; whiskerwidth=8)
    add_bar_labels!(ax, 1:length(probs), probs)
    ylims!(ax, 0, 1.10)

    lower_idx = findfirst(==("lower mean"), labels)
    if lower_idx !== nothing
        text!(ax, lower_idx + 0.55, 0.34; text="lowering the mean\nbarely helps", color=PUB_CRIMSON, fontsize=9, align=(:left, :center))
        lines!(ax, [lower_idx + 0.45, lower_idx + 0.08], [0.30, probs[lower_idx] + 0.04]; color=PUB_CRIMSON, linewidth=1.2)
    end
    pi10_idx = findfirst(==("π=10%"), labels)
    if pi10_idx !== nothing
        text!(ax, pi10_idx - 1.25, 1.02; text="a few misfits\ntip the system", color=PUB_CRIMSON, fontsize=9, align=(:left, :top))
        lines!(ax, [pi10_idx - 0.35, pi10_idx - 0.04], [0.93, probs[pi10_idx] + 0.04]; color=PUB_CRIMSON, linewidth=1.2)
    end

    add_note!(fig, string(rep_text(ordered_rows), ". ", cascade_definition_text(result_dir, "expC_culture_vs_misfits_runs.csv"), " Error bars are Wilson 95% CIs."))
    save_publication_figure(fig, figdir, "fig3_culture_vs_misfits")
end

function selected_curve_label(treatment::String, pi)
    if treatment == "homogeneous"
        return "homogeneous"
    elseif treatment == "lower_mean"
        return "lower mean"
    elseif treatment == "higher_variance"
        return "higher variance"
    elseif treatment == "mixture"
        p = maybe_float(pi)
        if p !== missing && isapprox(p, 0.05; atol=1e-8)
            return "mixture π=5%"
        elseif p !== missing && isapprox(p, 0.10; atol=1e-8)
            return "mixture π=10%"
        end
    end
    return ""
end

function load_expC_curves_beta(result_dir::AbstractString; beta_target=0.4)
    path = joinpath(result_dir, "expC_culture_vs_misfits_curves.csv")
    isfile(path) || error("Missing result file: $path")
    labels = String[]
    ts = Int[]
    adoption = Float64[]
    for row in CSV.Rows(path; select=[:beta, :vary_network, :threshold_treatment, :pi, :t, :A], reusebuffer=true)
        approx_value(row.beta, beta_target) || continue
        is_false_value(row.vary_network) || continue
        label = selected_curve_label(as_string(row.threshold_treatment), row.pi)
        isempty(label) && continue
        push!(labels, label)
        push!(ts, parse(Int, string(row.t)))
        push!(adoption, parse(Float64, string(row.A)))
    end
    return DataFrame(label=labels, t=ts, A=adoption)
end

function figure4_trajectories(result_dir::AbstractString, figdir::AbstractString)
    curves = load_expC_curves_beta(result_dir; beta_target=0.4)
    summary = combine(
        groupby(curves, [:label, :t]),
        :A => median => :A_median,
        :A => (x -> quantile(x, 0.05)) => :A_p05,
        :A => (x -> quantile(x, 0.95)) => :A_p95,
    )
    order = ["homogeneous", "lower mean", "higher variance", "mixture π=5%", "mixture π=10%"]
    colors = Dict("homogeneous" => PUB_GREY, "lower mean" => RGBf(0.62, 0.66, 0.67), "higher variance" => PUB_GREEN, "mixture π=5%" => PUB_NAVY, "mixture π=10%" => RGBf(0.06, 0.20, 0.34))

    fig = Figure(size=(900, 500))
    ax = Axis(fig[1, 1], title="Adoption trajectories at β=0.4, θ̄=0.7 (median, 5–95% ribbon)", xlabel="Period", ylabel="Digital adoption")
    hlines!(ax, [0.5]; color=(:black, 0.45), linestyle=:dot, linewidth=1.4)
    for label in order
        d = summary[summary.label .== label, :]
        nrow(d) == 0 && continue
        sort!(d, :t)
        color = colors[label]
        band!(ax, d.t, d.A_p05, d.A_p95; color=(color, 0.16))
        lines!(ax, d.t, d.A_median; color=color, linewidth=2.4, label=label)
    end
    ylims!(ax, 0, 1.03)
    axislegend(ax; position=:rb)

    save_publication_figure(fig, figdir, "fig4_adoption_trajectories")
end

function figure5_heatmap(result_dir::AbstractString, figdir::AbstractString)
    summary = read_result(result_dir, "expC_culture_vs_misfits_summary.csv")
    d = summary[
        (as_string.(summary.threshold_treatment) .== "mixture") .&
        is_true_value.(summary.vary_network),
        :
    ]
    betas = sort(unique(Float64.(skipmissing(d.beta))))
    pis = sort(unique(Float64.(skipmissing(d.pi))))
    z = fill(NaN, length(betas), length(pis))
    zlo = fill(NaN, length(betas), length(pis))
    zhi = fill(NaN, length(betas), length(pis))
    for row in eachrow(d)
        beta = maybe_float(row.beta)
        pi = maybe_float(row.pi)
        beta === missing && continue
        pi === missing && continue
        ix = findfirst(x -> isapprox(x, beta; atol=1e-8), betas)
        iy = findfirst(y -> isapprox(y, pi; atol=1e-8), pis)
        if ix !== nothing && iy !== nothing
            z[ix, iy] = Float64(row.cascade_prob)
            zlo[ix, iy] = Float64(row.cascade_prob_ci_low)
            zhi[ix, iy] = Float64(row.cascade_prob_ci_high)
        end
    end

    fig = Figure(size=(760, 500))
    ax = Axis(fig[1, 1], title="Misfits ignite cascades only where the network supplies reach", xlabel="Small-world β", ylabel="Low-threshold pioneer share π", xticks=(betas, string.(betas)), yticks=(pis, [@sprintf("%.2f", p) for p in pis]))
    heatmap!(ax, betas, pis, z; colormap=:viridis, colorrange=(0, 1))
    contour!(ax, betas, pis, z; levels=[0.5], color=PUB_CRIMSON, linewidth=3.0)
    for (ix, beta) in enumerate(betas), (iy, pi) in enumerate(pis)
        val = z[ix, iy]
        isnan(val) && continue
        label = @sprintf("%.2f\n[%.2f,%.2f]", val, zlo[ix, iy], zhi[ix, iy])
        text!(ax, beta, pi; text=label, align=(:center, :center), fontsize=8.5, color=val > 0.58 ? :white : :black)
    end
    Colorbar(fig[1, 2], limits=(0, 1), colormap=:viridis, label="Dynamic cascade probability")
    add_note!(fig, string(rep_text(d), ". ", cascade_definition_text(result_dir, "expC_culture_vs_misfits_runs.csv"), " Cell text is probability [Wilson 95% CI]."))

    save_publication_figure(fig, figdir, "fig5_misfit_connectivity_heatmap")
end

function figure6_seedplacement(result_dir::AbstractString, figdir::AbstractString)
    summary = read_result(result_dir, "expD_seedplacement_summary.csv")
    placements = ["clustered", "random", "bridge", "high_degree"]
    labels = ["clustered", "random", "bridge", "high degree"]
    families = ["small_world", "power_law"]
    family_labels = Dict("small_world" => "small-world", "power_law" => "power-law")
    family_colors = Dict("small_world" => PUB_NAVY, "power_law" => PUB_ORANGE)
    offsets = Dict("small_world" => -0.18, "power_law" => 0.18)

    fig = Figure(size=(820, 420))
    ax = Axis(fig[1, 1], title="Where initial digital seeds sit changes the cascade", xlabel="Initial digital seed placement", ylabel="Cascade probability", xticks=(1:4, labels))
    for family in families
        vals = Float64[]
        ordered = DataFrame()
        for placement in placements
            mask = (as_string.(summary.family) .== family) .& (as_string.(summary.seed_strategy) .== placement)
            push!(vals, any(mask) ? only(summary.cascade_prob[mask]) : NaN)
            any(mask) && append!(ordered, summary[mask, :])
        end
        xs = collect(1:4) .+ offsets[family]
        barplot!(ax, xs, vals; width=0.32, color=family_colors[family], label=family_labels[family])
        nrow(ordered) == length(vals) && add_y_ci!(ax, xs, ordered; whiskerwidth=6)
        add_bar_labels!(ax, xs, vals; dy=0.02)
    end
    ylims!(ax, 0, 1.08)
    axislegend(ax; position=:lt)
    add_note!(fig, string(rep_text(summary), ". ", cascade_definition_text(result_dir, "expD_seedplacement_runs.csv"), " Error bars are Wilson 95% CIs. Low-threshold pioneers are random in this experiment."))

    save_publication_figure(fig, figdir, "fig6_seed_placement")
end

function figure_expE_seed_pioneer(result_dir::AbstractString, figdir::AbstractString)
    summary = read_result(result_dir, "expE_seed_x_pioneer_summary.csv")
    seed_levels = ["random", "hub_bridge"]
    pioneer_levels = ["random", "hub_bridge"]
    z = fill(NaN, 2, 2)
    zlo = fill(NaN, 2, 2)
    zhi = fill(NaN, 2, 2)
    for row in eachrow(summary)
        sx = findfirst(==(as_string(row.seed_strategy)), seed_levels)
        py = findfirst(==(as_string(row.pioneer_strategy)), pioneer_levels)
        if sx !== nothing && py !== nothing
            z[sx, py] = row.cascade_prob
            zlo[sx, py] = row.cascade_prob_ci_low
            zhi[sx, py] = row.cascade_prob_ci_high
        end
    end
    fig = Figure(size=(650, 520))
    ax = Axis(
        fig[1, 1],
        title="Low-threshold pioneers in bridge positions accelerate takeoff",
        xlabel="Initial digital seed placement",
        ylabel="Low-threshold pioneer placement",
        xticks=(1:2, ["random", "hub/bridge"]),
        yticks=(1:2, ["random", "hub/bridge"]),
    )
    heatmap!(ax, 1:2, 1:2, z; colormap=:viridis, colorrange=(0, 1))
    for i in 1:2, j in 1:2
        val = z[i, j]
        isnan(val) && continue
        text!(ax, i, j; text=@sprintf("%.2f\n[%.2f,%.2f]", val, zlo[i, j], zhi[i, j]), align=(:center, :center), fontsize=9, color=val > 0.58 ? :white : :black)
    end
    Colorbar(fig[1, 2], limits=(0, 1), colormap=:viridis, label="Dynamic cascade probability")
    add_note!(fig, string(rep_text(summary), ". ", cascade_definition_text(result_dir, "expE_seed_x_pioneer_runs.csv"), " Cell text is probability [Wilson 95% CI]."))
    save_publication_figure(fig, figdir, "expE_seed_x_pioneer")
end

function equal_effort_group(row)
    metric = as_string(row.effort_metric)
    budget = maybe_float(row.effort_budget)
    if metric == "l1"
        return @sprintf("L1 = %.2f", budget)
    elseif metric == "mass_below_crit"
        return @sprintf("Mass < θcrit = %.2f", budget)
    end
    return string(metric, " ", budget)
end

function figure_equal_effort(result_dir::AbstractString, figdir::AbstractString)
    summary = read_result(result_dir, "expC_equal_effort_summary.csv")
    groups = ["L1 = 0.02", "L1 = 0.05", "Mass < θcrit = 0.03", "Mass < θcrit = 0.05"]
    treatments = ["lower_mean", "higher_variance", "mixture"]
    treatment_labels = Dict("lower_mean" => "lower mean", "higher_variance" => "higher variance", "mixture" => "mixture")
    treatment_colors = Dict("lower_mean" => PUB_GREY, "higher_variance" => PUB_GREEN, "mixture" => PUB_NAVY)
    offsets = Dict("lower_mean" => -0.25, "higher_variance" => 0.0, "mixture" => 0.25)

    fig = Figure(size=(980, 480))
    ax = Axis(
        fig[1, 1],
        title="Equal effort: lower-tail mass helps, but the ordering depends on the budget",
        xlabel="Matched effort budget",
        ylabel="Dynamic cascade probability",
        xticks=(1:length(groups), groups),
    )
    for treatment in treatments
        vals = Float64[]
        ordered = DataFrame()
        for group in groups
            mask = [equal_effort_group(row) == group && as_string(row.threshold_treatment) == treatment for row in eachrow(summary)]
            if any(mask)
                push!(vals, only(summary.cascade_prob[mask]))
                append!(ordered, summary[mask, :])
            else
                push!(vals, NaN)
            end
        end
        xs = collect(1:length(groups)) .+ offsets[treatment]
        barplot!(ax, xs, vals; width=0.22, color=treatment_colors[treatment], label=treatment_labels[treatment])
        nrow(ordered) == length(vals) && add_y_ci!(ax, xs, ordered; whiskerwidth=6)
        add_bar_labels!(ax, xs, vals; dy=0.018)
    end
    ylims!(ax, 0, 1.10)
    axislegend(ax; position=:lt)
    add_note!(fig, string(rep_text(summary), ". ", cascade_definition_text(result_dir, "expC_equal_effort_runs.csv"), " Error bars are Wilson 95% CIs."))
    save_publication_figure(fig, figdir, "expC_equal_effort")
end

function robustness_label(row)
    axis = as_string(row.robustness_axis)
    if axis == "premium_sigma"
        return @sprintf("%.1fx, σD=%.2f", row.premium_ratio, row.digital_growth_sd)
    elseif axis == "theta_mean"
        return @sprintf("θ̄=%.2f", row.theta_sweep)
    elseif axis == "seed_fraction"
        return @sprintf("seed %.3f", row.seed_fraction_sweep)
    elseif axis == "update_schedule"
        return as_string(row.update_schedule)
    elseif axis == "return_distribution"
        return replace(as_string(row.return_distribution_sweep), "_" => " ")
    elseif axis == "performance_benchmark"
        return replace(as_string(row.performance_benchmark_sweep), "_" => " ")
    elseif axis == "abandonment"
        return as_string(row.abandonment_sweep)
    end
    return axis
end

function robustness_axis_title(axis::String)
    axis == "premium_sigma" && return "Digital premium and return SD"
    axis == "theta_mean" && return "Threshold mean"
    axis == "seed_fraction" && return "Initial digital seed fraction"
    axis == "update_schedule" && return "Update schedule"
    axis == "return_distribution" && return "Return distribution"
    axis == "performance_benchmark" && return "Performance benchmark"
    axis == "abandonment" && return "Abandonment"
    return replace(axis, "_" => " ")
end

function figure_robustness(result_dir::AbstractString, figdir::AbstractString)
    summary = read_result(result_dir, "robustness_summary.csv")
    axes_order = ["premium_sigma", "return_distribution", "performance_benchmark", "update_schedule", "seed_fraction", "theta_mean", "abandonment"]
    fig = Figure(size=(1180, 980))
    for (idx, axis_name) in enumerate(axes_order)
        d = summary[as_string.(summary.robustness_axis) .== axis_name, :]
        nrow(d) == 0 && continue
        sort!(d, [:premium_ratio, :digital_growth_sd, :theta_sweep, :seed_fraction_sweep, :update_schedule, :return_distribution_sweep, :performance_benchmark_sweep, :abandonment_sweep])
        row = div(idx - 1, 2) + 1
        col = mod(idx - 1, 2) + 1
        ax = Axis(fig[row, col], title=robustness_axis_title(axis_name), ylabel="Dynamic cascade probability")
        xs = 1:nrow(d)
        labels = [robustness_label(r) for r in eachrow(d)]
        barplot!(ax, xs, d.cascade_prob; color=axis_name == "premium_sigma" ? PUB_NAVY : PUB_GREY, width=0.68)
        add_y_ci!(ax, xs, d; whiskerwidth=5)
        add_bar_labels!(ax, xs, Float64.(d.cascade_prob); dy=0.016)
        ax.xticks = (xs, labels)
        ax.xticklabelrotation = pi / 5
        ylims!(ax, 0, 1.08)
    end
    add_note!(fig, string(rep_text(summary), ". ", cascade_definition_text(result_dir, "robustness_runs.csv"), " Error bars are Wilson 95% CIs."))
    save_publication_figure(fig, figdir, "robustness_summary")
end

function interpolate_path_at_beta(sw_paths::DataFrame, beta)
    beta === missing && return missing
    sort!(sw_paths, :beta)
    xs = Float64.(sw_paths.beta)
    ys = Float64.(sw_paths.avg_path_length_mean)
    for i in 1:(length(xs) - 1)
        if (xs[i] - beta) * (xs[i + 1] - beta) <= 0 && xs[i] != xs[i + 1]
            frac = (log10(beta) - log10(xs[i])) / (log10(xs[i + 1]) - log10(xs[i]))
            return ys[i] + frac * (ys[i + 1] - ys[i])
        end
    end
    return missing
end

function figure_topology_partial_effect(result_dir::AbstractString, figdir::AbstractString)
    partial = read_result(result_dir, "topology_partial_effect_avg_path.csv")
    runs = read_result(result_dir, "expB_topology_runs.csv")
    beta_ci_path = joinpath(result_dir, "topology_beta_tipping_ci.csv")
    beta_ci = isfile(beta_ci_path) ? CSV.read(beta_ci_path, DataFrame) : DataFrame()
    sw_paths = combine(groupby(runs[as_string.(runs.family) .== "small_world", :], :beta), :avg_path_length => mean => :avg_path_length_mean)

    fig = Figure(size=(760, 460))
    ax = Axis(fig[1, 1], title="Average path length predicts cascades after degree control", xlabel="Average path length", ylabel="Predicted dynamic cascade probability")
    lines!(ax, partial.avg_path_length, partial.cascade_probability; color=PUB_NAVY, linewidth=2.7)
    hlines!(ax, [0.5]; color=(:black, 0.45), linestyle=:dot)
    if nrow(beta_ci) > 0
        p_lo = interpolate_path_at_beta(sw_paths, beta_ci.ci_low[1])
        p_hi = interpolate_path_at_beta(sw_paths, beta_ci.ci_high[1])
        p_star = interpolate_path_at_beta(sw_paths, beta_ci.beta_star[1])
        if p_lo !== missing && p_hi !== missing
            vspan!(ax, min(p_lo, p_hi), max(p_lo, p_hi); color=(PUB_CRIMSON, 0.10))
        end
        if p_star !== missing
            vlines!(ax, [p_star]; color=PUB_CRIMSON, linestyle=:dash, linewidth=2)
            text!(ax, p_star, 0.82; text="β* path-length region", color=PUB_CRIMSON, fontsize=9, align=(:left, :center))
        end
    end
    ylims!(ax, 0, 1)
    add_note!(fig, "Logistic regression partial effect; shaded region maps the full-mode β* bootstrap CI into average path length.")
    save_publication_figure(fig, figdir, "topology_partial_effect_avg_path")
end

function write_figure_manifest(result_dir::AbstractString, figdir::AbstractString)
    entries = [
        ("fig1_mechanism", "Figure 1", "expA_nullmodels_runs.csv; expA_nullmodels_summary.csv", "Success-based imitation produces dynamic cascades; hazard accumulation does not."),
        ("fig2_topology", "Figure 2", "expB_topology_runs.csv; expB_topology_summary.csv; topology_beta_tipping_ci.csv", "Degree-controlled topology shows a small-world tipping point and path-length control."),
        ("fig3_culture_vs_misfits", "Figure 3", "expC_culture_vs_misfits_summary.csv", "At fixed mean threshold, lower-tail treatments outperform a modest mean shift."),
        ("fig4_adoption_trajectories", "Figure 4", "expC_culture_vs_misfits_curves.csv; expC_culture_vs_misfits_summary.csv", "Median adoption trajectories with 5-95% ribbons in the focal topology."),
        ("fig5_misfit_connectivity_heatmap", "Figure 5", "expC_culture_vs_misfits_summary.csv", "Low-threshold pioneers ignite cascades only with sufficient network reach."),
        ("fig6_seed_placement", "Figure 6", "expD_seedplacement_summary.csv", "Initial digital seed placement changes cascade probability and speed."),
        ("expE_seed_x_pioneer", "Appendix: seed x pioneer", "expE_seed_x_pioneer_summary.csv", "Initial seed placement and low-threshold pioneer placement are distinct levers."),
        ("expC_equal_effort", "Appendix: equal effort", "expC_equal_effort_summary.csv", "Equal-effort threshold shifts show metric-dependent ordering."),
        ("robustness_summary", "Appendix: robustness", "robustness_summary.csv", "Robustness sweeps define the parameter region where cascades persist."),
        ("topology_partial_effect_avg_path", "Appendix: topology regression", "topology_partial_effect_avg_path.csv; topology_regression_coefficients.csv", "Average path length partial effect from the topology regression."),
    ]
    open(joinpath(figdir, "FIGURE_MANIFEST.md"), "w") do io
        println(io, "# Figure Manifest\n")
        println(io, "| File | Manuscript mapping | Source CSV(s) | R | Caption |")
        println(io, "|---|---|---|---|---|")
        for (base, mapping, sources, caption) in entries
            source_files = strip.(split(sources, ";"))
            summary_source = findfirst(s -> occursin("_summary", s) || s == "calibration_summary.csv", source_files)
            summary_path = summary_source === nothing ? "" : joinpath(result_dir, source_files[summary_source])
            r = !isempty(summary_path) && isfile(summary_path) ? rep_text(CSV.read(summary_path, DataFrame)) : "see source CSV"
            println(io, "| `$(base).png` / `$(base).pdf` | $(mapping) | $(sources) | $(r) | $(caption) |")
        end
    end
    return nothing
end

function make_publication_figures(; result_dir::AbstractString="results", figdir::AbstractString="figures")
    set_publication_theme!()
    figure1_mechanism(result_dir, figdir)
    figure2_topology(result_dir, figdir)
    figure3_culture(result_dir, figdir)
    figure4_trajectories(result_dir, figdir)
    figure5_heatmap(result_dir, figdir)
    figure6_seedplacement(result_dir, figdir)
    figure_expE_seed_pioneer(result_dir, figdir)
    figure_equal_effort(result_dir, figdir)
    figure_robustness(result_dir, figdir)
    figure_topology_partial_effect(result_dir, figdir)
    write_figure_manifest(result_dir, figdir)
    return nothing
end
