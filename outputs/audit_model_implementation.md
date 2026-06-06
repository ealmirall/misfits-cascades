# Audit: Current Model Implementation

Generated before running Experiments G-J.

## Adoption Rules

- Path: `src/model.jl`
- Main dispatcher: `adoption_decision(model, agent)`
- Modes:
  - `:hazard`: non-digital firms adopt with probability `model.hazard_h`.
  - `:simple`: frequency-based imitation. Uses `exposure_share_simple(model, agent)`, defined as the digital share among all graph neighbours.
  - `:complex`: success-based imitation. Uses `exposure_share_complex(model, agent)`.
  - `:count_legacy`: appendix robustness rule. Adopts when the absolute number of better-performing digital neighbours is at least `model.count_k`.

## Success-Based Exposure

- Path: `src/model.jl`
- Functions: `better_performing_nodes`, `success_exposure_stats`, `exposure_share_complex`.
- Current original rule:
  - Build `better = {j in neighbours(i): valuation_j > benchmark_i}`.
  - By default `benchmark_i` is the focal firm's own valuation (`performance_benchmark = :own`).
  - Original exposure denominator is `length(better)`.
  - Exposure is `# digital better-performing neighbours / # better-performing neighbours`.
- New robustness switches:
  - `success_denominator = :better` or `:all_neighbors`.
  - `min_successful_digital` requires at least that many better-performing digital neighbours.
  - `min_better_total` requires at least that many total better-performing neighbours.
  - `:count_legacy` remains available for absolute-count checks.

## Frequency-Based Exposure

- Path: `src/model.jl`
- Function: `exposure_share_simple(model, agent)`.
- Definition: `# digital neighbours / # all neighbours`.
- No performance conditioning.

## Cascade Indicators

- Path: `src/metrics.jl`
- Functions: `first_crossing`, `transition_time`, `max_adoption_slope`, `dynamic_cascade`, `run_model`.
- Baseline dynamic cascade:
  - `final_adoption >= 0.5`
  - `transition_time = t50 - t10 <= 45`
  - `max_slope >= 0.02`
- Per-run outputs include `final_adoption`, `t10`, `t50`, `t90`, `transition_time`, `max_slope`, `max_slope_period`, `cascade`, `cascade_dynamic70`, `cascade_threshold50`, and `cascade_threshold70`.

## Exit and Replacement

- Path: `src/model.jl`
- Function: `replace_bankrupt!(model)`.
- A firm exits if `valuation < model.bankruptcy_floor`.
- The agent is removed and replaced at the same graph node.
- Replacement entrants receive:
  - `valuation = model.v0`
  - `age = 0`
  - a newly drawn threshold from `draw_one_threshold(model.threshold_treatment, model.threshold_params)`
  - digital status controlled by `replacement_digital_rule`
- Current production results used the previous implicit behavior, now labelled `replacement_digital_rule = :bernoulli_seed_probability`, meaning a replacement entrant is digital with probability `model.p_digital`.
- The manuscript assumption is `replacement_digital_rule = :traditional_only`, meaning all replacement entrants are traditional. Experiment I ablates both rules.

## Same-Period Replacement Timing

- Path: `src/model.jl`
- Function: `model_step!(model)`.
- Order:
  1. `grow_agents!`
  2. `replace_bankrupt!`
  3. `apply_adoption!`
- Therefore replacement entrants can participate in adoption decisions in the same period in which they enter. They enter before adoption, with `valuation = v0` and freshly drawn threshold. Because adoption is synchronous by default, entrants can adopt in that same adoption stage if they are non-digital and satisfy the rule; they can also be observed by neighbours during that adoption stage.

## Threshold Assignment

- Path: `src/thresholds.jl`
- Functions:
  - `draw_thresholds`
  - `draw_one_threshold`
  - `mixture_thresholds_with_pioneers`
- Initial thresholds are drawn before model construction.
- Replacement thresholds are drawn one at a time with `draw_one_threshold`.
- In mixture treatments with explicitly chosen pioneers, initial pioneer nodes receive low thresholds. Replacement entrants currently redraw from the treatment distribution, not from the original node-specific threshold vector.
- Revision patch: one-at-a-time mixture draws now sample the low-threshold state with probability `pi`/`pioneer_fraction` directly. This avoids the earlier `N=1` rounding artifact in replacement threshold draws.

## Networks and Placement

- Networks:
  - Path: `src/networks.jl`
  - Factory: `build_network(family, params; rng)`
  - Families: `:small_world`, `:power_law`, `:degree_matched_random`
  - Small-world uses degree-conserving Watts-Strogatz rewiring (`watts_strogatz_rewire`).
- Initial digital seeds and low-threshold pioneers:
  - Path: `src/seeding.jl`
  - Functions: `choose_seeds`, `choose_pioneers`
  - Strategies: `:random`, `:high_degree`, `:bridge`, `:hub_bridge`, `:clustered`

## Adaptive Replications

- Path: `src/experiments.jl`
- Function: `run_parameter_grid`
- Settings:
  - `quick_settings`: smoke-test settings.
  - `full_settings`: `N=1000`, `T=100`, `n_coarse=50`, `n_refine=250`, `n_focal=1000`, `k=4`, `theta_mean=0.70`, dynamic cascade parameters `45/0.02/0.5`.
- Procedure:
  - Run `n_coarse` for all cells.
  - Add replications up to `n_refine` for cells with coarse cascade probability in `[0.1, 0.9]`.
  - Add replications up to `n_focal` for cells flagged `focal=true`.

## Summary of Current Implementation Issue

The code used for production A-F results did **not** implement the manuscript statement that replacement entrants are always traditional. It implemented continuing digital reseeding at probability `p_digital`. This is now exposed and labelled as `replacement_digital_rule = :bernoulli_seed_probability`; the manuscript rule is available as `replacement_digital_rule = :traditional_only`. The revision code also fixes the one-draw replacement-threshold helper for mixture treatments; production A-F outputs in `results/` are preserved and not overwritten.
