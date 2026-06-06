# Revision Claim Audit

Generated: 2026-06-04T19:13:57.968

## Claims that are still supported

- **Mechanism specificity under the original rule.** In Experiment G, the Exp A focal cell has cascade probability 0.988 for original success-conditioned imitation, versus 0.000 for hazard and 0.000 for frequency-based imitation.
- **Replacement-entry assumption is not driving the main success result.** Experiment I gives Exp A success-based cascade probabilities 1.000 under traditional-only entrants and 0.992 under Bernoulli entrants.
- **Connectivity and misfit share jointly create a frontier.** In Experiment J, beta/pi probabilities rise from beta=0.2, pi=0.05 at 0.020 to beta=0.4, pi=0.05 at 0.490 and beta=0.7, pi=0.05 at 0.830.
- **Seed and pioneer placement remain policy-relevant.** Experiment I shows random/random placement at 0.444 under traditional-only entrants, while hub/bridge seed and pioneer placement reaches 1.000.

## Claims that should be narrowed or softened

- **Do not claim robustness to all complex-contagion specifications.** Experiment G shows `success_min2`, `success_min3`, and all-neighbour-denominator variants at zero in both the Exp A focal and beta=0.4 transition settings. The safer wording is `success-conditioned threshold imitation using the better-neighbour denominator`, with the stricter variants reported as a limitation.
- **Do not describe the effect as misfits alone.** Experiment J shows beta=0.05 and beta=0.10 have zero cascades at every pi in the tested grid, while beta=0.4/0.7/1.0 cross the frontier as pi rises.
- **Do not claim high variance promotes cascades.** In the premium/variance map, original success imitation at premium=10 has probability 0.510 under baseline high variance and 0.930 under lower variance. High variance should be framed as noisy inference, not as a cascade amplifier.
- **Label production replacement-entry behavior.** Existing A-F production results used `bernoulli_seed_probability`. The code now exposes `traditional_only`; Experiment I suggests the main conclusion survives, but tables/notes should identify which rule each result uses.
- **Avoid overusing beta=0.2 as the headline transition setting.** The beta/pi map gives beta=0.2, pi=0.05 at 0.020 and pi=0.10 at 0.070. The cleaner frontier is around beta=0.4 to 0.7 in the calibrated regime.

## Recommended manuscript phrasing

Use: `A small low-threshold minority can trigger fast adoption cascades when firms use success-conditioned threshold imitation and the network supplies enough reach. The cascade is not reproduced by hazard or frequency-only adoption, survives the replacement-entry ablation, and is strongest when receptive firms or initial digital seeds occupy hub/bridge positions.`

Avoid: `The result is robust to stricter complex-contagion rules` or `high variance causes cascades`.
