# Revision Notes

Generated from the quick reproducibility run on 2026-06-04 with:

```bash
julia --project scripts/run_all_quick.jl --seed 20260603
julia --project -e 'using Pkg; Pkg.test()'
```

The committed CSVs are quick-mode reviewer smoke-test outputs (`N=500`, adaptive quick replication). Full-mode scripts keep the adaptive design (`n_coarse=50`, `n_refine=250`, `n_focal=1000`) for paper-scale reruns.

## 1. Dynamic Cascade Metric

Implemented in `src/metrics.jl` and logged per run in every `results/*_runs.csv`.

The reported `cascade` flag now requires all three conditions:

- `final_adoption >= 0.5`
- `transition_time = t50 - t10 <= 45`
- `max_slope >= 0.02`

Legacy final-threshold flags are retained as `cascade_threshold50` and `cascade_threshold70`; the stricter dynamic variant is `cascade_dynamic70`.

Experiment A after rerun (`results/expA_nullmodels_summary.csv`):

| rule | dynamic cascade prob | legacy final>=0.5 prob | median final adoption | median transition | median max slope |
|---|---:|---:|---:|---:|---:|
| hazard | 0.00 | 0.65 | 0.505 | 81.0 | 0.018 |
| frequency-based (`:simple`) | 0.00 | 0.00 | 0.012 | missing | 0.002 |
| success-based (`:complex`) | 1.00 | 1.00 | 0.900 | 19.0 | 0.037 |

This fixes the original bug: the hazard process can accumulate to 50% adoption, but it is not classified as a cascade because it lacks rapid takeoff.

## 2. Degree-Controlled Topology

Implemented in `src/networks.jl`.

- Small-world now uses degree-conserving Watts-Strogatz rewiring (`network_generator=watts_strogatz_rewire`), so realised mean degree stays at 4.0 in the quick sweep.
- BA is explicitly labelled `barabasi_albert_degree_varies`.
- A `degree_matched_random` control family is included in Experiment B.
- Every run records realised mean degree, degree variance, clustering, average path length, giant-component fraction, and generator label.

Experiment B quick outputs show the degree fix clearly: small-world realised mean degree is 4.0 for beta 0.01, 0.1, 0.4, and 1.0. The small-world dynamic cascade probability rises from 0.00 at beta 0.01/0.1 to 0.60 at beta 0.4 and 0.65 at beta 1.0.

`scripts/analysis_topology_regression.jl` writes:

- `results/topology_regression_coefficients.csv`
- `results/topology_partial_effect_avg_path.csv`
- `figures/topology_partial_effect_avg_path.png/pdf`
- `results/topology_beta_tipping_ci.csv`

Quick regression result: the average-path coefficient is negative (`estimate=-5.19`, odds ratio `0.0056`), supporting the revised topology claim that shorter path length is the controlling variable conditional on degree and other structural covariates. The bootstrapped small-world tipping estimate is `beta*=0.317` with CI `[0.263, 0.456]`.

## 3. Seeds vs Low-Threshold Pioneers

Implemented across `src/experiments.jl`, `src/thresholds.jl`, `src/seeding.jl`, Experiment D, and new Experiment E.

- `seed_*` columns mean firms that are digital at `t=0`.
- `pioneer_*` columns mean low-threshold receptive firms; these are not necessarily digital at `t=0`.

Experiment D now reports initial digital seed placement. Quick result:

| family | clustered | random | bridge | high-degree |
|---|---:|---:|---:|---:|
| small-world | 0.30 | 0.40 | 0.87 | 0.85 |
| power-law | 0.73 | 0.30 | 1.00 | 1.00 |

Experiment E (`results/expE_seed_x_pioneer_summary.csv`) crosses seed and pioneer placement on matched counts:

| seed placement | pioneer placement | dynamic cascade prob | median t50 |
|---|---|---:|---:|
| random | random | 0.57 | 50.0 |
| random | hub/bridge | 1.00 | 27.5 |
| hub/bridge | random | 0.85 | 38.0 |
| hub/bridge | hub/bridge | 1.00 | 22.0 |

Interpretation: both initial exemplar placement and receptive-pioneer placement matter; putting receptive pioneers in hub/bridge positions is especially powerful.

## 4. Equal-Effort Culture vs Misfits

Implemented in `scripts/run_expC_equal_effort.jl`.

The equal-effort output includes both L1-distance budgets and expected mass-below-critical-threshold budgets.

Quick L1 results:

- Budget 0.02: lower mean `0.33`, higher variance `0.50`, mixture `0.57`.
- Budget 0.05: lower mean `0.99`, higher variance `0.59`, mixture `0.70`.

Quick mass-below-critical results:

- Budget 0.03: lower mean `1.00`, higher variance `1.00`, mixture `0.57`.
- Budget 0.05: lower mean `1.00`, higher variance `1.00`, mixture `0.83`.

Safe wording for the manuscript: at a fixed mean, increasing lower-tail mass is more effective than homogeneous thresholds, and a small low-threshold minority can trigger cascades in the right network/placement regime. Under equal-effort definitions, the mixture advantage is not universal; it depends on the effort metric.

## 5. Robustness

Implemented in `scripts/run_robustness.jl` and logged in `results/robustness_summary.csv`.

Sweeps now cover:

- digital premium ratios 2x, 5x, 10x in quick mode (full mode includes 1.5x and 3x)
- digital return SD
- return distribution: normal, truncated normal, lognormal
- performance benchmark: own valuation, neighbour mean, neighbour median, 75th percentile
- synchronous vs asynchronous updates
- seed fraction around the focal value
- threshold mean around baseline
- optional non-absorbing adoption

Quick robustness highlights:

- No dynamic cascades at 2x premium.
- Cascades survive at 5x with low digital SD (`0.78`) and at 10x with low/standard SD (`0.80` / `0.53`).
- Seed fraction matters monotonically (`0.33`, `0.70`, `0.95` across the quick sweep).
- Normal, truncated-normal, and lognormal returns all preserve cascades in the focal region (`0.60`, `0.73`, `0.73`).
- Non-absorbing adoption remains close to the absorbing baseline (`0.55` vs `0.63`).

The "few misfits" result is therefore not solely a 10x-premium artifact, but it also does not hold at very low digital premium.

## 6. Replication and Uncertainty

`summarize_runs` now adds Wilson confidence intervals for every `cascade_prob`: `cascade_prob_ci_low` and `cascade_prob_ci_high`.

Every summary CSV records `n_runs`. Quick-mode focal cells use up to 60-80 runs depending on adaptive refinement; full mode is configured for 1000 focal replications and 250 boundary replications.

The beta tipping-point uncertainty is written to `results/topology_beta_tipping_ci.csv`.

## 7. Reporting and Reproducibility

Terminology and figures were relabelled toward manuscript terms:

- `:simple` -> frequency-based/bandwagon
- `:complex` -> success-based imitation
- initial digital seeds are separated from low-threshold pioneers/misfits

Software versions are written to each `results/*_metadata.json`; the quick run used Julia `1.10.4`, Agents.jl `6.2.10`, Graphs.jl `1.13.1`, CSV.jl `0.10.16`, DataFrames.jl `1.8.2`, and CairoMakie `0.13.10`.

`scripts/stylized_facts.jl` writes `results/stylized_facts_runs.csv`, `results/stylized_facts_summary.csv`, and `results/stylized_facts_curves.csv`.

No taxation, depreciation, Gini, or inequality machinery was added.

## Full-Mode Results

Full-mode production rerun completed with `N=1000`, `T=100`, `n_coarse=50`, `n_refine=250`, `n_focal=1000`, master seed `20260603`, and the same dynamic cascade definition (`final_adoption >= 0.5`, `t50-t10 <= 45`, `max_slope >= 0.02`). `Pkg.test()` passed after the full run.

Every generated summary with `cascade_prob` now carries `n_runs`, `cascade_prob_ci_low`, and `cascade_prob_ci_high`. Focal cells reached 1000 replications; adaptive boundary cells reached 250 replications. Non-boundary, non-focal cells remain at the 50-rep coarse pass by design.

### Headline Quick to Full Deltas

| Result | Quick | Full | Qualitative change |
|---|---:|---:|---|
| Exp A hazard dynamic cascade | 0.00 | 0.00 | Holds: hazard accumulation no longer counts as cascade. |
| Exp A frequency-based dynamic cascade | 0.00 | 0.00 | Holds. |
| Exp A success-based dynamic cascade | 1.00 | 0.989 `[0.980, 0.994]` | Holds with tight CI. |
| Small-world beta tipping point | 0.317 `[0.263, 0.456]` | 0.410 `[0.392, 0.428]` | Tipping point shifts upward materially; update manuscript numbers. |
| Topology regression avg path coefficient | -5.19 | 0.003 | Claim changes: full conditional regression does not support a strong negative path-length coefficient once clustering, degree, variance, and family are included. Raw small-world tipping still holds. |
| Exp C lower mean | 0.467 | 0.363 `[0.334, 0.393]` | Modest mean shift remains weaker than lower-tail treatments. |
| Exp C higher variance | 0.950 | 0.988 `[0.979, 0.993]` | Holds strongly. |
| Exp C mixture pi=5% | 0.900 | 0.859 `[0.836, 0.879]` | Holds. |
| Exp E random seeds/random pioneers | 0.57 | 0.507 `[0.476, 0.538]` | Baseline placement near 50%. |
| Exp E random seeds/hub-bridge pioneers | 1.00 | 1.00 `[0.996, 1.000]` | Holds: pioneer placement is decisive. |
| Exp E hub-bridge seeds/random pioneers | 0.85 | 0.920 `[0.902, 0.935]` | Holds: seed placement also matters. |
| Exp E hub-bridge seeds/hub-bridge pioneers | 1.00 | 1.00 `[0.996, 1.000]` | Holds. |

### Calibration Check

`results/calibration_summary.csv` was regenerated at full `N=1000`. In the calibration network (`small_world`, `beta=0.2`, baseline seed fraction `0.003`, `k=4`), `theta_mean=0.70` is below the dynamic-cascade boundary rather than near it:

| treatment | full cascade prob | median final adoption |
|---|---:|---:|
| homogeneous | 0.00 | 0.135 |
| mixture pi=5% | 0.00 | 0.334 |

This is a manuscript-relevant change. The production experiments still use the existing focal cells defined in the scripts, but the calibration text should not say homogeneous at `theta_mean=0.70` sits near the dynamic-cascade phase boundary for the `beta=0.2` calibration network.

### Experiment B Topology

Degree control holds in full mode: all small-world beta cells have realised mean degree `4.0`. The raw small-world sweep shows a clear dynamic-cascade transition: beta `0.2 -> 0.06`, beta `0.4 -> 0.484`, beta `0.7 -> 0.848`, beta `1.0 -> 0.94`.

The full-mode beta-star bootstrap CI is written to `results/topology_beta_tipping_ci.csv`: `beta*=0.410`, CI `[0.392, 0.428]`.

However, the full pooled logistic regression changes the conditional interpretation. `results/topology_regression_coefficients.csv` reports `avg_path_length estimate=0.0028`, while clustering is strongly negative and mean degree is positive. Safe wording: "In the degree-conserving small-world sweep, cascades turn on sharply as rewiring shortens paths and lowers clustering; in the pooled structural regression, the independent path-length effect is not stable once other network metrics and family are controlled."

### Experiment C and Equal Effort

Full focal treatment comparison (`beta=0.4`) supports the lower-tail claim at fixed mean:

| treatment | full cascade prob |
|---|---:|
| homogeneous | 0.200 |
| lower mean | 0.363 |
| higher variance | 0.988 |
| mixture pi=1% | 0.376 |
| mixture pi=3% | 0.592 |
| mixture pi=5% | 0.859 |
| mixture pi=10% | 0.960 |

Equal-effort remains mixed. Under L1 budget `0.02`, mixture is highest (`0.404`) but only modestly above lower mean (`0.370`) and higher variance (`0.344`). Under L1 budget `0.05`, lower mean saturates (`1.000`) while mixture is `0.735`. Under mass-below-critical budgets, lower mean and higher variance saturate at `1.000`, while mixture is `0.573` and `0.869`. The manuscript should keep the safe wording from the quick notes: the mixture advantage is not universal under equal-effort definitions.

### Experiments D and E Placement

Full Experiment D confirms placement effects for initial digital seeds:

| family | clustered | random | bridge | high-degree |
|---|---:|---:|---:|---:|
| small-world | 0.160 | 0.468 | 0.883 | 0.860 |
| power-law | 0.632 | 0.332 | 1.000 | 1.000 |

Full Experiment E confirms that initial seed placement and low-threshold pioneer placement are distinct levers:

| initial digital seeds | low-threshold pioneers | full cascade prob | median t50 |
|---|---|---:|---:|
| random | random | 0.507 | 54 |
| random | hub/bridge | 1.000 | 24 |
| hub/bridge | random | 0.920 | 35 |
| hub/bridge | hub/bridge | 1.000 | 20 |

### Robustness

Full robustness output is in `results/robustness_summary.csv` and `figures/robustness_summary.png/pdf`.

Key full-mode findings:

- The result does not survive at 1.5x premium and is mostly absent at 2x premium, except a small 2x/low-SD cell (`0.08`).
- Cascades appear by 3x premium when digital SD is low (`0.604`) and are strong at 5x/10x with low or medium SD.
- At 5x with high SD and at 10x with high SD, cascades are much weaker (`0.000` and `0.452` respectively), so the premium result depends on both mean premium and return uncertainty.
- Return-distribution robustness holds in the focal region: normal `0.420`, truncated normal `0.784`, lognormal `0.800`.
- Update schedule robustness holds: synchronous `0.460`, asynchronous `0.784`.
- Non-absorbing adoption remains comparable: absorbing `0.468`, nonabsorbing `0.548`.
- Benchmark robustness is not uniform: own valuation `0.404`, mean `1.000`, median `0.000`, p75 `1.000`. This should be reported as sensitivity, not robustness.

### Final Figures

`scripts/make_figures.jl` regenerated the full-mode figure set after all full CSVs were written. The final manifest is `figures/FIGURE_MANIFEST.md`. Figures now include Wilson CIs where cascade probabilities are plotted, dynamic-cascade footnotes, distinct terminology for initial digital seeds versus low-threshold pioneers, a beta-star CI band, and rebuilt equal-effort/robustness layouts.
