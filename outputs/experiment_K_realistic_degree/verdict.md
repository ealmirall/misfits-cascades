# Experiment K Verdict

**Pre-registered verdict:** not supported.

Criterion 1 requires performance-conditioned cascades with Wilson lower bound excluding 0 while hazard and frequency nulls do not cascade. Criterion 2 requires median successful digital neighbours at adoption >= 2. Criterion 3 requires the explicit >=2 successful-digital rule not to collapse to approximately zero; >=3 survival is treated as the stronger ideal.

**Calibration warning:** at least one realistic-degree calibration did not hit the pre-specified homogeneous baseline target band of 0.2-0.4. The selected cell is the nearest conservative grid point; see `calibration_by_degree.csv`.

| frequency_cascade_prob | k | success_cascade_prob | hazard_cascade_prob | criterion1_cascades_vs_nulls | min2_cascade_prob | criterion2_median_successful_exemplars_ge2 | median_successful_exemplars | min3_cascade_prob | criterion3_min2_survives | degree_verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| 0.000 | 20 | 0.975 | 0.000 | true | 0.000 | true | 9.000 | 0.000 | false | not supported |
| 0.000 | 50 | 0.950 | 0.000 | true | 0.000 | true | 25.000 | 0.000 | false | not supported |
| 0.000 | 100 | 0.000 | 0.000 | false | 0.000 | true | 38.000 | 0.000 | false | not supported |

Interpretive note: `partially supported` means the realistic-degree model has direct reinforcement at adoption and survives >=2, but not the stricter >=3 ideal. `not supported` means at least one required criterion fails.
