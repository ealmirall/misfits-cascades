# Revision Simulation Report

Generated: 2026-06-04T19:13:57.617

All new robustness outputs were written under `outputs/`; existing production CSVs under `results/` were read by Experiment H but not overwritten.

## Output inventory

- `audit_model_implementation.md` — present
- `experiment_G_success_rule_robustness/raw_runs.csv` — present
- `experiment_G_success_rule_robustness/summary.csv` — present
- `experiment_G_success_rule_robustness/figure_success_rule_robustness.png` — present
- `experiment_H_cascade_metric_sensitivity/metric_grid_summary.csv` — present
- `experiment_H_cascade_metric_sensitivity/figure_metric_sensitivity_heatmap.png` — present
- `experiment_I_replacement_dynamics/raw_runs.csv` — present
- `experiment_I_replacement_dynamics/summary.csv` — present
- `experiment_I_replacement_dynamics/figure_replacement_dynamics_ablation.png` — present
- `experiment_J_parameter_space_maps/raw_runs.csv` — present
- `experiment_J_parameter_space_maps/summary.csv` — present
- `experiment_J_parameter_space_maps/figure_theta_seed_map.png` — present
- `experiment_J_parameter_space_maps/figure_premium_variance_map.png` — present
- `experiment_J_parameter_space_maps/figure_beta_pi_map.png` — present

## Experiment G — success-rule robustness

Replications: 250 per cell.

| Setting | Variant | Cascade probability | Median final adoption |
|---|---:|---:|---:|
| Exp A focal | hazard | 0.000 | 0.499 |
| Exp A focal | frequency_based | 0.000 | 0.013 |
| Exp A focal | success_original | 0.988 | 0.901 |
| Exp A focal | success_min2 | 0.000 | 0.009 |
| Exp A focal | success_min3 | 0.000 | 0.009 |
| Exp A focal | success_all_neighbors | 0.000 | 0.013 |
| Exp A focal | count_1 | 1.000 | 0.978 |
| Exp A focal | count_2 | 0.000 | 0.010 |
| Transition beta=0.4 | hazard | 0.000 | 0.500 |
| Transition beta=0.4 | frequency_based | 0.000 | 0.006 |
| Transition beta=0.4 | success_original | 0.464 | 0.865 |
| Transition beta=0.4 | success_min2 | 0.000 | 0.005 |
| Transition beta=0.4 | success_min3 | 0.000 | 0.005 |
| Transition beta=0.4 | success_all_neighbors | 0.000 | 0.006 |
| Transition beta=0.4 | count_1 | 1.000 | 0.978 |
| Transition beta=0.4 | count_2 | 0.000 | 0.005 |

Key read: the original success-conditioned rule is strong (`Exp A` 0.988) while hazard/frequency are zero, but the stricter `min2`, `min3`, and all-neighbour-denominator variants collapse to zero in these cells.

## Experiment H — cascade metric sensitivity

No simulations rerun; existing full `results/*_runs.csv` files were reclassified over final-adoption, transition-window, and slope thresholds.

- A at final cutoff 0.5, W=45, s_min=0.02: hazard 0.000, frequency 0.000, success 0.989.
- A at final cutoff 0.7, W=45, s_min=0.02: hazard 0.000, frequency 0.000, success 0.987.

## Experiment I — replacement dynamics

Replications: 250 per cell.

- Exp A success-based: traditional-only 1.000 vs Bernoulli p_digital 0.992.
- Exp A hazard: traditional-only 0.000 vs Bernoulli p_digital 0.000.
- Transition mixture pi=5%: traditional-only 0.556 vs Bernoulli p_digital 0.576.
- Random seed/random pioneer placement: traditional-only 0.444 vs Bernoulli p_digital 0.524.
- Hub/bridge seed and pioneer placement: traditional-only 1.000 vs Bernoulli p_digital 1.000.

## Experiment J — parameter-space maps

Replications: 100 per cell. These maps use the calibrated production replacement-entry rule, `bernoulli_seed_probability`; Experiment I gives the manuscript-rule ablation.

- Beta/pi map at beta=0.4, pi=0.05: 0.490.
- Beta/pi map at beta=0.7, pi=0.05: 0.830.
- Beta/pi map at beta=1.0, pi=0.05: 0.910.
- Theta/seed map, beta=0.4, theta=0.70: seed 0.003 0.150, seed 0.005 0.430, seed 0.010 0.930.
- Theta/seed map, beta=1.0, theta=0.70: seed 0.003 0.450, seed 0.005 0.730, seed 0.010 0.990.
- Premium/variance map, original success rule: premium=10 sigma=1.0 0.510; premium=10 sigma=0.25 0.930.
- Premium/variance map, stricter min2 success rule: premium=10 sigma=1.0 0.000.
