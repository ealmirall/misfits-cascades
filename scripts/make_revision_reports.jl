using CSV
using DataFrames
using Dates
using Printf

const ROOT = dirname(dirname(@__FILE__))
const OUTPUTS = joinpath(ROOT, "outputs")

function read_out(parts...)
    CSV.read(joinpath(OUTPUTS, parts...), DataFrame)
end

function strcol(df::DataFrame, col::Symbol)
    string.(df[!, col])
end

function row_match(df::DataFrame, filters::Pair...)
    mask = trues(nrow(df))
    for (col, val) in filters
        mask .&= strcol(df, col) .== string(val)
    end
    return df[mask, :]
end

function val(df::DataFrame, filters::Pair...; col::Symbol=:cascade_prob)
    rows = row_match(df, filters...)
    nrow(rows) == 0 && return missing
    return rows[1, col]
end

fmt(x) = x === missing ? "missing" : @sprintf("%.3f", Float64(x))

function report_inventory(io)
    println(io, "## Output inventory\n")
    for rel in [
        "audit_model_implementation.md",
        "experiment_G_success_rule_robustness/raw_runs.csv",
        "experiment_G_success_rule_robustness/summary.csv",
        "experiment_G_success_rule_robustness/figure_success_rule_robustness.png",
        "experiment_H_cascade_metric_sensitivity/metric_grid_summary.csv",
        "experiment_H_cascade_metric_sensitivity/figure_metric_sensitivity_heatmap.png",
        "experiment_I_replacement_dynamics/raw_runs.csv",
        "experiment_I_replacement_dynamics/summary.csv",
        "experiment_I_replacement_dynamics/figure_replacement_dynamics_ablation.png",
        "experiment_J_parameter_space_maps/raw_runs.csv",
        "experiment_J_parameter_space_maps/summary.csv",
        "experiment_J_parameter_space_maps/figure_theta_seed_map.png",
        "experiment_J_parameter_space_maps/figure_premium_variance_map.png",
        "experiment_J_parameter_space_maps/figure_beta_pi_map.png",
    ]
        path = joinpath(OUTPUTS, rel)
        status = isfile(path) ? "present" : "missing"
        println(io, "- `$rel` — $status")
    end
    println(io)
end

function make_simulation_report()
    G = read_out("experiment_G_success_rule_robustness", "summary.csv")
    H = read_out("experiment_H_cascade_metric_sensitivity", "metric_grid_summary.csv")
    I = read_out("experiment_I_replacement_dynamics", "summary.csv")
    J = read_out("experiment_J_parameter_space_maps", "summary.csv")

    open(joinpath(OUTPUTS, "revision_simulation_report.md"), "w") do io
        println(io, "# Revision Simulation Report\n")
        println(io, "Generated: $(now())\n")
        println(io, "All new robustness outputs were written under `outputs/`; existing production CSVs under `results/` were read by Experiment H but not overwritten.\n")
        report_inventory(io)

        println(io, "## Experiment G — success-rule robustness\n")
        println(io, "Replications: $(G.n_runs[1]) per cell.\n")
        println(io, "| Setting | Variant | Cascade probability | Median final adoption |")
        println(io, "|---|---:|---:|---:|")
        for row in eachrow(G)
            if row.variant in ("hazard", "frequency_based", "success_original", "success_min2", "success_min3", "success_all_neighbors", "count_1", "count_2")
                println(io, "| $(row.setting_label) | $(row.variant) | $(fmt(row.cascade_prob)) | $(fmt(row.final_adoption_median)) |")
            end
        end
        println(io, "\nKey read: the original success-conditioned rule is strong (`Exp A` $(fmt(val(G, :setting => :experiment_A, :variant => :success_original)))) while hazard/frequency are zero, but the stricter `min2`, `min3`, and all-neighbour-denominator variants collapse to zero in these cells.\n")

        println(io, "## Experiment H — cascade metric sensitivity\n")
        println(io, "No simulations rerun; existing full `results/*_runs.csv` files were reclassified over final-adoption, transition-window, and slope thresholds.\n")
        for cutoff in (0.5, 0.7)
            h_hazard = val(H, :comparison => "A hazard", :final_cutoff => cutoff, :transition_window => 45, :slope_min => 0.02)
            h_simple = val(H, :comparison => "A frequency-based", :final_cutoff => cutoff, :transition_window => 45, :slope_min => 0.02)
            h_success = val(H, :comparison => "A success-based", :final_cutoff => cutoff, :transition_window => 45, :slope_min => 0.02)
            println(io, "- A at final cutoff $(cutoff), W=45, s_min=0.02: hazard $(fmt(h_hazard)), frequency $(fmt(h_simple)), success $(fmt(h_success)).")
        end
        println(io)

        println(io, "## Experiment I — replacement dynamics\n")
        println(io, "Replications: $(I.n_runs[1]) per cell.\n")
        println(io, "- Exp A success-based: traditional-only $(fmt(val(I, :setting => :experiment_A, :variant => :success_original, :replacement_digital_rule => :traditional_only))) vs Bernoulli p_digital $(fmt(val(I, :setting => :experiment_A, :variant => :success_original, :replacement_digital_rule => :bernoulli_seed_probability))).")
        println(io, "- Exp A hazard: traditional-only $(fmt(val(I, :setting => :experiment_A, :variant => :hazard, :replacement_digital_rule => :traditional_only))) vs Bernoulli p_digital $(fmt(val(I, :setting => :experiment_A, :variant => :hazard, :replacement_digital_rule => :bernoulli_seed_probability))).")
        println(io, "- Transition mixture pi=5%: traditional-only $(fmt(val(I, :setting => :transition_beta04, :variant => :mixture_pi05, :replacement_digital_rule => :traditional_only))) vs Bernoulli p_digital $(fmt(val(I, :setting => :transition_beta04, :variant => :mixture_pi05, :replacement_digital_rule => :bernoulli_seed_probability))).")
        println(io, "- Random seed/random pioneer placement: traditional-only $(fmt(val(I, :setting => :seed_pioneer_placement, :variant => :seed_random_pioneer_random, :replacement_digital_rule => :traditional_only))) vs Bernoulli p_digital $(fmt(val(I, :setting => :seed_pioneer_placement, :variant => :seed_random_pioneer_random, :replacement_digital_rule => :bernoulli_seed_probability))).")
        println(io, "- Hub/bridge seed and pioneer placement: traditional-only $(fmt(val(I, :setting => :seed_pioneer_placement, :variant => :seed_hub_bridge_pioneer_hub_bridge, :replacement_digital_rule => :traditional_only))) vs Bernoulli p_digital $(fmt(val(I, :setting => :seed_pioneer_placement, :variant => :seed_hub_bridge_pioneer_hub_bridge, :replacement_digital_rule => :bernoulli_seed_probability))).\n")

        println(io, "## Experiment J — parameter-space maps\n")
        println(io, "Replications: $(J.n_runs[1]) per cell. These maps use the calibrated production replacement-entry rule, `bernoulli_seed_probability`; Experiment I gives the manuscript-rule ablation.\n")
        println(io, "- Beta/pi map at beta=0.4, pi=0.05: $(fmt(val(J, :map_type => :beta_pi, :beta => 0.4, :pi => 0.05))).")
        println(io, "- Beta/pi map at beta=0.7, pi=0.05: $(fmt(val(J, :map_type => :beta_pi, :beta => 0.7, :pi => 0.05))).")
        println(io, "- Beta/pi map at beta=1.0, pi=0.05: $(fmt(val(J, :map_type => :beta_pi, :beta => 1.0, :pi => 0.05))).")
        println(io, "- Theta/seed map, beta=0.4, theta=0.70: seed 0.003 $(fmt(val(J, :map_type => :theta_seed, :beta => 0.4, :theta_sweep => 0.70, :seed_fraction_sweep => 0.003))), seed 0.005 $(fmt(val(J, :map_type => :theta_seed, :beta => 0.4, :theta_sweep => 0.70, :seed_fraction_sweep => 0.005))), seed 0.010 $(fmt(val(J, :map_type => :theta_seed, :beta => 0.4, :theta_sweep => 0.70, :seed_fraction_sweep => 0.01))).")
        println(io, "- Theta/seed map, beta=1.0, theta=0.70: seed 0.003 $(fmt(val(J, :map_type => :theta_seed, :beta => 1.0, :theta_sweep => 0.70, :seed_fraction_sweep => 0.003))), seed 0.005 $(fmt(val(J, :map_type => :theta_seed, :beta => 1.0, :theta_sweep => 0.70, :seed_fraction_sweep => 0.005))), seed 0.010 $(fmt(val(J, :map_type => :theta_seed, :beta => 1.0, :theta_sweep => 0.70, :seed_fraction_sweep => 0.01))).")
        println(io, "- Premium/variance map, original success rule: premium=10 sigma=1.0 $(fmt(val(J, :map_type => :premium_variance, :variant => :success_original, :premium_ratio => 10, :digital_growth_sd => 1.0))); premium=10 sigma=0.25 $(fmt(val(J, :map_type => :premium_variance, :variant => :success_original, :premium_ratio => 10, :digital_growth_sd => 0.25))).")
        println(io, "- Premium/variance map, stricter min2 success rule: premium=10 sigma=1.0 $(fmt(val(J, :map_type => :premium_variance, :variant => :success_min2, :premium_ratio => 10, :digital_growth_sd => 1.0))).")
    end
end

function make_claim_audit()
    G = read_out("experiment_G_success_rule_robustness", "summary.csv")
    I = read_out("experiment_I_replacement_dynamics", "summary.csv")
    J = read_out("experiment_J_parameter_space_maps", "summary.csv")

    open(joinpath(OUTPUTS, "revision_claim_audit.md"), "w") do io
        println(io, "# Revision Claim Audit\n")
        println(io, "Generated: $(now())\n")

        println(io, "## Claims that are still supported\n")
        println(io, "- **Mechanism specificity under the original rule.** In Experiment G, the Exp A focal cell has cascade probability $(fmt(val(G, :setting => :experiment_A, :variant => :success_original))) for original success-conditioned imitation, versus $(fmt(val(G, :setting => :experiment_A, :variant => :hazard))) for hazard and $(fmt(val(G, :setting => :experiment_A, :variant => :frequency_based))) for frequency-based imitation.")
        println(io, "- **Replacement-entry assumption is not driving the main success result.** Experiment I gives Exp A success-based cascade probabilities $(fmt(val(I, :setting => :experiment_A, :variant => :success_original, :replacement_digital_rule => :traditional_only))) under traditional-only entrants and $(fmt(val(I, :setting => :experiment_A, :variant => :success_original, :replacement_digital_rule => :bernoulli_seed_probability))) under Bernoulli entrants.")
        println(io, "- **Connectivity and misfit share jointly create a frontier.** In Experiment J, beta/pi probabilities rise from beta=0.2, pi=0.05 at $(fmt(val(J, :map_type => :beta_pi, :beta => 0.2, :pi => 0.05))) to beta=0.4, pi=0.05 at $(fmt(val(J, :map_type => :beta_pi, :beta => 0.4, :pi => 0.05))) and beta=0.7, pi=0.05 at $(fmt(val(J, :map_type => :beta_pi, :beta => 0.7, :pi => 0.05))).")
        println(io, "- **Seed and pioneer placement remain policy-relevant.** Experiment I shows random/random placement at $(fmt(val(I, :setting => :seed_pioneer_placement, :variant => :seed_random_pioneer_random, :replacement_digital_rule => :traditional_only))) under traditional-only entrants, while hub/bridge seed and pioneer placement reaches $(fmt(val(I, :setting => :seed_pioneer_placement, :variant => :seed_hub_bridge_pioneer_hub_bridge, :replacement_digital_rule => :traditional_only))).\n")

        println(io, "## Claims that should be narrowed or softened\n")
        println(io, "- **Do not claim robustness to all complex-contagion specifications.** Experiment G shows `success_min2`, `success_min3`, and all-neighbour-denominator variants at zero in both the Exp A focal and beta=0.4 transition settings. The safer wording is `success-conditioned threshold imitation using the better-neighbour denominator`, with the stricter variants reported as a limitation.")
        println(io, "- **Do not describe the effect as misfits alone.** Experiment J shows beta=0.05 and beta=0.10 have zero cascades at every pi in the tested grid, while beta=0.4/0.7/1.0 cross the frontier as pi rises.")
        println(io, "- **Do not claim high variance promotes cascades.** In the premium/variance map, original success imitation at premium=10 has probability $(fmt(val(J, :map_type => :premium_variance, :variant => :success_original, :premium_ratio => 10, :digital_growth_sd => 1.0))) under baseline high variance and $(fmt(val(J, :map_type => :premium_variance, :variant => :success_original, :premium_ratio => 10, :digital_growth_sd => 0.25))) under lower variance. High variance should be framed as noisy inference, not as a cascade amplifier.")
        println(io, "- **Label production replacement-entry behavior.** Existing A-F production results used `bernoulli_seed_probability`. The code now exposes `traditional_only`; Experiment I suggests the main conclusion survives, but tables/notes should identify which rule each result uses.")
        println(io, "- **Avoid overusing beta=0.2 as the headline transition setting.** The beta/pi map gives beta=0.2, pi=0.05 at $(fmt(val(J, :map_type => :beta_pi, :beta => 0.2, :pi => 0.05))) and pi=0.10 at $(fmt(val(J, :map_type => :beta_pi, :beta => 0.2, :pi => 0.10))). The cleaner frontier is around beta=0.4 to 0.7 in the calibrated regime.\n")

        println(io, "## Recommended manuscript phrasing\n")
        println(io, "Use: `A small low-threshold minority can trigger fast adoption cascades when firms use success-conditioned threshold imitation and the network supplies enough reach. The cascade is not reproduced by hazard or frequency-only adoption, survives the replacement-entry ablation, and is strongest when receptive firms or initial digital seeds occupy hub/bridge positions.`\n")
        println(io, "Avoid: `The result is robust to stricter complex-contagion rules` or `high variance causes cascades`.")
    end
end

make_simulation_report()
make_claim_audit()
