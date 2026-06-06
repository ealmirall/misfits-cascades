# Misfits Cascades

Replication code for **"When a Few Misfits Trigger Digital Adoption Cascades: Network Topology and Threshold Heterogeneity in an Agent-Based Model of Firms."**

The model is a Julia/Agents.jl implementation of firms placed on a fixed observation network. Firms are either traditional or digital. Digital firms have higher expected growth with high variance. Non-digital firms adopt by comparing themselves with better-performing neighbours and applying a fraction-threshold rule.

There is no taxation, depreciation, Gini, or inequality machinery in this codebase.

## Install

Use Julia 1.10 or newer.

```bash
julia --project -e 'using Pkg; Pkg.instantiate()'
```

Run the test suite:

```bash
julia --project -e 'using Pkg; Pkg.test()'
```

## Reproduce the quick run

The quick run is the default reviewer smoke test. It uses `N=500`, 20 coarse replications per cell, and smaller grids.

```bash
julia --project scripts/run_all_quick.jl
```

Each experiment can also be run separately:

```bash
julia --project scripts/run_calibration.jl --seed 20260603
julia --project scripts/run_expA_nullmodels.jl --quick --seed 20260603
julia --project scripts/run_expB_topology.jl --quick --seed 20260603
julia --project scripts/run_expC_culture_vs_misfits.jl --quick --seed 20260603
julia --project scripts/run_expD_seedplacement.jl --quick --seed 20260603
julia --project scripts/run_expE_seed_x_pioneer.jl --quick --seed 20260603
julia --project scripts/run_expC_equal_effort.jl --quick --seed 20260603
julia --project scripts/run_robustness.jl --quick --seed 20260603
julia --project scripts/analysis_topology_regression.jl
julia --project scripts/stylized_facts.jl
```

For paper-scale runs, pass `--full`:

```bash
julia --project scripts/run_expB_topology.jl --full --seed 20260603
```

Regenerate the publication-quality figure set from the existing CSV outputs:

```bash
julia --project scripts/make_figures.jl
```

## Outputs

All experiment scripts write:

- `results/*_runs.csv`: one row per simulation run, including parameters, network metrics, outcome metrics, and run seed.
- `results/*_curves.csv`: tidy adoption time series, one row per run-period.
- `results/*_summary.csv`: cell summaries with means, medians, and 5th/95th percentiles.
- `results/*_metadata.json`: master seed, settings, Julia version, package versions, and cell definitions.
- `figures/*.png` and `figures/*.pdf`: main figures for Experiments A-D.
- `figures/fig1_*.png/pdf` through `figures/fig6_*.png/pdf`: publication-quality annotated figures generated from `scripts/make_figures.jl`.
- `results/topology_regression_coefficients.csv`, `results/topology_partial_effect_avg_path.csv`, and `results/topology_beta_tipping_ci.csv`: degree-controlled topology analysis and the bootstrapped β* interval.
- `results/expE_seed_x_pioneer_*`, `results/expC_equal_effort_*`, `results/robustness_*`, and `results/stylized_facts_*`: reviewer-revision analyses.

## Calibrated v2 regime

The first mechanically successful run used `theta_mean=0.25`, seed fraction `0.01`, and mean degree near `10`; that put nearly every experiment in an "everything cascades" regime. The current v2 baseline is deliberately harder:

- `theta_mean = 0.70`
- `seed_fraction = 0.003`
- `k = 4`
- `N = 1000`, `T = 100`, `v0 = 10`

Calibration used `scripts/run_calibration.jl`, sweeping `theta_mean` from `0.20` to `0.70` on a small-world `beta=0.2` network. With `seed_fraction=0.005` and `k=6`, even `theta_mean=0.70` still cascaded too reliably. Hardening to `seed_fraction=0.003` and `k=4` put the homogeneous baseline at the phase boundary: in the calibration sweep, homogeneous at `theta_mean=0.70` cascaded in about `0.30` of runs, while the mean-matched mixture with `pi=0.05` cascaded in about `0.80`.

Quick mode uses the same calibrated logic with `N=500` and smaller grids.

## Model choices

The default adoption rule is `:complex`: a non-digital firm considers only neighbours with higher valuation and adopts if the digital share among those better-performing neighbours is at least its threshold. Adoption decisions are synchronous by default.

The reported cascade flag is dynamic, not just a final-adoption threshold. A run is a cascade when `final_adoption >= 0.5`, `t50 - t10 <= 45`, and `max_slope >= 0.02`; a stricter `final_adoption >= 0.7` variant and the legacy final-threshold flags are also stored in every run CSV. These defaults are logged as `cascade_transition_window`, `cascade_slope_min`, and `cascade_final_cutoff`.

Terminology is separated in code and output tables. `seed_*` columns refer to initial digital firms at `t = 0`. `pioneer_*` columns refer to low-threshold receptive firms ("misfits") and these firms are not necessarily digital initially.

Small-world networks now use a degree-conserving Watts-Strogatz rewiring generator. The Barabasi-Albert family is labelled as degree-varying, and Experiment B includes an Erdos-Renyi degree-matched control family. Every run row records realised mean degree, clustering, degree variance, average path length, and giant-component fraction.

The `:hazard` null model uses an exposed per-step adoption probability `hazard_h`. The default `hazard_h=0.01` is a simple pressure-matching choice; scripts expose it in the output tables so alternative calibrations can be rerun.

Experiment A is a mechanism stress test on a small-world `beta=1.0` network with `pi=0.10` and a 1% initial digital seed fraction; under the dynamic metric this separates slow hazard accumulation from success-based takeoff. Experiment C uses a focal small-world `beta=0.4` transition cell with 1% initial seeds. Experiment D uses small-world `beta=0.4` with 0.6% seeds and power-law `m=2`; Experiment E separately crosses initial seed placement and low-threshold pioneer placement.

The optional `performance_weighted=true` flag weights better-performing neighbours by the valuation gap. Robustness scripts also expose return distributions (`:normal`, `:truncated_normal`, `:lognormal`), local performance benchmarks (`:own`, `:mean`, `:median`, `:p75`), synchronous/asynchronous updates, and optional non-absorbing adoption. The `:count_legacy` rule is available for appendix robustness but is not used in the main quick scripts.

## Repository layout

```text
misfits-cascades/
├── Project.toml
├── Manifest.toml
├── README.md
├── src/
│   ├── Misfits.jl
│   ├── model.jl
│   ├── networks.jl
│   ├── thresholds.jl
│   ├── seeding.jl
│   ├── metrics.jl
│   ├── experiments.jl
│   └── figures.jl
├── scripts/
│   ├── run_expA_nullmodels.jl
│   ├── run_expB_topology.jl
│   ├── run_expC_culture_vs_misfits.jl
│   ├── run_expD_seedplacement.jl
│   ├── run_expE_seed_x_pioneer.jl
│   ├── run_expC_equal_effort.jl
│   ├── run_robustness.jl
│   ├── analysis_topology_regression.jl
│   ├── stylized_facts.jl
│   ├── run_calibration.jl
│   ├── make_figures.jl
│   └── run_all_quick.jl
├── test/
│   └── runtests.jl
├── results/
└── figures/
```
