# Experiment L Verdict

**Pre-registered verdict:** supported.

| detail | criterion | passed |
|---|---|---|
| success rows with CI>0=2; max null cascade=0.0 | C1 mechanism | true |
| minimum median successful exemplars across mechanism cells=9.0 | C2 reinforcement | true |
| max >=2 lower CI=0.9398260695220669; max >=3 lower CI=0.9398260695220669 | C3 adequate ignition | true |
| peak k=10 p=1.0; k=150 p=0.0; k=200 p=0.0 | C4 bounded scale | true |

## Ignition Threshold

| t50_median | variant_label | k | variant | minimum_seed_fraction_with_ci_excluding_zero | cascade_prob_ci_low | seed_strategy | cascade_prob | cascade_prob_ci_high |
|---|---|---|---|---|---|---|---|---|
| 77.000 | fractional success + >=2 | 20 | success_min2 | 0.020 | 0.017 | clustered | 0.050 | 0.137 |
| 46.500 | fractional success + >=2 | 20 | success_min2 | 0.020 | 0.409 | hub_bridge | 0.533 | 0.654 |
| 63.000 | fractional success + >=2 | 20 | success_min2 | 0.020 | 0.118 | random | 0.200 | 0.318 |
| missing | fractional success + >=3 | 20 | success_min3 | missing | 0.000 | clustered | 0.000 | missing |
| 65.500 | fractional success + >=3 | 20 | success_min3 | 0.050 | 0.026 | hub_bridge | 0.067 | 0.159 |
| missing | fractional success + >=3 | 20 | success_min3 | missing | 0.000 | random | 0.000 | missing |
| 26.500 | fractional success | 20 | success_original | 0.001 | 0.911 | clustered | 0.983 | 0.997 |
| 25.000 | fractional success | 20 | success_original | 0.001 | 0.940 | hub_bridge | 1.000 | 1.000 |
| 26.000 | fractional success | 20 | success_original | 0.001 | 0.911 | random | 0.983 | 0.997 |
| 55.500 | fractional success + >=2 | 50 | success_min2 | 0.005 | 0.425 | clustered | 0.550 | 0.669 |
| 47.500 | fractional success + >=2 | 50 | success_min2 | 0.005 | 0.558 | hub_bridge | 0.683 | 0.787 |
| 50.000 | fractional success + >=2 | 50 | success_min2 | 0.005 | 0.409 | random | 0.533 | 0.654 |
| 53.000 | fractional success + >=3 | 50 | success_min3 | 0.020 | 0.316 | clustered | 0.433 | 0.559 |
| 74.500 | fractional success + >=3 | 50 | success_min3 | 0.010 | 0.017 | hub_bridge | 0.050 | 0.137 |
| 54.500 | fractional success + >=3 | 50 | success_min3 | 0.020 | 0.256 | random | 0.367 | 0.493 |
| 34.000 | fractional success | 50 | success_original | 0.001 | 0.863 | clustered | 0.950 | 0.983 |
| 33.000 | fractional success | 50 | success_original | 0.001 | 0.911 | hub_bridge | 0.983 | 0.997 |
| 33.000 | fractional success | 50 | success_original | 0.001 | 0.886 | random | 0.967 | 0.991 |

## Scale Bound

The scale curve peaks at k=10 with cascade probability 1.0. At k=150 the probability is 0.0; at k=200 it is 0.0.
