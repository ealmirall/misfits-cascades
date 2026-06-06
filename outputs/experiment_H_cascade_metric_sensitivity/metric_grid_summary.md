# Experiment H: Cascade Metric Sensitivity

## Direct answers

- Baseline A hazard/simple/success: 0.0 / 0.0 / 0.989.
- Loose A hazard/simple/success (W=60, s_min=0.01): 0.0 / 0.0 / 1.0.
- Strict A hazard/simple/success (final>=0.70, W=30, s_min=0.03): 0.0 / 0.0 / 0.604.
- The full grid below should be used to identify claims that depend on W=45 or s_min=0.02.


| slope_min | comparison | n_runs | final_cutoff | cascade_prob_ci_low | source_experiment | transition_window | cascade_prob | cascade_prob_ci_high |
|---|---|---|---|---|---|---|---|---|
| 0.010 | A hazard | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.010 | A frequency-based | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.010 | A success-based | 1000 | 0.500 | 0.943 | expA | 30 | 0.957 | 0.968 |
| 0.010 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.124 | expB | 30 | 0.144 | 0.167 |
| 0.010 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.311 | expB | 30 | 0.368 | 0.429 |
| 0.010 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.259 | expB | 30 | 0.380 | 0.518 |
| 0.010 | B power_law beta=missing m=2 | 250 | 0.500 | 0.284 | expB | 30 | 0.340 | 0.401 |
| 0.010 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.542 | expB | 30 | 0.680 | 0.792 |
| 0.010 | B power_law beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.010 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.626 | expB | 30 | 0.760 | 0.857 |
| 0.010 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.692 | expB | 30 | 0.820 | 0.902 |
| 0.010 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.583 | expB | 30 | 0.720 | 0.825 |
| 0.010 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.653 | expB | 30 | 0.712 | 0.765 |
| 0.010 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.021 | expC | 30 | 0.030 | 0.043 |
| 0.010 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.053 | expC | 30 | 0.067 | 0.084 |
| 0.010 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.864 | expC | 30 | 0.885 | 0.903 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.075 | expC | 30 | 0.108 | 0.153 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.213 | expC | 30 | 0.264 | 0.322 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.544 | expC | 30 | 0.575 | 0.605 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.715 | expC | 30 | 0.840 | 0.917 |
| 0.010 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.010 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.031 | expC | 30 | 0.052 | 0.087 |
| 0.010 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.059 | expC | 30 | 0.088 | 0.130 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.034 | expC | 30 | 0.056 | 0.092 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.247 | expC | 30 | 0.300 | 0.359 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.462 | expC | 30 | 0.524 | 0.585 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.626 | expC | 30 | 0.760 | 0.857 |
| 0.010 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.184 | expC | 30 | 0.232 | 0.288 |
| 0.010 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.454 | expC | 30 | 0.516 | 0.577 |
| 0.010 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.738 | expC | 30 | 0.860 | 0.930 |
| 0.010 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 30 | 1.000 | 1.000 |
| 0.010 | D small_world seed=random | 250 | 0.500 | 0.113 | expD | 30 | 0.152 | 0.202 |
| 0.010 | D power_law seed=random | 250 | 0.500 | 0.137 | expD | 30 | 0.180 | 0.232 |
| 0.010 | D small_world seed=high_degree | 250 | 0.500 | 0.558 | expD | 30 | 0.620 | 0.678 |
| 0.010 | D power_law seed=high_degree | 1000 | 0.500 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.010 | D small_world seed=bridge | 1000 | 0.500 | 0.595 | expD | 30 | 0.625 | 0.654 |
| 0.010 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.010 | D small_world seed=clustered | 250 | 0.500 | 0.009 | expD | 30 | 0.020 | 0.046 |
| 0.010 | D power_law seed=clustered | 250 | 0.500 | 0.415 | expD | 30 | 0.476 | 0.538 |
| 0.010 | E seed=random pioneer=random | 1000 | 0.500 | 0.160 | expE | 30 | 0.183 | 0.208 |
| 0.010 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.993 | expE | 30 | 0.998 | 0.999 |
| 0.010 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.700 | expE | 30 | 0.728 | 0.755 |
| 0.010 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 30 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.184 | robustness | 30 | 0.232 | 0.288 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.411 | robustness | 30 | 0.472 | 0.534 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.407 | robustness | 30 | 0.468 | 0.530 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.415 | robustness | 30 | 0.476 | 0.538 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.085 | robustness | 30 | 0.120 | 0.166 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.169 | robustness | 30 | 0.216 | 0.271 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.109 | robustness | 30 | 0.148 | 0.197 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.127 | robustness | 30 | 0.168 | 0.219 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.626 | robustness | 30 | 0.760 | 0.857 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.089 | robustness | 30 | 0.124 | 0.171 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.318 | robustness | 30 | 0.376 | 0.437 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.075 | robustness | 30 | 0.108 | 0.153 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.314 | robustness | 30 | 0.372 | 0.433 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.295 | robustness | 30 | 0.352 | 0.413 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.102 | robustness | 30 | 0.140 | 0.188 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.123 | robustness | 30 | 0.164 | 0.215 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.116 | robustness | 30 | 0.156 | 0.206 |
| 0.015 | A hazard | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.015 | A frequency-based | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.015 | A success-based | 1000 | 0.500 | 0.943 | expA | 30 | 0.957 | 0.968 |
| 0.015 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.124 | expB | 30 | 0.144 | 0.167 |
| 0.015 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.311 | expB | 30 | 0.368 | 0.429 |
| 0.015 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.259 | expB | 30 | 0.380 | 0.518 |
| 0.015 | B power_law beta=missing m=2 | 250 | 0.500 | 0.284 | expB | 30 | 0.340 | 0.401 |
| 0.015 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.542 | expB | 30 | 0.680 | 0.792 |
| 0.015 | B power_law beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.015 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.626 | expB | 30 | 0.760 | 0.857 |
| 0.015 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.692 | expB | 30 | 0.820 | 0.902 |
| 0.015 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.583 | expB | 30 | 0.720 | 0.825 |
| 0.015 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.653 | expB | 30 | 0.712 | 0.765 |
| 0.015 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.021 | expC | 30 | 0.030 | 0.043 |
| 0.015 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.053 | expC | 30 | 0.067 | 0.084 |
| 0.015 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.864 | expC | 30 | 0.885 | 0.903 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.075 | expC | 30 | 0.108 | 0.153 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.213 | expC | 30 | 0.264 | 0.322 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.544 | expC | 30 | 0.575 | 0.605 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.715 | expC | 30 | 0.840 | 0.917 |
| 0.015 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.015 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.031 | expC | 30 | 0.052 | 0.087 |
| 0.015 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.059 | expC | 30 | 0.088 | 0.130 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.034 | expC | 30 | 0.056 | 0.092 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.247 | expC | 30 | 0.300 | 0.359 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.462 | expC | 30 | 0.524 | 0.585 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.626 | expC | 30 | 0.760 | 0.857 |
| 0.015 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.184 | expC | 30 | 0.232 | 0.288 |
| 0.015 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.454 | expC | 30 | 0.516 | 0.577 |
| 0.015 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.738 | expC | 30 | 0.860 | 0.930 |
| 0.015 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 30 | 1.000 | 1.000 |
| 0.015 | D small_world seed=random | 250 | 0.500 | 0.113 | expD | 30 | 0.152 | 0.202 |
| 0.015 | D power_law seed=random | 250 | 0.500 | 0.137 | expD | 30 | 0.180 | 0.232 |
| 0.015 | D small_world seed=high_degree | 250 | 0.500 | 0.558 | expD | 30 | 0.620 | 0.678 |
| 0.015 | D power_law seed=high_degree | 1000 | 0.500 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.015 | D small_world seed=bridge | 1000 | 0.500 | 0.595 | expD | 30 | 0.625 | 0.654 |
| 0.015 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.015 | D small_world seed=clustered | 250 | 0.500 | 0.009 | expD | 30 | 0.020 | 0.046 |
| 0.015 | D power_law seed=clustered | 250 | 0.500 | 0.415 | expD | 30 | 0.476 | 0.538 |
| 0.015 | E seed=random pioneer=random | 1000 | 0.500 | 0.160 | expE | 30 | 0.183 | 0.208 |
| 0.015 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.993 | expE | 30 | 0.998 | 0.999 |
| 0.015 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.700 | expE | 30 | 0.728 | 0.755 |
| 0.015 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 30 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.184 | robustness | 30 | 0.232 | 0.288 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.411 | robustness | 30 | 0.472 | 0.534 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.407 | robustness | 30 | 0.468 | 0.530 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.415 | robustness | 30 | 0.476 | 0.538 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.085 | robustness | 30 | 0.120 | 0.166 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.169 | robustness | 30 | 0.216 | 0.271 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.109 | robustness | 30 | 0.148 | 0.197 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.127 | robustness | 30 | 0.168 | 0.219 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.626 | robustness | 30 | 0.760 | 0.857 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.089 | robustness | 30 | 0.124 | 0.171 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.318 | robustness | 30 | 0.376 | 0.437 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.075 | robustness | 30 | 0.108 | 0.153 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.314 | robustness | 30 | 0.372 | 0.433 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.295 | robustness | 30 | 0.352 | 0.413 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.102 | robustness | 30 | 0.140 | 0.188 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.123 | robustness | 30 | 0.164 | 0.215 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.116 | robustness | 30 | 0.156 | 0.206 |
| 0.020 | A hazard | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.020 | A frequency-based | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.020 | A success-based | 1000 | 0.500 | 0.943 | expA | 30 | 0.957 | 0.968 |
| 0.020 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.122 | expB | 30 | 0.142 | 0.165 |
| 0.020 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.311 | expB | 30 | 0.368 | 0.429 |
| 0.020 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.259 | expB | 30 | 0.380 | 0.518 |
| 0.020 | B power_law beta=missing m=2 | 250 | 0.500 | 0.284 | expB | 30 | 0.340 | 0.401 |
| 0.020 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.542 | expB | 30 | 0.680 | 0.792 |
| 0.020 | B power_law beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.020 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.626 | expB | 30 | 0.760 | 0.857 |
| 0.020 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.692 | expB | 30 | 0.820 | 0.902 |
| 0.020 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.583 | expB | 30 | 0.720 | 0.825 |
| 0.020 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.653 | expB | 30 | 0.712 | 0.765 |
| 0.020 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.021 | expC | 30 | 0.030 | 0.043 |
| 0.020 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.052 | expC | 30 | 0.066 | 0.083 |
| 0.020 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.864 | expC | 30 | 0.885 | 0.903 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.072 | expC | 30 | 0.104 | 0.148 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.210 | expC | 30 | 0.260 | 0.318 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.542 | expC | 30 | 0.573 | 0.603 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.715 | expC | 30 | 0.840 | 0.917 |
| 0.020 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.020 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.028 | expC | 30 | 0.048 | 0.082 |
| 0.020 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.059 | expC | 30 | 0.088 | 0.130 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.034 | expC | 30 | 0.056 | 0.092 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.243 | expC | 30 | 0.296 | 0.355 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.458 | expC | 30 | 0.520 | 0.581 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.626 | expC | 30 | 0.760 | 0.857 |
| 0.020 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.184 | expC | 30 | 0.232 | 0.288 |
| 0.020 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.454 | expC | 30 | 0.516 | 0.577 |
| 0.020 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.738 | expC | 30 | 0.860 | 0.930 |
| 0.020 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 30 | 1.000 | 1.000 |
| 0.020 | D small_world seed=random | 250 | 0.500 | 0.109 | expD | 30 | 0.148 | 0.197 |
| 0.020 | D power_law seed=random | 250 | 0.500 | 0.137 | expD | 30 | 0.180 | 0.232 |
| 0.020 | D small_world seed=high_degree | 250 | 0.500 | 0.558 | expD | 30 | 0.620 | 0.678 |
| 0.020 | D power_law seed=high_degree | 1000 | 0.500 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.020 | D small_world seed=bridge | 1000 | 0.500 | 0.592 | expD | 30 | 0.622 | 0.652 |
| 0.020 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.020 | D small_world seed=clustered | 250 | 0.500 | 0.009 | expD | 30 | 0.020 | 0.046 |
| 0.020 | D power_law seed=clustered | 250 | 0.500 | 0.415 | expD | 30 | 0.476 | 0.538 |
| 0.020 | E seed=random pioneer=random | 1000 | 0.500 | 0.159 | expE | 30 | 0.182 | 0.207 |
| 0.020 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.993 | expE | 30 | 0.998 | 0.999 |
| 0.020 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.698 | expE | 30 | 0.726 | 0.753 |
| 0.020 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 30 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.177 | robustness | 30 | 0.224 | 0.280 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.411 | robustness | 30 | 0.472 | 0.534 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.407 | robustness | 30 | 0.468 | 0.530 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.415 | robustness | 30 | 0.476 | 0.538 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.082 | robustness | 30 | 0.116 | 0.162 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.159 | robustness | 30 | 0.204 | 0.258 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.109 | robustness | 30 | 0.148 | 0.197 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.127 | robustness | 30 | 0.168 | 0.219 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.626 | robustness | 30 | 0.760 | 0.857 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.089 | robustness | 30 | 0.124 | 0.171 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.318 | robustness | 30 | 0.376 | 0.437 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.075 | robustness | 30 | 0.108 | 0.153 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.314 | robustness | 30 | 0.372 | 0.433 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.295 | robustness | 30 | 0.352 | 0.413 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.099 | robustness | 30 | 0.136 | 0.184 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.116 | robustness | 30 | 0.156 | 0.206 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.116 | robustness | 30 | 0.156 | 0.206 |
| 0.025 | A hazard | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.025 | A frequency-based | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.025 | A success-based | 1000 | 0.500 | 0.867 | expA | 30 | 0.888 | 0.906 |
| 0.025 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.068 | expB | 30 | 0.084 | 0.103 |
| 0.025 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.277 | expB | 30 | 0.332 | 0.393 |
| 0.025 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.259 | expB | 30 | 0.380 | 0.518 |
| 0.025 | B power_law beta=missing m=2 | 250 | 0.500 | 0.284 | expB | 30 | 0.340 | 0.401 |
| 0.025 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.542 | expB | 30 | 0.680 | 0.792 |
| 0.025 | B power_law beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.025 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.626 | expB | 30 | 0.760 | 0.857 |
| 0.025 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.692 | expB | 30 | 0.820 | 0.902 |
| 0.025 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.583 | expB | 30 | 0.720 | 0.825 |
| 0.025 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.641 | expB | 30 | 0.700 | 0.753 |
| 0.025 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.003 | expC | 30 | 0.007 | 0.014 |
| 0.025 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.032 | expC | 30 | 0.043 | 0.057 |
| 0.025 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.794 | expC | 30 | 0.819 | 0.842 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.043 | expC | 30 | 0.068 | 0.106 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.109 | expC | 30 | 0.148 | 0.197 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.380 | expC | 30 | 0.410 | 0.441 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.462 | expC | 30 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.015 |
| 0.025 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.006 | expC | 30 | 0.016 | 0.040 |
| 0.025 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.037 | expC | 30 | 0.060 | 0.097 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.152 | expC | 30 | 0.196 | 0.250 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.314 | expC | 30 | 0.372 | 0.433 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.462 | expC | 30 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.173 | expC | 30 | 0.220 | 0.275 |
| 0.025 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.388 | expC | 30 | 0.448 | 0.510 |
| 0.025 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.715 | expC | 30 | 0.840 | 0.917 |
| 0.025 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.838 | expC | 30 | 0.940 | 0.979 |
| 0.025 | D small_world seed=random | 250 | 0.500 | 0.046 | expD | 30 | 0.072 | 0.111 |
| 0.025 | D power_law seed=random | 250 | 0.500 | 0.134 | expD | 30 | 0.176 | 0.228 |
| 0.025 | D small_world seed=high_degree | 250 | 0.500 | 0.368 | expD | 30 | 0.428 | 0.490 |
| 0.025 | D power_law seed=high_degree | 1000 | 0.500 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.025 | D small_world seed=bridge | 1000 | 0.500 | 0.392 | expD | 30 | 0.422 | 0.453 |
| 0.025 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.025 | D small_world seed=clustered | 250 | 0.500 | 0.001 | expD | 30 | 0.004 | 0.022 |
| 0.025 | D power_law seed=clustered | 250 | 0.500 | 0.415 | expD | 30 | 0.476 | 0.538 |
| 0.025 | E seed=random pioneer=random | 1000 | 0.500 | 0.094 | expE | 30 | 0.112 | 0.133 |
| 0.025 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.974 | expE | 30 | 0.984 | 0.990 |
| 0.025 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.540 | expE | 30 | 0.571 | 0.601 |
| 0.025 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.990 | expE | 30 | 0.996 | 0.998 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.085 | robustness | 30 | 0.120 | 0.166 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.303 | robustness | 30 | 0.360 | 0.421 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.303 | robustness | 30 | 0.360 | 0.421 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.307 | robustness | 30 | 0.364 | 0.425 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.031 | robustness | 30 | 0.052 | 0.087 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.099 | robustness | 30 | 0.136 | 0.184 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.049 | robustness | 30 | 0.076 | 0.116 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.059 | robustness | 30 | 0.088 | 0.130 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.522 | robustness | 30 | 0.660 | 0.776 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.052 | robustness | 30 | 0.080 | 0.120 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.303 | robustness | 30 | 0.360 | 0.421 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.043 | robustness | 30 | 0.068 | 0.106 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.217 | robustness | 30 | 0.268 | 0.326 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.155 | robustness | 30 | 0.200 | 0.254 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.040 | robustness | 30 | 0.064 | 0.101 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.059 | robustness | 30 | 0.088 | 0.130 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.075 | robustness | 30 | 0.108 | 0.153 |
| 0.030 | A hazard | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.030 | A frequency-based | 50 | 0.500 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.030 | A success-based | 1000 | 0.500 | 0.573 | expA | 30 | 0.604 | 0.634 |
| 0.030 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.015 | expB | 30 | 0.023 | 0.034 |
| 0.030 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.137 | expB | 30 | 0.180 | 0.232 |
| 0.030 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.128 | expB | 30 | 0.220 | 0.352 |
| 0.030 | B power_law beta=missing m=2 | 250 | 0.500 | 0.265 | expB | 30 | 0.320 | 0.380 |
| 0.030 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.404 | expB | 30 | 0.540 | 0.670 |
| 0.030 | B power_law beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.030 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.501 | expB | 30 | 0.640 | 0.759 |
| 0.030 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.462 | expB | 30 | 0.600 | 0.724 |
| 0.030 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.423 | expB | 30 | 0.560 | 0.688 |
| 0.030 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.567 | expB | 30 | 0.628 | 0.686 |
| 0.030 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.001 | expC | 30 | 0.002 | 0.007 |
| 0.030 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.004 | expC | 30 | 0.008 | 0.016 |
| 0.030 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.517 | expC | 30 | 0.548 | 0.579 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.006 | expC | 30 | 0.016 | 0.040 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.011 | expC | 30 | 0.024 | 0.051 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.137 | expC | 30 | 0.158 | 0.182 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.128 | expC | 30 | 0.220 | 0.352 |
| 0.030 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.000 | expC | 30 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.031 | expC | 30 | 0.052 | 0.087 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.069 | expC | 30 | 0.100 | 0.143 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.098 | expC | 30 | 0.180 | 0.308 |
| 0.030 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.065 | expC | 30 | 0.096 | 0.139 |
| 0.030 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.177 | expC | 30 | 0.224 | 0.280 |
| 0.030 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.501 | expC | 30 | 0.640 | 0.759 |
| 0.030 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.542 | expC | 30 | 0.680 | 0.792 |
| 0.030 | D small_world seed=random | 250 | 0.500 | 0.006 | expD | 30 | 0.016 | 0.040 |
| 0.030 | D power_law seed=random | 250 | 0.500 | 0.134 | expD | 30 | 0.176 | 0.228 |
| 0.030 | D small_world seed=high_degree | 250 | 0.500 | 0.099 | expD | 30 | 0.136 | 0.184 |
| 0.030 | D power_law seed=high_degree | 1000 | 0.500 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.030 | D small_world seed=bridge | 1000 | 0.500 | 0.118 | expD | 30 | 0.138 | 0.161 |
| 0.030 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.030 | D small_world seed=clustered | 250 | 0.500 | 0.001 | expD | 30 | 0.004 | 0.022 |
| 0.030 | D power_law seed=clustered | 250 | 0.500 | 0.407 | expD | 30 | 0.468 | 0.530 |
| 0.030 | E seed=random pioneer=random | 1000 | 0.500 | 0.018 | expE | 30 | 0.026 | 0.038 |
| 0.030 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.831 | expE | 30 | 0.854 | 0.875 |
| 0.030 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.214 | expE | 30 | 0.239 | 0.266 |
| 0.030 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.924 | expE | 30 | 0.940 | 0.953 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.016 | robustness | 30 | 0.032 | 0.062 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.099 | robustness | 30 | 0.136 | 0.184 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.092 | robustness | 30 | 0.128 | 0.175 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.113 | robustness | 30 | 0.152 | 0.202 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.006 | robustness | 30 | 0.016 | 0.040 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.016 | robustness | 30 | 0.032 | 0.062 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.002 | robustness | 30 | 0.008 | 0.029 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.006 | robustness | 30 | 0.016 | 0.040 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.312 | robustness | 30 | 0.440 | 0.577 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.006 | robustness | 30 | 0.016 | 0.040 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.162 | robustness | 30 | 0.208 | 0.263 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.011 | robustness | 30 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.059 | robustness | 30 | 0.088 | 0.130 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.037 | robustness | 30 | 0.060 | 0.097 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.006 | robustness | 30 | 0.016 | 0.040 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.002 | robustness | 30 | 0.008 | 0.029 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.028 | robustness | 30 | 0.048 | 0.082 |
| 0.010 | A hazard | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.010 | A frequency-based | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.010 | A success-based | 1000 | 0.500 | 0.990 | expA | 45 | 0.996 | 0.998 |
| 0.010 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.021 | expB | 45 | 0.060 | 0.162 |
| 0.010 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.610 | expB | 45 | 0.640 | 0.669 |
| 0.010 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.843 | expB | 45 | 0.888 | 0.921 |
| 0.010 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.010 | B power_law beta=missing m=2 | 250 | 0.500 | 0.514 | expB | 45 | 0.576 | 0.636 |
| 0.010 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.010 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 45 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.865 | expB | 45 | 0.960 | 0.989 |
| 0.010 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.812 | expB | 45 | 0.920 | 0.968 |
| 0.010 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.903 | expB | 45 | 0.940 | 0.963 |
| 0.010 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.305 | expC | 45 | 0.334 | 0.364 |
| 0.010 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.435 | expC | 45 | 0.466 | 0.497 |
| 0.010 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.987 | expC | 45 | 0.994 | 0.997 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.474 | expC | 45 | 0.536 | 0.597 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.682 | expC | 45 | 0.740 | 0.790 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.914 | expC | 45 | 0.931 | 0.945 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.895 | expC | 45 | 0.980 | 0.996 |
| 0.010 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.010 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.010 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.089 | expC | 45 | 0.124 | 0.171 |
| 0.010 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.349 | expC | 45 | 0.408 | 0.470 |
| 0.010 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.376 | expC | 45 | 0.436 | 0.498 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.391 | expC | 45 | 0.452 | 0.514 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.737 | expC | 45 | 0.792 | 0.838 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.903 | expC | 45 | 0.940 | 0.963 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.895 | expC | 45 | 0.980 | 0.996 |
| 0.010 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.682 | expC | 45 | 0.740 | 0.790 |
| 0.010 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.843 | expC | 45 | 0.888 | 0.921 |
| 0.010 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.010 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.010 | D small_world seed=random | 250 | 0.500 | 0.530 | expD | 45 | 0.592 | 0.651 |
| 0.010 | D power_law seed=random | 250 | 0.500 | 0.277 | expD | 45 | 0.332 | 0.393 |
| 0.010 | D small_world seed=high_degree | 250 | 0.500 | 0.903 | expD | 45 | 0.940 | 0.963 |
| 0.010 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.010 | D small_world seed=bridge | 1000 | 0.500 | 0.947 | expD | 45 | 0.961 | 0.971 |
| 0.010 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.010 | D small_world seed=clustered | 250 | 0.500 | 0.199 | expD | 45 | 0.248 | 0.305 |
| 0.010 | D power_law seed=clustered | 250 | 0.500 | 0.571 | expD | 45 | 0.632 | 0.689 |
| 0.010 | E seed=random pioneer=random | 1000 | 0.500 | 0.623 | expE | 45 | 0.653 | 0.682 |
| 0.010 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.010 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.960 | expE | 45 | 0.972 | 0.981 |
| 0.010 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.159 | robustness | 45 | 0.260 | 0.396 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.716 | robustness | 45 | 0.772 | 0.820 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.923 | robustness | 45 | 0.956 | 0.975 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.032 | robustness | 45 | 0.080 | 0.188 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.870 | robustness | 45 | 0.912 | 0.941 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.866 | robustness | 45 | 0.908 | 0.938 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.583 | robustness | 45 | 0.644 | 0.701 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.603 | robustness | 45 | 0.664 | 0.720 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.554 | robustness | 45 | 0.616 | 0.674 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.032 | robustness | 45 | 0.080 | 0.188 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.056 | robustness | 45 | 0.120 | 0.238 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.571 | robustness | 45 | 0.632 | 0.689 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.838 | robustness | 45 | 0.940 | 0.979 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.563 | robustness | 45 | 0.624 | 0.682 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.742 | robustness | 45 | 0.796 | 0.841 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.534 | robustness | 45 | 0.596 | 0.655 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.825 | robustness | 45 | 0.872 | 0.908 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.847 | robustness | 45 | 0.892 | 0.925 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.498 | robustness | 45 | 0.560 | 0.620 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.567 | robustness | 45 | 0.628 | 0.686 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.534 | robustness | 45 | 0.596 | 0.655 |
| 0.015 | A hazard | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.015 | A frequency-based | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.015 | A success-based | 1000 | 0.500 | 0.990 | expA | 45 | 0.996 | 0.998 |
| 0.015 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.021 | expB | 45 | 0.060 | 0.162 |
| 0.015 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.610 | expB | 45 | 0.640 | 0.669 |
| 0.015 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.843 | expB | 45 | 0.888 | 0.921 |
| 0.015 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.015 | B power_law beta=missing m=2 | 250 | 0.500 | 0.514 | expB | 45 | 0.576 | 0.636 |
| 0.015 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.015 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 45 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.865 | expB | 45 | 0.960 | 0.989 |
| 0.015 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.812 | expB | 45 | 0.920 | 0.968 |
| 0.015 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.903 | expB | 45 | 0.940 | 0.963 |
| 0.015 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.304 | expC | 45 | 0.332 | 0.362 |
| 0.015 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.434 | expC | 45 | 0.465 | 0.496 |
| 0.015 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.987 | expC | 45 | 0.994 | 0.997 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.470 | expC | 45 | 0.532 | 0.593 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.682 | expC | 45 | 0.740 | 0.790 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.914 | expC | 45 | 0.931 | 0.945 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.895 | expC | 45 | 0.980 | 0.996 |
| 0.015 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.015 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.015 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.085 | expC | 45 | 0.120 | 0.166 |
| 0.015 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.349 | expC | 45 | 0.408 | 0.470 |
| 0.015 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.376 | expC | 45 | 0.436 | 0.498 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.391 | expC | 45 | 0.452 | 0.514 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.737 | expC | 45 | 0.792 | 0.838 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.903 | expC | 45 | 0.940 | 0.963 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.895 | expC | 45 | 0.980 | 0.996 |
| 0.015 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.682 | expC | 45 | 0.740 | 0.790 |
| 0.015 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.843 | expC | 45 | 0.888 | 0.921 |
| 0.015 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.015 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.015 | D small_world seed=random | 250 | 0.500 | 0.530 | expD | 45 | 0.592 | 0.651 |
| 0.015 | D power_law seed=random | 250 | 0.500 | 0.277 | expD | 45 | 0.332 | 0.393 |
| 0.015 | D small_world seed=high_degree | 250 | 0.500 | 0.903 | expD | 45 | 0.940 | 0.963 |
| 0.015 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.015 | D small_world seed=bridge | 1000 | 0.500 | 0.947 | expD | 45 | 0.961 | 0.971 |
| 0.015 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.015 | D small_world seed=clustered | 250 | 0.500 | 0.199 | expD | 45 | 0.248 | 0.305 |
| 0.015 | D power_law seed=clustered | 250 | 0.500 | 0.571 | expD | 45 | 0.632 | 0.689 |
| 0.015 | E seed=random pioneer=random | 1000 | 0.500 | 0.623 | expE | 45 | 0.653 | 0.682 |
| 0.015 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.015 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.960 | expE | 45 | 0.972 | 0.981 |
| 0.015 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.159 | robustness | 45 | 0.260 | 0.396 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.716 | robustness | 45 | 0.772 | 0.820 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.923 | robustness | 45 | 0.956 | 0.975 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.032 | robustness | 45 | 0.080 | 0.188 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.870 | robustness | 45 | 0.912 | 0.941 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.866 | robustness | 45 | 0.908 | 0.938 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.583 | robustness | 45 | 0.644 | 0.701 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.603 | robustness | 45 | 0.664 | 0.720 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.554 | robustness | 45 | 0.616 | 0.674 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.032 | robustness | 45 | 0.080 | 0.188 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.056 | robustness | 45 | 0.120 | 0.238 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.571 | robustness | 45 | 0.632 | 0.689 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.838 | robustness | 45 | 0.940 | 0.979 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.563 | robustness | 45 | 0.624 | 0.682 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.742 | robustness | 45 | 0.796 | 0.841 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.530 | robustness | 45 | 0.592 | 0.651 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.825 | robustness | 45 | 0.872 | 0.908 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.847 | robustness | 45 | 0.892 | 0.925 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.498 | robustness | 45 | 0.560 | 0.620 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.567 | robustness | 45 | 0.628 | 0.686 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.534 | robustness | 45 | 0.596 | 0.655 |
| 0.020 | A hazard | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.020 | A frequency-based | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.020 | A success-based | 1000 | 0.500 | 0.980 | expA | 45 | 0.989 | 0.994 |
| 0.020 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.021 | expB | 45 | 0.060 | 0.162 |
| 0.020 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.453 | expB | 45 | 0.484 | 0.515 |
| 0.020 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.798 | expB | 45 | 0.848 | 0.887 |
| 0.020 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.020 | B power_law beta=missing m=2 | 250 | 0.500 | 0.514 | expB | 45 | 0.576 | 0.636 |
| 0.020 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.020 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 45 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.865 | expB | 45 | 0.960 | 0.989 |
| 0.020 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.812 | expB | 45 | 0.920 | 0.968 |
| 0.020 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.903 | expB | 45 | 0.940 | 0.963 |
| 0.020 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.176 | expC | 45 | 0.200 | 0.226 |
| 0.020 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.334 | expC | 45 | 0.363 | 0.393 |
| 0.020 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.979 | expC | 45 | 0.988 | 0.993 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.318 | expC | 45 | 0.376 | 0.437 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.530 | expC | 45 | 0.592 | 0.651 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.836 | expC | 45 | 0.859 | 0.879 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.865 | expC | 45 | 0.960 | 0.989 |
| 0.020 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.020 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.020 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.025 | expC | 45 | 0.044 | 0.077 |
| 0.020 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.134 | expC | 45 | 0.176 | 0.228 |
| 0.020 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.247 | expC | 45 | 0.300 | 0.359 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.213 | expC | 45 | 0.264 | 0.322 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.575 | expC | 45 | 0.636 | 0.693 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.794 | expC | 45 | 0.844 | 0.884 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.838 | expC | 45 | 0.940 | 0.979 |
| 0.020 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.649 | expC | 45 | 0.708 | 0.761 |
| 0.020 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.820 | expC | 45 | 0.868 | 0.904 |
| 0.020 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.020 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.020 | D small_world seed=random | 250 | 0.500 | 0.407 | expD | 45 | 0.468 | 0.530 |
| 0.020 | D power_law seed=random | 250 | 0.500 | 0.277 | expD | 45 | 0.332 | 0.393 |
| 0.020 | D small_world seed=high_degree | 250 | 0.500 | 0.812 | expD | 45 | 0.860 | 0.898 |
| 0.020 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.020 | D small_world seed=bridge | 1000 | 0.500 | 0.862 | expD | 45 | 0.883 | 0.901 |
| 0.020 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.020 | D small_world seed=clustered | 250 | 0.500 | 0.120 | expD | 45 | 0.160 | 0.211 |
| 0.020 | D power_law seed=clustered | 250 | 0.500 | 0.571 | expD | 45 | 0.632 | 0.689 |
| 0.020 | E seed=random pioneer=random | 1000 | 0.500 | 0.476 | expE | 45 | 0.507 | 0.538 |
| 0.020 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.020 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.902 | expE | 45 | 0.920 | 0.935 |
| 0.020 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.032 | robustness | 45 | 0.080 | 0.188 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.542 | robustness | 45 | 0.604 | 0.663 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.847 | robustness | 45 | 0.892 | 0.925 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.021 | robustness | 45 | 0.060 | 0.162 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.803 | robustness | 45 | 0.852 | 0.891 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.776 | robustness | 45 | 0.828 | 0.870 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.391 | robustness | 45 | 0.452 | 0.514 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.454 | robustness | 45 | 0.516 | 0.577 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.399 | robustness | 45 | 0.460 | 0.522 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.011 | robustness | 45 | 0.040 | 0.135 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.021 | robustness | 45 | 0.060 | 0.162 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.431 | robustness | 45 | 0.492 | 0.554 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.812 | robustness | 45 | 0.920 | 0.968 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.399 | robustness | 45 | 0.460 | 0.522 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.729 | robustness | 45 | 0.784 | 0.831 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.360 | robustness | 45 | 0.420 | 0.482 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.729 | robustness | 45 | 0.784 | 0.831 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.746 | robustness | 45 | 0.800 | 0.845 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.345 | robustness | 45 | 0.404 | 0.466 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.407 | robustness | 45 | 0.468 | 0.530 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.486 | robustness | 45 | 0.548 | 0.609 |
| 0.025 | A hazard | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.025 | A frequency-based | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.025 | A success-based | 1000 | 0.500 | 0.872 | expA | 45 | 0.893 | 0.911 |
| 0.025 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.132 | expB | 45 | 0.153 | 0.177 |
| 0.025 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.546 | expB | 45 | 0.608 | 0.666 |
| 0.025 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.583 | expB | 45 | 0.720 | 0.825 |
| 0.025 | B power_law beta=missing m=2 | 250 | 0.500 | 0.506 | expB | 45 | 0.568 | 0.628 |
| 0.025 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.786 | expB | 45 | 0.900 | 0.957 |
| 0.025 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 45 | 0.980 | 0.996 |
| 0.025 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.025 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.738 | expB | 45 | 0.860 | 0.930 |
| 0.025 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.838 | expB | 45 | 0.884 | 0.918 |
| 0.025 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.027 | expC | 45 | 0.037 | 0.051 |
| 0.025 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.087 | expC | 45 | 0.105 | 0.126 |
| 0.025 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.850 | expC | 45 | 0.872 | 0.891 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.085 | expC | 45 | 0.120 | 0.166 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.162 | expC | 45 | 0.208 | 0.263 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.466 | expC | 45 | 0.497 | 0.528 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.462 | expC | 45 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.015 |
| 0.025 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.016 | expC | 45 | 0.032 | 0.062 |
| 0.025 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.062 | expC | 45 | 0.092 | 0.134 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.009 | expC | 45 | 0.020 | 0.046 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.199 | expC | 45 | 0.248 | 0.305 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.419 | expC | 45 | 0.480 | 0.542 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.482 | expC | 45 | 0.620 | 0.741 |
| 0.025 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.431 | expC | 45 | 0.492 | 0.554 |
| 0.025 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.567 | expC | 45 | 0.628 | 0.686 |
| 0.025 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.838 | expC | 45 | 0.940 | 0.979 |
| 0.025 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.838 | expC | 45 | 0.940 | 0.979 |
| 0.025 | D small_world seed=random | 250 | 0.500 | 0.099 | expD | 45 | 0.136 | 0.184 |
| 0.025 | D power_law seed=random | 250 | 0.500 | 0.265 | expD | 45 | 0.320 | 0.380 |
| 0.025 | D small_world seed=high_degree | 250 | 0.500 | 0.415 | expD | 45 | 0.476 | 0.538 |
| 0.025 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.025 | D small_world seed=bridge | 1000 | 0.500 | 0.465 | expD | 45 | 0.496 | 0.527 |
| 0.025 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.025 | D small_world seed=clustered | 250 | 0.500 | 0.019 | expD | 45 | 0.036 | 0.067 |
| 0.025 | D power_law seed=clustered | 250 | 0.500 | 0.571 | expD | 45 | 0.632 | 0.689 |
| 0.025 | E seed=random pioneer=random | 1000 | 0.500 | 0.156 | expE | 45 | 0.179 | 0.204 |
| 0.025 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.974 | expE | 45 | 0.984 | 0.990 |
| 0.025 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.593 | expE | 45 | 0.623 | 0.653 |
| 0.025 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.990 | expE | 45 | 0.996 | 0.998 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.134 | robustness | 45 | 0.176 | 0.228 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.450 | robustness | 45 | 0.512 | 0.573 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.466 | robustness | 45 | 0.528 | 0.589 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.435 | robustness | 45 | 0.496 | 0.558 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.082 | robustness | 45 | 0.116 | 0.162 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.141 | robustness | 45 | 0.184 | 0.237 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.120 | robustness | 45 | 0.160 | 0.211 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.004 | robustness | 45 | 0.020 | 0.105 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.011 | robustness | 45 | 0.040 | 0.135 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.113 | robustness | 45 | 0.152 | 0.202 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.562 | robustness | 45 | 0.700 | 0.809 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.116 | robustness | 45 | 0.156 | 0.206 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.502 | robustness | 45 | 0.564 | 0.624 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.092 | robustness | 45 | 0.128 | 0.175 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.307 | robustness | 45 | 0.364 | 0.425 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.269 | robustness | 45 | 0.324 | 0.384 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.085 | robustness | 45 | 0.120 | 0.166 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.120 | robustness | 45 | 0.160 | 0.211 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.173 | robustness | 45 | 0.220 | 0.275 |
| 0.030 | A hazard | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.030 | A frequency-based | 50 | 0.500 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.030 | A success-based | 1000 | 0.500 | 0.574 | expA | 45 | 0.605 | 0.635 |
| 0.030 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.020 | expB | 45 | 0.029 | 0.041 |
| 0.030 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.202 | expB | 45 | 0.252 | 0.309 |
| 0.030 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.208 | expB | 45 | 0.320 | 0.458 |
| 0.030 | B power_law beta=missing m=2 | 250 | 0.500 | 0.466 | expB | 45 | 0.528 | 0.589 |
| 0.030 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.542 | expB | 45 | 0.680 | 0.792 |
| 0.030 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.604 | expB | 45 | 0.740 | 0.841 |
| 0.030 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.501 | expB | 45 | 0.640 | 0.759 |
| 0.030 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.522 | expB | 45 | 0.660 | 0.776 |
| 0.030 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.649 | expB | 45 | 0.708 | 0.761 |
| 0.030 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.002 | expC | 45 | 0.005 | 0.012 |
| 0.030 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.008 | expC | 45 | 0.013 | 0.022 |
| 0.030 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.535 | expC | 45 | 0.566 | 0.596 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.009 | expC | 45 | 0.020 | 0.046 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.011 | expC | 45 | 0.024 | 0.051 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.156 | expC | 45 | 0.179 | 0.204 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.128 | expC | 45 | 0.220 | 0.352 |
| 0.030 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.002 | expC | 45 | 0.008 | 0.029 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.000 | expC | 45 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.034 | expC | 45 | 0.056 | 0.092 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.075 | expC | 45 | 0.108 | 0.153 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.098 | expC | 45 | 0.180 | 0.308 |
| 0.030 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.130 | expC | 45 | 0.172 | 0.224 |
| 0.030 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.232 | expC | 45 | 0.284 | 0.343 |
| 0.030 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.522 | expC | 45 | 0.660 | 0.776 |
| 0.030 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.542 | expC | 45 | 0.680 | 0.792 |
| 0.030 | D small_world seed=random | 250 | 0.500 | 0.011 | expD | 45 | 0.024 | 0.051 |
| 0.030 | D power_law seed=random | 250 | 0.500 | 0.228 | expD | 45 | 0.280 | 0.339 |
| 0.030 | D small_world seed=high_degree | 250 | 0.500 | 0.099 | expD | 45 | 0.136 | 0.184 |
| 0.030 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.030 | D small_world seed=bridge | 1000 | 0.500 | 0.124 | expD | 45 | 0.144 | 0.167 |
| 0.030 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.030 | D small_world seed=clustered | 250 | 0.500 | 0.002 | expD | 45 | 0.008 | 0.029 |
| 0.030 | D power_law seed=clustered | 250 | 0.500 | 0.530 | expD | 45 | 0.592 | 0.651 |
| 0.030 | E seed=random pioneer=random | 1000 | 0.500 | 0.019 | expE | 45 | 0.028 | 0.040 |
| 0.030 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.831 | expE | 45 | 0.854 | 0.875 |
| 0.030 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.217 | expE | 45 | 0.243 | 0.271 |
| 0.030 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.924 | expE | 45 | 0.940 | 0.953 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.019 | robustness | 45 | 0.036 | 0.067 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.120 | robustness | 45 | 0.160 | 0.211 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.116 | robustness | 45 | 0.156 | 0.206 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.144 | robustness | 45 | 0.188 | 0.241 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.009 | robustness | 45 | 0.020 | 0.046 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.016 | robustness | 45 | 0.032 | 0.062 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.004 | robustness | 45 | 0.012 | 0.035 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.011 | robustness | 45 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.312 | robustness | 45 | 0.440 | 0.577 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.009 | robustness | 45 | 0.020 | 0.046 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.221 | robustness | 45 | 0.272 | 0.330 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.019 | robustness | 45 | 0.036 | 0.067 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.069 | robustness | 45 | 0.100 | 0.143 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.049 | robustness | 45 | 0.076 | 0.116 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.011 | robustness | 45 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.004 | robustness | 45 | 0.012 | 0.035 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.034 | robustness | 45 | 0.056 | 0.092 |
| 0.010 | A hazard | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.010 | A frequency-based | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.010 | A success-based | 1000 | 0.500 | 0.996 | expA | 60 | 1.000 | 1.000 |
| 0.010 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.083 | expB | 60 | 0.160 | 0.285 |
| 0.010 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.824 | expB | 60 | 0.848 | 0.869 |
| 0.010 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.923 | expB | 60 | 0.956 | 0.975 |
| 0.010 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.865 | expB | 60 | 0.960 | 0.989 |
| 0.010 | B power_law beta=missing m=2 | 250 | 0.500 | 0.666 | expB | 60 | 0.724 | 0.776 |
| 0.010 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.965 | expB | 60 | 0.988 | 0.996 |
| 0.010 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.625 | expC | 60 | 0.655 | 0.684 |
| 0.010 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.762 | expC | 60 | 0.788 | 0.812 |
| 0.010 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.996 | expC | 60 | 1.000 | 1.000 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.733 | expC | 60 | 0.788 | 0.834 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.884 | expC | 60 | 0.924 | 0.951 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.980 | expC | 60 | 0.989 | 0.994 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.895 | expC | 60 | 0.980 | 0.996 |
| 0.010 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.004 | expC | 60 | 0.020 | 0.105 |
| 0.010 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.011 | expC | 60 | 0.040 | 0.135 |
| 0.010 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.112 | expC | 60 | 0.200 | 0.330 |
| 0.010 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.380 | expC | 60 | 0.440 | 0.502 |
| 0.010 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.641 | expC | 60 | 0.700 | 0.753 |
| 0.010 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.591 | expC | 60 | 0.652 | 0.708 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.712 | expC | 60 | 0.768 | 0.816 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.928 | expC | 60 | 0.960 | 0.978 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.965 | expC | 60 | 0.988 | 0.996 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.895 | expC | 60 | 0.980 | 0.996 |
| 0.010 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.908 | expC | 60 | 0.944 | 0.966 |
| 0.010 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.933 | expC | 60 | 0.964 | 0.981 |
| 0.010 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.010 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.010 | D small_world seed=random | 250 | 0.500 | 0.785 | expD | 60 | 0.836 | 0.877 |
| 0.010 | D power_law seed=random | 250 | 0.500 | 0.388 | expD | 60 | 0.448 | 0.510 |
| 0.010 | D small_world seed=high_degree | 250 | 0.500 | 0.978 | expD | 60 | 0.996 | 0.999 |
| 0.010 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.010 | D small_world seed=bridge | 1000 | 0.500 | 0.988 | expD | 60 | 0.995 | 0.998 |
| 0.010 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.010 | D small_world seed=clustered | 250 | 0.500 | 0.403 | expD | 60 | 0.464 | 0.526 |
| 0.010 | D power_law seed=clustered | 250 | 0.500 | 0.661 | expD | 60 | 0.720 | 0.772 |
| 0.010 | E seed=random pioneer=random | 1000 | 0.500 | 0.854 | expE | 60 | 0.876 | 0.895 |
| 0.010 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.010 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.986 | expE | 60 | 0.993 | 0.997 |
| 0.010 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.011 | robustness | 60 | 0.040 | 0.135 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.562 | robustness | 60 | 0.700 | 0.809 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.918 | robustness | 60 | 0.952 | 0.972 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.971 | robustness | 60 | 0.992 | 0.998 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.128 | robustness | 60 | 0.220 | 0.352 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.978 | robustness | 60 | 0.996 | 0.999 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.954 | robustness | 60 | 0.980 | 0.991 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.803 | robustness | 60 | 0.852 | 0.891 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.847 | robustness | 60 | 0.892 | 0.925 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.807 | robustness | 60 | 0.856 | 0.894 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.175 | robustness | 60 | 0.280 | 0.417 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.259 | robustness | 60 | 0.380 | 0.518 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.807 | robustness | 60 | 0.856 | 0.894 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.816 | robustness | 60 | 0.864 | 0.901 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.884 | robustness | 60 | 0.924 | 0.951 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.794 | robustness | 60 | 0.844 | 0.884 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.960 | robustness | 60 | 0.984 | 0.994 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.954 | robustness | 60 | 0.980 | 0.991 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.816 | robustness | 60 | 0.864 | 0.901 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.798 | robustness | 60 | 0.848 | 0.887 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.785 | robustness | 60 | 0.836 | 0.877 |
| 0.015 | A hazard | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.015 | A frequency-based | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.015 | A success-based | 1000 | 0.500 | 0.996 | expA | 60 | 1.000 | 1.000 |
| 0.015 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.070 | expB | 60 | 0.140 | 0.262 |
| 0.015 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.799 | expB | 60 | 0.824 | 0.846 |
| 0.015 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.918 | expB | 60 | 0.952 | 0.972 |
| 0.015 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.865 | expB | 60 | 0.960 | 0.989 |
| 0.015 | B power_law beta=missing m=2 | 250 | 0.500 | 0.666 | expB | 60 | 0.724 | 0.776 |
| 0.015 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.965 | expB | 60 | 0.988 | 0.996 |
| 0.015 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.577 | expC | 60 | 0.608 | 0.638 |
| 0.015 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.747 | expC | 60 | 0.774 | 0.799 |
| 0.015 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.996 | expC | 60 | 1.000 | 1.000 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.712 | expC | 60 | 0.768 | 0.816 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.852 | expC | 60 | 0.896 | 0.928 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.978 | expC | 60 | 0.987 | 0.992 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.895 | expC | 60 | 0.980 | 0.996 |
| 0.015 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.011 | expC | 60 | 0.040 | 0.135 |
| 0.015 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.098 | expC | 60 | 0.180 | 0.308 |
| 0.015 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.330 | expC | 60 | 0.388 | 0.450 |
| 0.015 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.612 | expC | 60 | 0.672 | 0.727 |
| 0.015 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.579 | expC | 60 | 0.640 | 0.697 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.691 | expC | 60 | 0.748 | 0.798 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.889 | expC | 60 | 0.928 | 0.954 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.960 | expC | 60 | 0.984 | 0.994 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.895 | expC | 60 | 0.980 | 0.996 |
| 0.015 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.908 | expC | 60 | 0.944 | 0.966 |
| 0.015 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.933 | expC | 60 | 0.964 | 0.981 |
| 0.015 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.015 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.015 | D small_world seed=random | 250 | 0.500 | 0.759 | expD | 60 | 0.812 | 0.856 |
| 0.015 | D power_law seed=random | 250 | 0.500 | 0.388 | expD | 60 | 0.448 | 0.510 |
| 0.015 | D small_world seed=high_degree | 250 | 0.500 | 0.978 | expD | 60 | 0.996 | 0.999 |
| 0.015 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.015 | D small_world seed=bridge | 1000 | 0.500 | 0.983 | expD | 60 | 0.991 | 0.995 |
| 0.015 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.015 | D small_world seed=clustered | 250 | 0.500 | 0.384 | expD | 60 | 0.444 | 0.506 |
| 0.015 | D power_law seed=clustered | 250 | 0.500 | 0.661 | expD | 60 | 0.720 | 0.772 |
| 0.015 | E seed=random pioneer=random | 1000 | 0.500 | 0.837 | expE | 60 | 0.860 | 0.880 |
| 0.015 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.015 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.986 | expE | 60 | 0.993 | 0.997 |
| 0.015 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.011 | robustness | 60 | 0.040 | 0.135 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.482 | robustness | 60 | 0.620 | 0.741 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.894 | robustness | 60 | 0.932 | 0.957 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.965 | robustness | 60 | 0.988 | 0.996 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.128 | robustness | 60 | 0.220 | 0.352 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.978 | robustness | 60 | 0.996 | 0.999 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.954 | robustness | 60 | 0.980 | 0.991 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.785 | robustness | 60 | 0.836 | 0.877 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.820 | robustness | 60 | 0.868 | 0.904 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.785 | robustness | 60 | 0.836 | 0.877 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.143 | robustness | 60 | 0.240 | 0.374 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.259 | robustness | 60 | 0.380 | 0.518 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.781 | robustness | 60 | 0.832 | 0.873 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.789 | robustness | 60 | 0.840 | 0.880 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.884 | robustness | 60 | 0.924 | 0.951 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.759 | robustness | 60 | 0.812 | 0.856 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.938 | robustness | 60 | 0.968 | 0.984 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.954 | robustness | 60 | 0.980 | 0.991 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.789 | robustness | 60 | 0.840 | 0.880 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.794 | robustness | 60 | 0.844 | 0.884 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.772 | robustness | 60 | 0.824 | 0.866 |
| 0.020 | A hazard | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.020 | A frequency-based | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.020 | A success-based | 1000 | 0.500 | 0.982 | expA | 60 | 0.990 | 0.995 |
| 0.020 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.021 | expB | 60 | 0.060 | 0.162 |
| 0.020 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.506 | expB | 60 | 0.537 | 0.568 |
| 0.020 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.834 | expB | 60 | 0.880 | 0.915 |
| 0.020 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.865 | expB | 60 | 0.960 | 0.989 |
| 0.020 | B power_law beta=missing m=2 | 250 | 0.500 | 0.661 | expB | 60 | 0.720 | 0.772 |
| 0.020 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.965 | expB | 60 | 0.988 | 0.996 |
| 0.020 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.225 | expC | 60 | 0.251 | 0.279 |
| 0.020 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.425 | expC | 60 | 0.456 | 0.487 |
| 0.020 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.984 | expC | 60 | 0.992 | 0.996 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.364 | expC | 60 | 0.424 | 0.486 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.567 | expC | 60 | 0.628 | 0.686 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.861 | expC | 60 | 0.882 | 0.901 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.865 | expC | 60 | 0.960 | 0.989 |
| 0.020 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.004 | expC | 60 | 0.020 | 0.105 |
| 0.020 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.004 | expC | 60 | 0.020 | 0.105 |
| 0.020 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.056 | expC | 60 | 0.084 | 0.125 |
| 0.020 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.159 | expC | 60 | 0.204 | 0.258 |
| 0.020 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.326 | expC | 60 | 0.384 | 0.446 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.239 | expC | 60 | 0.292 | 0.351 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.616 | expC | 60 | 0.676 | 0.731 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.803 | expC | 60 | 0.852 | 0.891 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.838 | expC | 60 | 0.940 | 0.979 |
| 0.020 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.763 | expC | 60 | 0.816 | 0.859 |
| 0.020 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.880 | expC | 60 | 0.920 | 0.948 |
| 0.020 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.020 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.020 | D small_world seed=random | 250 | 0.500 | 0.454 | expD | 60 | 0.516 | 0.577 |
| 0.020 | D power_law seed=random | 250 | 0.500 | 0.388 | expD | 60 | 0.448 | 0.510 |
| 0.020 | D small_world seed=high_degree | 250 | 0.500 | 0.843 | expD | 60 | 0.888 | 0.921 |
| 0.020 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.020 | D small_world seed=bridge | 1000 | 0.500 | 0.870 | expD | 60 | 0.891 | 0.909 |
| 0.020 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.020 | D small_world seed=clustered | 250 | 0.500 | 0.148 | expD | 60 | 0.192 | 0.245 |
| 0.020 | D power_law seed=clustered | 250 | 0.500 | 0.661 | expD | 60 | 0.720 | 0.772 |
| 0.020 | E seed=random pioneer=random | 1000 | 0.500 | 0.538 | expE | 60 | 0.569 | 0.599 |
| 0.020 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.020 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.912 | expE | 60 | 0.930 | 0.944 |
| 0.020 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.112 | robustness | 60 | 0.200 | 0.330 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.587 | robustness | 60 | 0.648 | 0.705 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.861 | robustness | 60 | 0.904 | 0.935 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.021 | robustness | 60 | 0.060 | 0.162 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.847 | robustness | 60 | 0.892 | 0.925 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.807 | robustness | 60 | 0.856 | 0.894 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.431 | robustness | 60 | 0.492 | 0.554 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.514 | robustness | 60 | 0.576 | 0.636 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.466 | robustness | 60 | 0.528 | 0.589 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.032 | robustness | 60 | 0.080 | 0.188 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.043 | robustness | 60 | 0.100 | 0.214 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.494 | robustness | 60 | 0.556 | 0.616 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.838 | robustness | 60 | 0.940 | 0.979 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.454 | robustness | 60 | 0.516 | 0.577 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.816 | robustness | 60 | 0.864 | 0.901 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.423 | robustness | 60 | 0.484 | 0.546 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.763 | robustness | 60 | 0.816 | 0.859 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.798 | robustness | 60 | 0.848 | 0.887 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.423 | robustness | 60 | 0.484 | 0.546 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.446 | robustness | 60 | 0.508 | 0.569 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.587 | robustness | 60 | 0.648 | 0.705 |
| 0.025 | A hazard | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.025 | A frequency-based | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.025 | A success-based | 1000 | 0.500 | 0.872 | expA | 60 | 0.893 | 0.911 |
| 0.025 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.135 | expB | 60 | 0.156 | 0.180 |
| 0.025 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.563 | expB | 60 | 0.624 | 0.682 |
| 0.025 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.604 | expB | 60 | 0.740 | 0.841 |
| 0.025 | B power_law beta=missing m=2 | 250 | 0.500 | 0.636 | expB | 60 | 0.696 | 0.750 |
| 0.025 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.812 | expB | 60 | 0.920 | 0.968 |
| 0.025 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.025 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.865 | expB | 60 | 0.960 | 0.989 |
| 0.025 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.786 | expB | 60 | 0.900 | 0.957 |
| 0.025 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.870 | expB | 60 | 0.912 | 0.941 |
| 0.025 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.033 | expC | 60 | 0.044 | 0.059 |
| 0.025 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.097 | expC | 60 | 0.115 | 0.136 |
| 0.025 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.853 | expC | 60 | 0.875 | 0.894 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.089 | expC | 60 | 0.124 | 0.171 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.162 | expC | 60 | 0.208 | 0.263 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.468 | expC | 60 | 0.499 | 0.530 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.462 | expC | 60 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.015 |
| 0.025 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.016 | expC | 60 | 0.032 | 0.062 |
| 0.025 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.069 | expC | 60 | 0.100 | 0.143 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.009 | expC | 60 | 0.020 | 0.046 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.213 | expC | 60 | 0.264 | 0.322 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.423 | expC | 60 | 0.484 | 0.546 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.482 | expC | 60 | 0.620 | 0.741 |
| 0.025 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.458 | expC | 60 | 0.520 | 0.581 |
| 0.025 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.583 | expC | 60 | 0.644 | 0.701 |
| 0.025 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.838 | expC | 60 | 0.940 | 0.979 |
| 0.025 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.838 | expC | 60 | 0.940 | 0.979 |
| 0.025 | D small_world seed=random | 250 | 0.500 | 0.102 | expD | 60 | 0.140 | 0.188 |
| 0.025 | D power_law seed=random | 250 | 0.500 | 0.357 | expD | 60 | 0.416 | 0.478 |
| 0.025 | D small_world seed=high_degree | 250 | 0.500 | 0.415 | expD | 60 | 0.476 | 0.538 |
| 0.025 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.025 | D small_world seed=bridge | 1000 | 0.500 | 0.466 | expD | 60 | 0.497 | 0.528 |
| 0.025 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.025 | D small_world seed=clustered | 250 | 0.500 | 0.022 | expD | 60 | 0.040 | 0.072 |
| 0.025 | D power_law seed=clustered | 250 | 0.500 | 0.653 | expD | 60 | 0.712 | 0.765 |
| 0.025 | E seed=random pioneer=random | 1000 | 0.500 | 0.165 | expE | 60 | 0.188 | 0.213 |
| 0.025 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.974 | expE | 60 | 0.984 | 0.990 |
| 0.025 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.593 | expE | 60 | 0.623 | 0.653 |
| 0.025 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.990 | expE | 60 | 0.996 | 0.998 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.137 | robustness | 60 | 0.180 | 0.232 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.458 | robustness | 60 | 0.520 | 0.581 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.474 | robustness | 60 | 0.536 | 0.597 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.435 | robustness | 60 | 0.496 | 0.558 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.085 | robustness | 60 | 0.120 | 0.166 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.141 | robustness | 60 | 0.184 | 0.237 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.130 | robustness | 60 | 0.172 | 0.224 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.004 | robustness | 60 | 0.020 | 0.105 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.021 | robustness | 60 | 0.060 | 0.162 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.113 | robustness | 60 | 0.152 | 0.202 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.562 | robustness | 60 | 0.700 | 0.809 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.120 | robustness | 60 | 0.160 | 0.211 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.514 | robustness | 60 | 0.576 | 0.636 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.096 | robustness | 60 | 0.132 | 0.180 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.307 | robustness | 60 | 0.364 | 0.425 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.273 | robustness | 60 | 0.328 | 0.388 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.096 | robustness | 60 | 0.132 | 0.180 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.120 | robustness | 60 | 0.160 | 0.211 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.180 | robustness | 60 | 0.228 | 0.284 |
| 0.030 | A hazard | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.030 | A frequency-based | 50 | 0.500 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.030 | A success-based | 1000 | 0.500 | 0.574 | expA | 60 | 0.605 | 0.635 |
| 0.030 | B small_world beta=0.001 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.005 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.01 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.05 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.1 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.2 m=missing | 50 | 0.500 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.4 m=missing | 1000 | 0.500 | 0.020 | expB | 60 | 0.029 | 0.041 |
| 0.030 | B small_world beta=0.7 m=missing | 250 | 0.500 | 0.210 | expB | 60 | 0.260 | 0.318 |
| 0.030 | B small_world beta=1.0 m=missing | 50 | 0.500 | 0.208 | expB | 60 | 0.320 | 0.458 |
| 0.030 | B power_law beta=missing m=2 | 250 | 0.500 | 0.546 | expB | 60 | 0.608 | 0.666 |
| 0.030 | B degree_matched_random beta=missing m=2 | 50 | 0.500 | 0.542 | expB | 60 | 0.680 | 0.792 |
| 0.030 | B power_law beta=missing m=3 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=3 | 50 | 0.500 | 0.604 | expB | 60 | 0.740 | 0.841 |
| 0.030 | B power_law beta=missing m=5 | 1000 | 0.500 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=5 | 50 | 0.500 | 0.501 | expB | 60 | 0.640 | 0.759 |
| 0.030 | B power_law beta=missing m=8 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=8 | 50 | 0.500 | 0.542 | expB | 60 | 0.680 | 0.792 |
| 0.030 | B power_law beta=missing m=12 | 50 | 0.500 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=12 | 250 | 0.500 | 0.661 | expB | 60 | 0.720 | 0.772 |
| 0.030 | C homogeneous beta=0.4 vary=false | 1000 | 0.500 | 0.003 | expC | 60 | 0.006 | 0.013 |
| 0.030 | C lower_mean beta=0.4 vary=false | 1000 | 0.500 | 0.008 | expC | 60 | 0.013 | 0.022 |
| 0.030 | C higher_variance beta=0.4 vary=false | 1000 | 0.500 | 0.536 | expC | 60 | 0.567 | 0.597 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.500 | 0.009 | expC | 60 | 0.020 | 0.046 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.500 | 0.011 | expC | 60 | 0.024 | 0.051 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.500 | 0.156 | expC | 60 | 0.179 | 0.204 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.500 | 0.128 | expC | 60 | 0.220 | 0.352 |
| 0.030 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.500 | 0.002 | expC | 60 | 0.008 | 0.029 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.500 | 0.000 | expC | 60 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.500 | 0.034 | expC | 60 | 0.056 | 0.092 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.500 | 0.079 | expC | 60 | 0.112 | 0.157 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.500 | 0.098 | expC | 60 | 0.180 | 0.308 |
| 0.030 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.500 | 0.130 | expC | 60 | 0.172 | 0.224 |
| 0.030 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.500 | 0.235 | expC | 60 | 0.288 | 0.347 |
| 0.030 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.500 | 0.522 | expC | 60 | 0.660 | 0.776 |
| 0.030 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.500 | 0.542 | expC | 60 | 0.680 | 0.792 |
| 0.030 | D small_world seed=random | 250 | 0.500 | 0.011 | expD | 60 | 0.024 | 0.051 |
| 0.030 | D power_law seed=random | 250 | 0.500 | 0.277 | expD | 60 | 0.332 | 0.393 |
| 0.030 | D small_world seed=high_degree | 250 | 0.500 | 0.099 | expD | 60 | 0.136 | 0.184 |
| 0.030 | D power_law seed=high_degree | 1000 | 0.500 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.030 | D small_world seed=bridge | 1000 | 0.500 | 0.124 | expD | 60 | 0.144 | 0.167 |
| 0.030 | D power_law seed=bridge | 50 | 0.500 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.030 | D small_world seed=clustered | 250 | 0.500 | 0.002 | expD | 60 | 0.008 | 0.029 |
| 0.030 | D power_law seed=clustered | 250 | 0.500 | 0.575 | expD | 60 | 0.636 | 0.693 |
| 0.030 | E seed=random pioneer=random | 1000 | 0.500 | 0.022 | expE | 60 | 0.031 | 0.044 |
| 0.030 | E seed=random pioneer=hub_bridge | 1000 | 0.500 | 0.831 | expE | 60 | 0.854 | 0.875 |
| 0.030 | E seed=hub_bridge pioneer=random | 1000 | 0.500 | 0.217 | expE | 60 | 0.243 | 0.271 |
| 0.030 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.500 | 0.924 | expE | 60 | 0.940 | 0.953 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.019 | robustness | 60 | 0.036 | 0.067 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.120 | robustness | 60 | 0.160 | 0.211 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.500 | 0.120 | robustness | 60 | 0.160 | 0.211 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.500 | 0.144 | robustness | 60 | 0.188 | 0.241 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.500 | 0.009 | robustness | 60 | 0.020 | 0.046 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.500 | 0.016 | robustness | 60 | 0.032 | 0.062 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.500 | 0.004 | robustness | 60 | 0.012 | 0.035 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.500 | 0.011 | robustness | 60 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.500 | 0.312 | robustness | 60 | 0.440 | 0.577 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.500 | 0.009 | robustness | 60 | 0.020 | 0.046 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.500 | 0.221 | robustness | 60 | 0.272 | 0.330 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.500 | 0.019 | robustness | 60 | 0.036 | 0.067 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.500 | 0.069 | robustness | 60 | 0.100 | 0.143 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.500 | 0.052 | robustness | 60 | 0.080 | 0.120 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.500 | 0.011 | robustness | 60 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.500 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.500 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.500 | 0.004 | robustness | 60 | 0.012 | 0.035 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.500 | 0.034 | robustness | 60 | 0.056 | 0.092 |
| 0.010 | A hazard | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.010 | A frequency-based | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.010 | A success-based | 1000 | 0.700 | 0.943 | expA | 30 | 0.957 | 0.968 |
| 0.010 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.124 | expB | 30 | 0.144 | 0.167 |
| 0.010 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.311 | expB | 30 | 0.368 | 0.429 |
| 0.010 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.259 | expB | 30 | 0.380 | 0.518 |
| 0.010 | B power_law beta=missing m=2 | 250 | 0.700 | 0.284 | expB | 30 | 0.340 | 0.401 |
| 0.010 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.542 | expB | 30 | 0.680 | 0.792 |
| 0.010 | B power_law beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.010 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.626 | expB | 30 | 0.760 | 0.857 |
| 0.010 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.692 | expB | 30 | 0.820 | 0.902 |
| 0.010 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.583 | expB | 30 | 0.720 | 0.825 |
| 0.010 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.653 | expB | 30 | 0.712 | 0.765 |
| 0.010 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.021 | expC | 30 | 0.030 | 0.043 |
| 0.010 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.053 | expC | 30 | 0.067 | 0.084 |
| 0.010 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.864 | expC | 30 | 0.885 | 0.903 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.075 | expC | 30 | 0.108 | 0.153 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.213 | expC | 30 | 0.264 | 0.322 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.544 | expC | 30 | 0.575 | 0.605 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.715 | expC | 30 | 0.840 | 0.917 |
| 0.010 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.010 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.031 | expC | 30 | 0.052 | 0.087 |
| 0.010 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.037 | expC | 30 | 0.060 | 0.097 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.034 | expC | 30 | 0.056 | 0.092 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.247 | expC | 30 | 0.300 | 0.359 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.462 | expC | 30 | 0.524 | 0.585 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.604 | expC | 30 | 0.740 | 0.841 |
| 0.010 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.184 | expC | 30 | 0.232 | 0.288 |
| 0.010 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.454 | expC | 30 | 0.516 | 0.577 |
| 0.010 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.738 | expC | 30 | 0.860 | 0.930 |
| 0.010 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 30 | 1.000 | 1.000 |
| 0.010 | D small_world seed=random | 250 | 0.700 | 0.113 | expD | 30 | 0.152 | 0.202 |
| 0.010 | D power_law seed=random | 250 | 0.700 | 0.137 | expD | 30 | 0.180 | 0.232 |
| 0.010 | D small_world seed=high_degree | 250 | 0.700 | 0.558 | expD | 30 | 0.620 | 0.678 |
| 0.010 | D power_law seed=high_degree | 1000 | 0.700 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.010 | D small_world seed=bridge | 1000 | 0.700 | 0.595 | expD | 30 | 0.625 | 0.654 |
| 0.010 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.010 | D small_world seed=clustered | 250 | 0.700 | 0.009 | expD | 30 | 0.020 | 0.046 |
| 0.010 | D power_law seed=clustered | 250 | 0.700 | 0.415 | expD | 30 | 0.476 | 0.538 |
| 0.010 | E seed=random pioneer=random | 1000 | 0.700 | 0.160 | expE | 30 | 0.183 | 0.208 |
| 0.010 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.993 | expE | 30 | 0.998 | 0.999 |
| 0.010 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.700 | expE | 30 | 0.728 | 0.755 |
| 0.010 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 30 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.184 | robustness | 30 | 0.232 | 0.288 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.411 | robustness | 30 | 0.472 | 0.534 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.407 | robustness | 30 | 0.468 | 0.530 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.415 | robustness | 30 | 0.476 | 0.538 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.085 | robustness | 30 | 0.120 | 0.166 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.169 | robustness | 30 | 0.216 | 0.271 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.109 | robustness | 30 | 0.148 | 0.197 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.127 | robustness | 30 | 0.168 | 0.219 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.626 | robustness | 30 | 0.760 | 0.857 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.089 | robustness | 30 | 0.124 | 0.171 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.318 | robustness | 30 | 0.376 | 0.437 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.075 | robustness | 30 | 0.108 | 0.153 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.314 | robustness | 30 | 0.372 | 0.433 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.295 | robustness | 30 | 0.352 | 0.413 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.102 | robustness | 30 | 0.140 | 0.188 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.123 | robustness | 30 | 0.164 | 0.215 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.116 | robustness | 30 | 0.156 | 0.206 |
| 0.015 | A hazard | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.015 | A frequency-based | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.015 | A success-based | 1000 | 0.700 | 0.943 | expA | 30 | 0.957 | 0.968 |
| 0.015 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.124 | expB | 30 | 0.144 | 0.167 |
| 0.015 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.311 | expB | 30 | 0.368 | 0.429 |
| 0.015 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.259 | expB | 30 | 0.380 | 0.518 |
| 0.015 | B power_law beta=missing m=2 | 250 | 0.700 | 0.284 | expB | 30 | 0.340 | 0.401 |
| 0.015 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.542 | expB | 30 | 0.680 | 0.792 |
| 0.015 | B power_law beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.015 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.626 | expB | 30 | 0.760 | 0.857 |
| 0.015 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.692 | expB | 30 | 0.820 | 0.902 |
| 0.015 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.583 | expB | 30 | 0.720 | 0.825 |
| 0.015 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.653 | expB | 30 | 0.712 | 0.765 |
| 0.015 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.021 | expC | 30 | 0.030 | 0.043 |
| 0.015 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.053 | expC | 30 | 0.067 | 0.084 |
| 0.015 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.864 | expC | 30 | 0.885 | 0.903 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.075 | expC | 30 | 0.108 | 0.153 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.213 | expC | 30 | 0.264 | 0.322 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.544 | expC | 30 | 0.575 | 0.605 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.715 | expC | 30 | 0.840 | 0.917 |
| 0.015 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.015 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.031 | expC | 30 | 0.052 | 0.087 |
| 0.015 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.037 | expC | 30 | 0.060 | 0.097 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.034 | expC | 30 | 0.056 | 0.092 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.247 | expC | 30 | 0.300 | 0.359 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.462 | expC | 30 | 0.524 | 0.585 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.604 | expC | 30 | 0.740 | 0.841 |
| 0.015 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.184 | expC | 30 | 0.232 | 0.288 |
| 0.015 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.454 | expC | 30 | 0.516 | 0.577 |
| 0.015 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.738 | expC | 30 | 0.860 | 0.930 |
| 0.015 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 30 | 1.000 | 1.000 |
| 0.015 | D small_world seed=random | 250 | 0.700 | 0.113 | expD | 30 | 0.152 | 0.202 |
| 0.015 | D power_law seed=random | 250 | 0.700 | 0.137 | expD | 30 | 0.180 | 0.232 |
| 0.015 | D small_world seed=high_degree | 250 | 0.700 | 0.558 | expD | 30 | 0.620 | 0.678 |
| 0.015 | D power_law seed=high_degree | 1000 | 0.700 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.015 | D small_world seed=bridge | 1000 | 0.700 | 0.595 | expD | 30 | 0.625 | 0.654 |
| 0.015 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.015 | D small_world seed=clustered | 250 | 0.700 | 0.009 | expD | 30 | 0.020 | 0.046 |
| 0.015 | D power_law seed=clustered | 250 | 0.700 | 0.415 | expD | 30 | 0.476 | 0.538 |
| 0.015 | E seed=random pioneer=random | 1000 | 0.700 | 0.160 | expE | 30 | 0.183 | 0.208 |
| 0.015 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.993 | expE | 30 | 0.998 | 0.999 |
| 0.015 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.700 | expE | 30 | 0.728 | 0.755 |
| 0.015 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 30 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.184 | robustness | 30 | 0.232 | 0.288 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.411 | robustness | 30 | 0.472 | 0.534 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.407 | robustness | 30 | 0.468 | 0.530 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.415 | robustness | 30 | 0.476 | 0.538 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.085 | robustness | 30 | 0.120 | 0.166 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.169 | robustness | 30 | 0.216 | 0.271 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.109 | robustness | 30 | 0.148 | 0.197 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.127 | robustness | 30 | 0.168 | 0.219 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.626 | robustness | 30 | 0.760 | 0.857 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.089 | robustness | 30 | 0.124 | 0.171 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.318 | robustness | 30 | 0.376 | 0.437 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.075 | robustness | 30 | 0.108 | 0.153 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.314 | robustness | 30 | 0.372 | 0.433 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.295 | robustness | 30 | 0.352 | 0.413 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.102 | robustness | 30 | 0.140 | 0.188 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.123 | robustness | 30 | 0.164 | 0.215 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.116 | robustness | 30 | 0.156 | 0.206 |
| 0.020 | A hazard | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.020 | A frequency-based | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.020 | A success-based | 1000 | 0.700 | 0.943 | expA | 30 | 0.957 | 0.968 |
| 0.020 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.122 | expB | 30 | 0.142 | 0.165 |
| 0.020 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.311 | expB | 30 | 0.368 | 0.429 |
| 0.020 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.259 | expB | 30 | 0.380 | 0.518 |
| 0.020 | B power_law beta=missing m=2 | 250 | 0.700 | 0.284 | expB | 30 | 0.340 | 0.401 |
| 0.020 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.542 | expB | 30 | 0.680 | 0.792 |
| 0.020 | B power_law beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.020 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.626 | expB | 30 | 0.760 | 0.857 |
| 0.020 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.692 | expB | 30 | 0.820 | 0.902 |
| 0.020 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.583 | expB | 30 | 0.720 | 0.825 |
| 0.020 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.653 | expB | 30 | 0.712 | 0.765 |
| 0.020 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.021 | expC | 30 | 0.030 | 0.043 |
| 0.020 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.052 | expC | 30 | 0.066 | 0.083 |
| 0.020 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.864 | expC | 30 | 0.885 | 0.903 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.072 | expC | 30 | 0.104 | 0.148 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.210 | expC | 30 | 0.260 | 0.318 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.542 | expC | 30 | 0.573 | 0.603 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.715 | expC | 30 | 0.840 | 0.917 |
| 0.020 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.020 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.028 | expC | 30 | 0.048 | 0.082 |
| 0.020 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.037 | expC | 30 | 0.060 | 0.097 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.034 | expC | 30 | 0.056 | 0.092 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.243 | expC | 30 | 0.296 | 0.355 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.458 | expC | 30 | 0.520 | 0.581 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.604 | expC | 30 | 0.740 | 0.841 |
| 0.020 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.184 | expC | 30 | 0.232 | 0.288 |
| 0.020 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.454 | expC | 30 | 0.516 | 0.577 |
| 0.020 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.738 | expC | 30 | 0.860 | 0.930 |
| 0.020 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 30 | 1.000 | 1.000 |
| 0.020 | D small_world seed=random | 250 | 0.700 | 0.109 | expD | 30 | 0.148 | 0.197 |
| 0.020 | D power_law seed=random | 250 | 0.700 | 0.137 | expD | 30 | 0.180 | 0.232 |
| 0.020 | D small_world seed=high_degree | 250 | 0.700 | 0.558 | expD | 30 | 0.620 | 0.678 |
| 0.020 | D power_law seed=high_degree | 1000 | 0.700 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.020 | D small_world seed=bridge | 1000 | 0.700 | 0.592 | expD | 30 | 0.622 | 0.652 |
| 0.020 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.020 | D small_world seed=clustered | 250 | 0.700 | 0.009 | expD | 30 | 0.020 | 0.046 |
| 0.020 | D power_law seed=clustered | 250 | 0.700 | 0.415 | expD | 30 | 0.476 | 0.538 |
| 0.020 | E seed=random pioneer=random | 1000 | 0.700 | 0.159 | expE | 30 | 0.182 | 0.207 |
| 0.020 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.993 | expE | 30 | 0.998 | 0.999 |
| 0.020 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.698 | expE | 30 | 0.726 | 0.753 |
| 0.020 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 30 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.177 | robustness | 30 | 0.224 | 0.280 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.411 | robustness | 30 | 0.472 | 0.534 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.407 | robustness | 30 | 0.468 | 0.530 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.415 | robustness | 30 | 0.476 | 0.538 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.082 | robustness | 30 | 0.116 | 0.162 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.159 | robustness | 30 | 0.204 | 0.258 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.109 | robustness | 30 | 0.148 | 0.197 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.127 | robustness | 30 | 0.168 | 0.219 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.626 | robustness | 30 | 0.760 | 0.857 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.089 | robustness | 30 | 0.124 | 0.171 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.318 | robustness | 30 | 0.376 | 0.437 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.075 | robustness | 30 | 0.108 | 0.153 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.314 | robustness | 30 | 0.372 | 0.433 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.295 | robustness | 30 | 0.352 | 0.413 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.099 | robustness | 30 | 0.136 | 0.184 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.116 | robustness | 30 | 0.156 | 0.206 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.116 | robustness | 30 | 0.156 | 0.206 |
| 0.025 | A hazard | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.025 | A frequency-based | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.025 | A success-based | 1000 | 0.700 | 0.867 | expA | 30 | 0.888 | 0.906 |
| 0.025 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.068 | expB | 30 | 0.084 | 0.103 |
| 0.025 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.277 | expB | 30 | 0.332 | 0.393 |
| 0.025 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.259 | expB | 30 | 0.380 | 0.518 |
| 0.025 | B power_law beta=missing m=2 | 250 | 0.700 | 0.284 | expB | 30 | 0.340 | 0.401 |
| 0.025 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.542 | expB | 30 | 0.680 | 0.792 |
| 0.025 | B power_law beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.025 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.626 | expB | 30 | 0.760 | 0.857 |
| 0.025 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.692 | expB | 30 | 0.820 | 0.902 |
| 0.025 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.583 | expB | 30 | 0.720 | 0.825 |
| 0.025 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.641 | expB | 30 | 0.700 | 0.753 |
| 0.025 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.003 | expC | 30 | 0.007 | 0.014 |
| 0.025 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.032 | expC | 30 | 0.043 | 0.057 |
| 0.025 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.794 | expC | 30 | 0.819 | 0.842 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.043 | expC | 30 | 0.068 | 0.106 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.109 | expC | 30 | 0.148 | 0.197 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.380 | expC | 30 | 0.410 | 0.441 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.462 | expC | 30 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.015 |
| 0.025 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.006 | expC | 30 | 0.016 | 0.040 |
| 0.025 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.025 | expC | 30 | 0.044 | 0.077 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.152 | expC | 30 | 0.196 | 0.250 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.314 | expC | 30 | 0.372 | 0.433 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.462 | expC | 30 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.173 | expC | 30 | 0.220 | 0.275 |
| 0.025 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.388 | expC | 30 | 0.448 | 0.510 |
| 0.025 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.715 | expC | 30 | 0.840 | 0.917 |
| 0.025 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.838 | expC | 30 | 0.940 | 0.979 |
| 0.025 | D small_world seed=random | 250 | 0.700 | 0.046 | expD | 30 | 0.072 | 0.111 |
| 0.025 | D power_law seed=random | 250 | 0.700 | 0.134 | expD | 30 | 0.176 | 0.228 |
| 0.025 | D small_world seed=high_degree | 250 | 0.700 | 0.368 | expD | 30 | 0.428 | 0.490 |
| 0.025 | D power_law seed=high_degree | 1000 | 0.700 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.025 | D small_world seed=bridge | 1000 | 0.700 | 0.392 | expD | 30 | 0.422 | 0.453 |
| 0.025 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.025 | D small_world seed=clustered | 250 | 0.700 | 0.001 | expD | 30 | 0.004 | 0.022 |
| 0.025 | D power_law seed=clustered | 250 | 0.700 | 0.415 | expD | 30 | 0.476 | 0.538 |
| 0.025 | E seed=random pioneer=random | 1000 | 0.700 | 0.094 | expE | 30 | 0.112 | 0.133 |
| 0.025 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.974 | expE | 30 | 0.984 | 0.990 |
| 0.025 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.540 | expE | 30 | 0.571 | 0.601 |
| 0.025 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.990 | expE | 30 | 0.996 | 0.998 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.085 | robustness | 30 | 0.120 | 0.166 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.303 | robustness | 30 | 0.360 | 0.421 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.303 | robustness | 30 | 0.360 | 0.421 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.307 | robustness | 30 | 0.364 | 0.425 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.031 | robustness | 30 | 0.052 | 0.087 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.099 | robustness | 30 | 0.136 | 0.184 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.049 | robustness | 30 | 0.076 | 0.116 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.004 | robustness | 30 | 0.020 | 0.105 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.059 | robustness | 30 | 0.088 | 0.130 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.522 | robustness | 30 | 0.660 | 0.776 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.052 | robustness | 30 | 0.080 | 0.120 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.303 | robustness | 30 | 0.360 | 0.421 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.043 | robustness | 30 | 0.068 | 0.106 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.217 | robustness | 30 | 0.268 | 0.326 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.155 | robustness | 30 | 0.200 | 0.254 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.040 | robustness | 30 | 0.064 | 0.101 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.059 | robustness | 30 | 0.088 | 0.130 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.075 | robustness | 30 | 0.108 | 0.153 |
| 0.030 | A hazard | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.030 | A frequency-based | 50 | 0.700 | 0.000 | expA | 30 | 0.000 | 0.071 |
| 0.030 | A success-based | 1000 | 0.700 | 0.573 | expA | 30 | 0.604 | 0.634 |
| 0.030 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 30 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.015 | expB | 30 | 0.023 | 0.034 |
| 0.030 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.137 | expB | 30 | 0.180 | 0.232 |
| 0.030 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.128 | expB | 30 | 0.220 | 0.352 |
| 0.030 | B power_law beta=missing m=2 | 250 | 0.700 | 0.265 | expB | 30 | 0.320 | 0.380 |
| 0.030 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.404 | expB | 30 | 0.540 | 0.670 |
| 0.030 | B power_law beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 30 | 0.980 | 0.996 |
| 0.030 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.501 | expB | 30 | 0.640 | 0.759 |
| 0.030 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 30 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.462 | expB | 30 | 0.600 | 0.724 |
| 0.030 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.423 | expB | 30 | 0.560 | 0.688 |
| 0.030 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 30 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.567 | expB | 30 | 0.628 | 0.686 |
| 0.030 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.001 | expC | 30 | 0.002 | 0.007 |
| 0.030 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.004 | expC | 30 | 0.008 | 0.016 |
| 0.030 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.517 | expC | 30 | 0.548 | 0.579 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.006 | expC | 30 | 0.016 | 0.040 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.011 | expC | 30 | 0.024 | 0.051 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.137 | expC | 30 | 0.158 | 0.182 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.128 | expC | 30 | 0.220 | 0.352 |
| 0.030 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.002 | expC | 30 | 0.008 | 0.029 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.000 | expC | 30 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.031 | expC | 30 | 0.052 | 0.087 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.069 | expC | 30 | 0.100 | 0.143 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.098 | expC | 30 | 0.180 | 0.308 |
| 0.030 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.065 | expC | 30 | 0.096 | 0.139 |
| 0.030 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.177 | expC | 30 | 0.224 | 0.280 |
| 0.030 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.501 | expC | 30 | 0.640 | 0.759 |
| 0.030 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.542 | expC | 30 | 0.680 | 0.792 |
| 0.030 | D small_world seed=random | 250 | 0.700 | 0.006 | expD | 30 | 0.016 | 0.040 |
| 0.030 | D power_law seed=random | 250 | 0.700 | 0.134 | expD | 30 | 0.176 | 0.228 |
| 0.030 | D small_world seed=high_degree | 250 | 0.700 | 0.099 | expD | 30 | 0.136 | 0.184 |
| 0.030 | D power_law seed=high_degree | 1000 | 0.700 | 0.994 | expD | 30 | 0.999 | 1.000 |
| 0.030 | D small_world seed=bridge | 1000 | 0.700 | 0.118 | expD | 30 | 0.138 | 0.161 |
| 0.030 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 30 | 1.000 | 1.000 |
| 0.030 | D small_world seed=clustered | 250 | 0.700 | 0.001 | expD | 30 | 0.004 | 0.022 |
| 0.030 | D power_law seed=clustered | 250 | 0.700 | 0.407 | expD | 30 | 0.468 | 0.530 |
| 0.030 | E seed=random pioneer=random | 1000 | 0.700 | 0.018 | expE | 30 | 0.026 | 0.038 |
| 0.030 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.831 | expE | 30 | 0.854 | 0.875 |
| 0.030 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.214 | expE | 30 | 0.239 | 0.266 |
| 0.030 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.924 | expE | 30 | 0.940 | 0.953 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.016 | robustness | 30 | 0.032 | 0.062 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.099 | robustness | 30 | 0.136 | 0.184 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.092 | robustness | 30 | 0.128 | 0.175 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.113 | robustness | 30 | 0.152 | 0.202 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.006 | robustness | 30 | 0.016 | 0.040 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.016 | robustness | 30 | 0.032 | 0.062 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.002 | robustness | 30 | 0.008 | 0.029 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.006 | robustness | 30 | 0.016 | 0.040 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.312 | robustness | 30 | 0.440 | 0.577 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.006 | robustness | 30 | 0.016 | 0.040 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.162 | robustness | 30 | 0.208 | 0.263 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.011 | robustness | 30 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.059 | robustness | 30 | 0.088 | 0.130 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.037 | robustness | 30 | 0.060 | 0.097 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.006 | robustness | 30 | 0.016 | 0.040 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 30 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 30 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.002 | robustness | 30 | 0.008 | 0.029 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.028 | robustness | 30 | 0.048 | 0.082 |
| 0.010 | A hazard | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.010 | A frequency-based | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.010 | A success-based | 1000 | 0.700 | 0.986 | expA | 45 | 0.993 | 0.997 |
| 0.010 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.021 | expB | 45 | 0.060 | 0.162 |
| 0.010 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.608 | expB | 45 | 0.638 | 0.667 |
| 0.010 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.843 | expB | 45 | 0.888 | 0.921 |
| 0.010 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.010 | B power_law beta=missing m=2 | 250 | 0.700 | 0.506 | expB | 45 | 0.568 | 0.628 |
| 0.010 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.010 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 45 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.865 | expB | 45 | 0.960 | 0.989 |
| 0.010 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.812 | expB | 45 | 0.920 | 0.968 |
| 0.010 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.903 | expB | 45 | 0.940 | 0.963 |
| 0.010 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.305 | expC | 45 | 0.334 | 0.364 |
| 0.010 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.434 | expC | 45 | 0.465 | 0.496 |
| 0.010 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.987 | expC | 45 | 0.994 | 0.997 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.474 | expC | 45 | 0.536 | 0.597 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.682 | expC | 45 | 0.740 | 0.790 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.914 | expC | 45 | 0.931 | 0.945 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.865 | expC | 45 | 0.960 | 0.989 |
| 0.010 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.010 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.059 | expC | 45 | 0.088 | 0.130 |
| 0.010 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.322 | expC | 45 | 0.380 | 0.442 |
| 0.010 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.106 | expC | 45 | 0.144 | 0.193 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.391 | expC | 45 | 0.452 | 0.514 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.737 | expC | 45 | 0.792 | 0.838 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.903 | expC | 45 | 0.940 | 0.963 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.812 | expC | 45 | 0.920 | 0.968 |
| 0.010 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.682 | expC | 45 | 0.740 | 0.790 |
| 0.010 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.843 | expC | 45 | 0.888 | 0.921 |
| 0.010 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.010 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.010 | D small_world seed=random | 250 | 0.700 | 0.530 | expD | 45 | 0.592 | 0.651 |
| 0.010 | D power_law seed=random | 250 | 0.700 | 0.273 | expD | 45 | 0.328 | 0.388 |
| 0.010 | D small_world seed=high_degree | 250 | 0.700 | 0.903 | expD | 45 | 0.940 | 0.963 |
| 0.010 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.010 | D small_world seed=bridge | 1000 | 0.700 | 0.947 | expD | 45 | 0.961 | 0.971 |
| 0.010 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.010 | D small_world seed=clustered | 250 | 0.700 | 0.199 | expD | 45 | 0.248 | 0.305 |
| 0.010 | D power_law seed=clustered | 250 | 0.700 | 0.567 | expD | 45 | 0.628 | 0.686 |
| 0.010 | E seed=random pioneer=random | 1000 | 0.700 | 0.622 | expE | 45 | 0.652 | 0.681 |
| 0.010 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.010 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.960 | expE | 45 | 0.972 | 0.981 |
| 0.010 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.159 | robustness | 45 | 0.260 | 0.396 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.716 | robustness | 45 | 0.772 | 0.820 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.923 | robustness | 45 | 0.956 | 0.975 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.032 | robustness | 45 | 0.080 | 0.188 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.870 | robustness | 45 | 0.912 | 0.941 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.866 | robustness | 45 | 0.908 | 0.938 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.579 | robustness | 45 | 0.640 | 0.697 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.595 | robustness | 45 | 0.656 | 0.712 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.554 | robustness | 45 | 0.616 | 0.674 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.011 | robustness | 45 | 0.040 | 0.135 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.056 | robustness | 45 | 0.120 | 0.238 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.567 | robustness | 45 | 0.628 | 0.686 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.838 | robustness | 45 | 0.940 | 0.979 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.563 | robustness | 45 | 0.624 | 0.682 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.742 | robustness | 45 | 0.796 | 0.841 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.534 | robustness | 45 | 0.596 | 0.655 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.825 | robustness | 45 | 0.872 | 0.908 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.847 | robustness | 45 | 0.892 | 0.925 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.498 | robustness | 45 | 0.560 | 0.620 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.558 | robustness | 45 | 0.620 | 0.678 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.534 | robustness | 45 | 0.596 | 0.655 |
| 0.015 | A hazard | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.015 | A frequency-based | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.015 | A success-based | 1000 | 0.700 | 0.986 | expA | 45 | 0.993 | 0.997 |
| 0.015 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.021 | expB | 45 | 0.060 | 0.162 |
| 0.015 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.608 | expB | 45 | 0.638 | 0.667 |
| 0.015 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.843 | expB | 45 | 0.888 | 0.921 |
| 0.015 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.015 | B power_law beta=missing m=2 | 250 | 0.700 | 0.506 | expB | 45 | 0.568 | 0.628 |
| 0.015 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.015 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 45 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.865 | expB | 45 | 0.960 | 0.989 |
| 0.015 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.812 | expB | 45 | 0.920 | 0.968 |
| 0.015 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.903 | expB | 45 | 0.940 | 0.963 |
| 0.015 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.304 | expC | 45 | 0.332 | 0.362 |
| 0.015 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.433 | expC | 45 | 0.464 | 0.495 |
| 0.015 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.987 | expC | 45 | 0.994 | 0.997 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.470 | expC | 45 | 0.532 | 0.593 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.682 | expC | 45 | 0.740 | 0.790 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.914 | expC | 45 | 0.931 | 0.945 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.865 | expC | 45 | 0.960 | 0.989 |
| 0.015 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.015 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.059 | expC | 45 | 0.088 | 0.130 |
| 0.015 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.322 | expC | 45 | 0.380 | 0.442 |
| 0.015 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.106 | expC | 45 | 0.144 | 0.193 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.391 | expC | 45 | 0.452 | 0.514 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.737 | expC | 45 | 0.792 | 0.838 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.903 | expC | 45 | 0.940 | 0.963 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.812 | expC | 45 | 0.920 | 0.968 |
| 0.015 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.682 | expC | 45 | 0.740 | 0.790 |
| 0.015 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.843 | expC | 45 | 0.888 | 0.921 |
| 0.015 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.015 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.015 | D small_world seed=random | 250 | 0.700 | 0.530 | expD | 45 | 0.592 | 0.651 |
| 0.015 | D power_law seed=random | 250 | 0.700 | 0.273 | expD | 45 | 0.328 | 0.388 |
| 0.015 | D small_world seed=high_degree | 250 | 0.700 | 0.903 | expD | 45 | 0.940 | 0.963 |
| 0.015 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.015 | D small_world seed=bridge | 1000 | 0.700 | 0.947 | expD | 45 | 0.961 | 0.971 |
| 0.015 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.015 | D small_world seed=clustered | 250 | 0.700 | 0.199 | expD | 45 | 0.248 | 0.305 |
| 0.015 | D power_law seed=clustered | 250 | 0.700 | 0.567 | expD | 45 | 0.628 | 0.686 |
| 0.015 | E seed=random pioneer=random | 1000 | 0.700 | 0.622 | expE | 45 | 0.652 | 0.681 |
| 0.015 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.015 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.960 | expE | 45 | 0.972 | 0.981 |
| 0.015 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.159 | robustness | 45 | 0.260 | 0.396 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.716 | robustness | 45 | 0.772 | 0.820 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.923 | robustness | 45 | 0.956 | 0.975 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.032 | robustness | 45 | 0.080 | 0.188 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.870 | robustness | 45 | 0.912 | 0.941 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.866 | robustness | 45 | 0.908 | 0.938 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.579 | robustness | 45 | 0.640 | 0.697 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.595 | robustness | 45 | 0.656 | 0.712 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.554 | robustness | 45 | 0.616 | 0.674 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.011 | robustness | 45 | 0.040 | 0.135 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.056 | robustness | 45 | 0.120 | 0.238 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.567 | robustness | 45 | 0.628 | 0.686 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.838 | robustness | 45 | 0.940 | 0.979 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.563 | robustness | 45 | 0.624 | 0.682 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.742 | robustness | 45 | 0.796 | 0.841 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.530 | robustness | 45 | 0.592 | 0.651 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.825 | robustness | 45 | 0.872 | 0.908 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.847 | robustness | 45 | 0.892 | 0.925 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.498 | robustness | 45 | 0.560 | 0.620 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.558 | robustness | 45 | 0.620 | 0.678 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.534 | robustness | 45 | 0.596 | 0.655 |
| 0.020 | A hazard | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.020 | A frequency-based | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.020 | A success-based | 1000 | 0.700 | 0.978 | expA | 45 | 0.987 | 0.992 |
| 0.020 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.021 | expB | 45 | 0.060 | 0.162 |
| 0.020 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.452 | expB | 45 | 0.483 | 0.514 |
| 0.020 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.798 | expB | 45 | 0.848 | 0.887 |
| 0.020 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.020 | B power_law beta=missing m=2 | 250 | 0.700 | 0.506 | expB | 45 | 0.568 | 0.628 |
| 0.020 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.020 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 45 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.865 | expB | 45 | 0.960 | 0.989 |
| 0.020 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.812 | expB | 45 | 0.920 | 0.968 |
| 0.020 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.903 | expB | 45 | 0.940 | 0.963 |
| 0.020 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.176 | expC | 45 | 0.200 | 0.226 |
| 0.020 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.334 | expC | 45 | 0.363 | 0.393 |
| 0.020 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.979 | expC | 45 | 0.988 | 0.993 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.318 | expC | 45 | 0.376 | 0.437 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.530 | expC | 45 | 0.592 | 0.651 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.836 | expC | 45 | 0.859 | 0.879 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.838 | expC | 45 | 0.940 | 0.979 |
| 0.020 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.004 | expC | 45 | 0.020 | 0.105 |
| 0.020 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.016 | expC | 45 | 0.032 | 0.062 |
| 0.020 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.130 | expC | 45 | 0.172 | 0.224 |
| 0.020 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.089 | expC | 45 | 0.124 | 0.171 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.213 | expC | 45 | 0.264 | 0.322 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.575 | expC | 45 | 0.636 | 0.693 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.794 | expC | 45 | 0.844 | 0.884 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.762 | expC | 45 | 0.880 | 0.944 |
| 0.020 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.649 | expC | 45 | 0.708 | 0.761 |
| 0.020 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.820 | expC | 45 | 0.868 | 0.904 |
| 0.020 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.020 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 45 | 1.000 | 1.000 |
| 0.020 | D small_world seed=random | 250 | 0.700 | 0.407 | expD | 45 | 0.468 | 0.530 |
| 0.020 | D power_law seed=random | 250 | 0.700 | 0.273 | expD | 45 | 0.328 | 0.388 |
| 0.020 | D small_world seed=high_degree | 250 | 0.700 | 0.812 | expD | 45 | 0.860 | 0.898 |
| 0.020 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.020 | D small_world seed=bridge | 1000 | 0.700 | 0.862 | expD | 45 | 0.883 | 0.901 |
| 0.020 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.020 | D small_world seed=clustered | 250 | 0.700 | 0.120 | expD | 45 | 0.160 | 0.211 |
| 0.020 | D power_law seed=clustered | 250 | 0.700 | 0.567 | expD | 45 | 0.628 | 0.686 |
| 0.020 | E seed=random pioneer=random | 1000 | 0.700 | 0.475 | expE | 45 | 0.506 | 0.537 |
| 0.020 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.020 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.902 | expE | 45 | 0.920 | 0.935 |
| 0.020 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 45 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.032 | robustness | 45 | 0.080 | 0.188 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.542 | robustness | 45 | 0.604 | 0.663 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.847 | robustness | 45 | 0.892 | 0.925 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.021 | robustness | 45 | 0.060 | 0.162 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.803 | robustness | 45 | 0.852 | 0.891 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.776 | robustness | 45 | 0.828 | 0.870 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.391 | robustness | 45 | 0.452 | 0.514 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.454 | robustness | 45 | 0.516 | 0.577 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.399 | robustness | 45 | 0.460 | 0.522 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.004 | robustness | 45 | 0.020 | 0.105 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.021 | robustness | 45 | 0.060 | 0.162 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.431 | robustness | 45 | 0.492 | 0.554 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.812 | robustness | 45 | 0.920 | 0.968 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.399 | robustness | 45 | 0.460 | 0.522 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.729 | robustness | 45 | 0.784 | 0.831 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.360 | robustness | 45 | 0.420 | 0.482 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.729 | robustness | 45 | 0.784 | 0.831 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.746 | robustness | 45 | 0.800 | 0.845 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.345 | robustness | 45 | 0.404 | 0.466 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.403 | robustness | 45 | 0.464 | 0.526 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.486 | robustness | 45 | 0.548 | 0.609 |
| 0.025 | A hazard | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.025 | A frequency-based | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.025 | A success-based | 1000 | 0.700 | 0.872 | expA | 45 | 0.893 | 0.911 |
| 0.025 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.132 | expB | 45 | 0.153 | 0.177 |
| 0.025 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.546 | expB | 45 | 0.608 | 0.666 |
| 0.025 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.583 | expB | 45 | 0.720 | 0.825 |
| 0.025 | B power_law beta=missing m=2 | 250 | 0.700 | 0.498 | expB | 45 | 0.560 | 0.620 |
| 0.025 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.786 | expB | 45 | 0.900 | 0.957 |
| 0.025 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 45 | 0.980 | 0.996 |
| 0.025 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.838 | expB | 45 | 0.940 | 0.979 |
| 0.025 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.738 | expB | 45 | 0.860 | 0.930 |
| 0.025 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.838 | expB | 45 | 0.884 | 0.918 |
| 0.025 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.027 | expC | 45 | 0.037 | 0.051 |
| 0.025 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.087 | expC | 45 | 0.105 | 0.126 |
| 0.025 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.850 | expC | 45 | 0.872 | 0.891 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.085 | expC | 45 | 0.120 | 0.166 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.162 | expC | 45 | 0.208 | 0.263 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.466 | expC | 45 | 0.497 | 0.528 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.462 | expC | 45 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.015 |
| 0.025 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.014 | expC | 45 | 0.028 | 0.057 |
| 0.025 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.028 | expC | 45 | 0.048 | 0.082 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.009 | expC | 45 | 0.020 | 0.046 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.199 | expC | 45 | 0.248 | 0.305 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.419 | expC | 45 | 0.480 | 0.542 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.462 | expC | 45 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.431 | expC | 45 | 0.492 | 0.554 |
| 0.025 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.567 | expC | 45 | 0.628 | 0.686 |
| 0.025 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.838 | expC | 45 | 0.940 | 0.979 |
| 0.025 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.838 | expC | 45 | 0.940 | 0.979 |
| 0.025 | D small_world seed=random | 250 | 0.700 | 0.099 | expD | 45 | 0.136 | 0.184 |
| 0.025 | D power_law seed=random | 250 | 0.700 | 0.262 | expD | 45 | 0.316 | 0.376 |
| 0.025 | D small_world seed=high_degree | 250 | 0.700 | 0.415 | expD | 45 | 0.476 | 0.538 |
| 0.025 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.025 | D small_world seed=bridge | 1000 | 0.700 | 0.465 | expD | 45 | 0.496 | 0.527 |
| 0.025 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.025 | D small_world seed=clustered | 250 | 0.700 | 0.019 | expD | 45 | 0.036 | 0.067 |
| 0.025 | D power_law seed=clustered | 250 | 0.700 | 0.567 | expD | 45 | 0.628 | 0.686 |
| 0.025 | E seed=random pioneer=random | 1000 | 0.700 | 0.156 | expE | 45 | 0.179 | 0.204 |
| 0.025 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.974 | expE | 45 | 0.984 | 0.990 |
| 0.025 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.593 | expE | 45 | 0.623 | 0.653 |
| 0.025 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.990 | expE | 45 | 0.996 | 0.998 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.134 | robustness | 45 | 0.176 | 0.228 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.450 | robustness | 45 | 0.512 | 0.573 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.466 | robustness | 45 | 0.528 | 0.589 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.435 | robustness | 45 | 0.496 | 0.558 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.082 | robustness | 45 | 0.116 | 0.162 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.141 | robustness | 45 | 0.184 | 0.237 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.120 | robustness | 45 | 0.160 | 0.211 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.004 | robustness | 45 | 0.020 | 0.105 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.011 | robustness | 45 | 0.040 | 0.135 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.113 | robustness | 45 | 0.152 | 0.202 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.562 | robustness | 45 | 0.700 | 0.809 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.116 | robustness | 45 | 0.156 | 0.206 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.502 | robustness | 45 | 0.564 | 0.624 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.092 | robustness | 45 | 0.128 | 0.175 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.307 | robustness | 45 | 0.364 | 0.425 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.269 | robustness | 45 | 0.324 | 0.384 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.085 | robustness | 45 | 0.120 | 0.166 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.120 | robustness | 45 | 0.160 | 0.211 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.173 | robustness | 45 | 0.220 | 0.275 |
| 0.030 | A hazard | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.030 | A frequency-based | 50 | 0.700 | 0.000 | expA | 45 | 0.000 | 0.071 |
| 0.030 | A success-based | 1000 | 0.700 | 0.574 | expA | 45 | 0.605 | 0.635 |
| 0.030 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 45 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.020 | expB | 45 | 0.029 | 0.041 |
| 0.030 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.202 | expB | 45 | 0.252 | 0.309 |
| 0.030 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.208 | expB | 45 | 0.320 | 0.458 |
| 0.030 | B power_law beta=missing m=2 | 250 | 0.700 | 0.458 | expB | 45 | 0.520 | 0.581 |
| 0.030 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.542 | expB | 45 | 0.680 | 0.792 |
| 0.030 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.604 | expB | 45 | 0.740 | 0.841 |
| 0.030 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 45 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.501 | expB | 45 | 0.640 | 0.759 |
| 0.030 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.522 | expB | 45 | 0.660 | 0.776 |
| 0.030 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 45 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.649 | expB | 45 | 0.708 | 0.761 |
| 0.030 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.002 | expC | 45 | 0.005 | 0.012 |
| 0.030 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.008 | expC | 45 | 0.013 | 0.022 |
| 0.030 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.535 | expC | 45 | 0.566 | 0.596 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.009 | expC | 45 | 0.020 | 0.046 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.011 | expC | 45 | 0.024 | 0.051 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.156 | expC | 45 | 0.179 | 0.204 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.128 | expC | 45 | 0.220 | 0.352 |
| 0.030 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.002 | expC | 45 | 0.008 | 0.029 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.000 | expC | 45 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.034 | expC | 45 | 0.056 | 0.092 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.075 | expC | 45 | 0.108 | 0.153 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.098 | expC | 45 | 0.180 | 0.308 |
| 0.030 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.130 | expC | 45 | 0.172 | 0.224 |
| 0.030 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.232 | expC | 45 | 0.284 | 0.343 |
| 0.030 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.522 | expC | 45 | 0.660 | 0.776 |
| 0.030 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.542 | expC | 45 | 0.680 | 0.792 |
| 0.030 | D small_world seed=random | 250 | 0.700 | 0.011 | expD | 45 | 0.024 | 0.051 |
| 0.030 | D power_law seed=random | 250 | 0.700 | 0.228 | expD | 45 | 0.280 | 0.339 |
| 0.030 | D small_world seed=high_degree | 250 | 0.700 | 0.099 | expD | 45 | 0.136 | 0.184 |
| 0.030 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 45 | 1.000 | 1.000 |
| 0.030 | D small_world seed=bridge | 1000 | 0.700 | 0.124 | expD | 45 | 0.144 | 0.167 |
| 0.030 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 45 | 1.000 | 1.000 |
| 0.030 | D small_world seed=clustered | 250 | 0.700 | 0.002 | expD | 45 | 0.008 | 0.029 |
| 0.030 | D power_law seed=clustered | 250 | 0.700 | 0.526 | expD | 45 | 0.588 | 0.647 |
| 0.030 | E seed=random pioneer=random | 1000 | 0.700 | 0.019 | expE | 45 | 0.028 | 0.040 |
| 0.030 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.831 | expE | 45 | 0.854 | 0.875 |
| 0.030 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.217 | expE | 45 | 0.243 | 0.271 |
| 0.030 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.924 | expE | 45 | 0.940 | 0.953 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.019 | robustness | 45 | 0.036 | 0.067 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.120 | robustness | 45 | 0.160 | 0.211 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.116 | robustness | 45 | 0.156 | 0.206 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.144 | robustness | 45 | 0.188 | 0.241 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.009 | robustness | 45 | 0.020 | 0.046 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.016 | robustness | 45 | 0.032 | 0.062 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.004 | robustness | 45 | 0.012 | 0.035 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.011 | robustness | 45 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.312 | robustness | 45 | 0.440 | 0.577 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.009 | robustness | 45 | 0.020 | 0.046 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.221 | robustness | 45 | 0.272 | 0.330 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.019 | robustness | 45 | 0.036 | 0.067 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.069 | robustness | 45 | 0.100 | 0.143 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.049 | robustness | 45 | 0.076 | 0.116 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.011 | robustness | 45 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 45 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 45 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.004 | robustness | 45 | 0.012 | 0.035 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.034 | robustness | 45 | 0.056 | 0.092 |
| 0.010 | A hazard | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.010 | A frequency-based | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.010 | A success-based | 1000 | 0.700 | 0.986 | expA | 60 | 0.993 | 0.997 |
| 0.010 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.010 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.032 | expB | 60 | 0.080 | 0.188 |
| 0.010 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.758 | expB | 60 | 0.785 | 0.809 |
| 0.010 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.903 | expB | 60 | 0.940 | 0.963 |
| 0.010 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.865 | expB | 60 | 0.960 | 0.989 |
| 0.010 | B power_law beta=missing m=2 | 250 | 0.700 | 0.599 | expB | 60 | 0.660 | 0.716 |
| 0.010 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.010 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.010 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.960 | expB | 60 | 0.984 | 0.994 |
| 0.010 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.550 | expC | 60 | 0.581 | 0.611 |
| 0.010 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.722 | expC | 60 | 0.750 | 0.776 |
| 0.010 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.996 | expC | 60 | 1.000 | 1.000 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.657 | expC | 60 | 0.716 | 0.768 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.829 | expC | 60 | 0.876 | 0.911 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.977 | expC | 60 | 0.986 | 0.992 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.865 | expC | 60 | 0.960 | 0.989 |
| 0.010 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.010 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.004 | expC | 60 | 0.020 | 0.105 |
| 0.010 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.123 | expC | 60 | 0.164 | 0.215 |
| 0.010 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.411 | expC | 60 | 0.472 | 0.534 |
| 0.010 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.109 | expC | 60 | 0.148 | 0.197 |
| 0.010 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.641 | expC | 60 | 0.700 | 0.753 |
| 0.010 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.899 | expC | 60 | 0.936 | 0.960 |
| 0.010 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.960 | expC | 60 | 0.984 | 0.994 |
| 0.010 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.812 | expC | 60 | 0.920 | 0.968 |
| 0.010 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.894 | expC | 60 | 0.932 | 0.957 |
| 0.010 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.928 | expC | 60 | 0.960 | 0.978 |
| 0.010 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.010 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.010 | D small_world seed=random | 250 | 0.700 | 0.716 | expD | 60 | 0.772 | 0.820 |
| 0.010 | D power_law seed=random | 250 | 0.700 | 0.349 | expD | 60 | 0.408 | 0.470 |
| 0.010 | D small_world seed=high_degree | 250 | 0.700 | 0.965 | expD | 60 | 0.988 | 0.996 |
| 0.010 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.010 | D small_world seed=bridge | 1000 | 0.700 | 0.986 | expD | 60 | 0.993 | 0.997 |
| 0.010 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.010 | D small_world seed=clustered | 250 | 0.700 | 0.307 | expD | 60 | 0.364 | 0.425 |
| 0.010 | D power_law seed=clustered | 250 | 0.700 | 0.653 | expD | 60 | 0.712 | 0.765 |
| 0.010 | E seed=random pioneer=random | 1000 | 0.700 | 0.803 | expE | 60 | 0.828 | 0.850 |
| 0.010 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.010 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.984 | expE | 60 | 0.992 | 0.996 |
| 0.010 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.366 | robustness | 60 | 0.500 | 0.634 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.884 | robustness | 60 | 0.924 | 0.951 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.971 | robustness | 60 | 0.992 | 0.998 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.056 | robustness | 60 | 0.120 | 0.238 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.960 | robustness | 60 | 0.984 | 0.994 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.943 | robustness | 60 | 0.972 | 0.986 |
| 0.010 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.755 | robustness | 60 | 0.808 | 0.852 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.772 | robustness | 60 | 0.824 | 0.866 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.746 | robustness | 60 | 0.800 | 0.845 |
| 0.010 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.011 | robustness | 60 | 0.040 | 0.135 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.191 | robustness | 60 | 0.300 | 0.438 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.708 | robustness | 60 | 0.764 | 0.812 |
| 0.010 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.895 | robustness | 60 | 0.980 | 0.996 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.750 | robustness | 60 | 0.804 | 0.848 |
| 0.010 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.861 | robustness | 60 | 0.904 | 0.935 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.716 | robustness | 60 | 0.772 | 0.820 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.938 | robustness | 60 | 0.968 | 0.984 |
| 0.010 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.938 | robustness | 60 | 0.968 | 0.984 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.729 | robustness | 60 | 0.784 | 0.831 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.010 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.750 | robustness | 60 | 0.804 | 0.848 |
| 0.010 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.703 | robustness | 60 | 0.760 | 0.809 |
| 0.015 | A hazard | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.015 | A frequency-based | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.015 | A success-based | 1000 | 0.700 | 0.986 | expA | 60 | 0.993 | 0.997 |
| 0.015 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.015 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.032 | expB | 60 | 0.080 | 0.188 |
| 0.015 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.751 | expB | 60 | 0.778 | 0.803 |
| 0.015 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.903 | expB | 60 | 0.940 | 0.963 |
| 0.015 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.865 | expB | 60 | 0.960 | 0.989 |
| 0.015 | B power_law beta=missing m=2 | 250 | 0.700 | 0.599 | expB | 60 | 0.660 | 0.716 |
| 0.015 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.015 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.015 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.960 | expB | 60 | 0.984 | 0.994 |
| 0.015 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.530 | expC | 60 | 0.561 | 0.591 |
| 0.015 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.712 | expC | 60 | 0.740 | 0.766 |
| 0.015 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.996 | expC | 60 | 1.000 | 1.000 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.649 | expC | 60 | 0.708 | 0.761 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.825 | expC | 60 | 0.872 | 0.908 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.975 | expC | 60 | 0.985 | 0.991 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.865 | expC | 60 | 0.960 | 0.989 |
| 0.015 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.015 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.004 | expC | 60 | 0.020 | 0.105 |
| 0.015 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.116 | expC | 60 | 0.156 | 0.206 |
| 0.015 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.407 | expC | 60 | 0.468 | 0.530 |
| 0.015 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.109 | expC | 60 | 0.148 | 0.197 |
| 0.015 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.628 | expC | 60 | 0.688 | 0.742 |
| 0.015 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.866 | expC | 60 | 0.908 | 0.938 |
| 0.015 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.960 | expC | 60 | 0.984 | 0.994 |
| 0.015 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.812 | expC | 60 | 0.920 | 0.968 |
| 0.015 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.894 | expC | 60 | 0.932 | 0.957 |
| 0.015 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.928 | expC | 60 | 0.960 | 0.978 |
| 0.015 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.015 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.015 | D small_world seed=random | 250 | 0.700 | 0.703 | expD | 60 | 0.760 | 0.809 |
| 0.015 | D power_law seed=random | 250 | 0.700 | 0.349 | expD | 60 | 0.408 | 0.470 |
| 0.015 | D small_world seed=high_degree | 250 | 0.700 | 0.965 | expD | 60 | 0.988 | 0.996 |
| 0.015 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.015 | D small_world seed=bridge | 1000 | 0.700 | 0.983 | expD | 60 | 0.991 | 0.995 |
| 0.015 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.015 | D small_world seed=clustered | 250 | 0.700 | 0.307 | expD | 60 | 0.364 | 0.425 |
| 0.015 | D power_law seed=clustered | 250 | 0.700 | 0.653 | expD | 60 | 0.712 | 0.765 |
| 0.015 | E seed=random pioneer=random | 1000 | 0.700 | 0.797 | expE | 60 | 0.822 | 0.844 |
| 0.015 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.015 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.984 | expE | 60 | 0.992 | 0.996 |
| 0.015 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.366 | robustness | 60 | 0.500 | 0.634 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.870 | robustness | 60 | 0.912 | 0.941 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.965 | robustness | 60 | 0.988 | 0.996 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.056 | robustness | 60 | 0.120 | 0.238 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.960 | robustness | 60 | 0.984 | 0.994 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.943 | robustness | 60 | 0.972 | 0.986 |
| 0.015 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.742 | robustness | 60 | 0.796 | 0.841 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.763 | robustness | 60 | 0.816 | 0.859 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.742 | robustness | 60 | 0.796 | 0.841 |
| 0.015 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.011 | robustness | 60 | 0.040 | 0.135 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.191 | robustness | 60 | 0.300 | 0.438 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.695 | robustness | 60 | 0.752 | 0.801 |
| 0.015 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.895 | robustness | 60 | 0.980 | 0.996 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.750 | robustness | 60 | 0.804 | 0.848 |
| 0.015 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.861 | robustness | 60 | 0.904 | 0.935 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.703 | robustness | 60 | 0.760 | 0.809 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.933 | robustness | 60 | 0.964 | 0.981 |
| 0.015 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.938 | robustness | 60 | 0.968 | 0.984 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.712 | robustness | 60 | 0.768 | 0.816 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.015 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.746 | robustness | 60 | 0.800 | 0.845 |
| 0.015 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.699 | robustness | 60 | 0.756 | 0.805 |
| 0.020 | A hazard | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.020 | A frequency-based | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.020 | A success-based | 1000 | 0.700 | 0.978 | expA | 60 | 0.987 | 0.992 |
| 0.020 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.020 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.021 | expB | 60 | 0.060 | 0.162 |
| 0.020 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.503 | expB | 60 | 0.534 | 0.565 |
| 0.020 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.834 | expB | 60 | 0.880 | 0.915 |
| 0.020 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.865 | expB | 60 | 0.960 | 0.989 |
| 0.020 | B power_law beta=missing m=2 | 250 | 0.700 | 0.599 | expB | 60 | 0.660 | 0.716 |
| 0.020 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.020 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.020 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.960 | expB | 60 | 0.984 | 0.994 |
| 0.020 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.223 | expC | 60 | 0.249 | 0.277 |
| 0.020 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.422 | expC | 60 | 0.453 | 0.484 |
| 0.020 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.984 | expC | 60 | 0.992 | 0.996 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.364 | expC | 60 | 0.424 | 0.486 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.567 | expC | 60 | 0.628 | 0.686 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.861 | expC | 60 | 0.882 | 0.901 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.838 | expC | 60 | 0.940 | 0.979 |
| 0.020 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.020 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.004 | expC | 60 | 0.020 | 0.105 |
| 0.020 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.031 | expC | 60 | 0.052 | 0.087 |
| 0.020 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.141 | expC | 60 | 0.184 | 0.237 |
| 0.020 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.092 | expC | 60 | 0.128 | 0.175 |
| 0.020 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.235 | expC | 60 | 0.288 | 0.347 |
| 0.020 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.612 | expC | 60 | 0.672 | 0.727 |
| 0.020 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.803 | expC | 60 | 0.852 | 0.891 |
| 0.020 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.762 | expC | 60 | 0.880 | 0.944 |
| 0.020 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.763 | expC | 60 | 0.816 | 0.859 |
| 0.020 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.875 | expC | 60 | 0.916 | 0.944 |
| 0.020 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.020 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.929 | expC | 60 | 1.000 | 1.000 |
| 0.020 | D small_world seed=random | 250 | 0.700 | 0.454 | expD | 60 | 0.516 | 0.577 |
| 0.020 | D power_law seed=random | 250 | 0.700 | 0.349 | expD | 60 | 0.408 | 0.470 |
| 0.020 | D small_world seed=high_degree | 250 | 0.700 | 0.843 | expD | 60 | 0.888 | 0.921 |
| 0.020 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.020 | D small_world seed=bridge | 1000 | 0.700 | 0.870 | expD | 60 | 0.891 | 0.909 |
| 0.020 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.020 | D small_world seed=clustered | 250 | 0.700 | 0.144 | expD | 60 | 0.188 | 0.241 |
| 0.020 | D power_law seed=clustered | 250 | 0.700 | 0.653 | expD | 60 | 0.712 | 0.765 |
| 0.020 | E seed=random pioneer=random | 1000 | 0.700 | 0.534 | expE | 60 | 0.565 | 0.595 |
| 0.020 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.020 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.912 | expE | 60 | 0.930 | 0.944 |
| 0.020 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.996 | expE | 60 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.098 | robustness | 60 | 0.180 | 0.308 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.579 | robustness | 60 | 0.640 | 0.697 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.861 | robustness | 60 | 0.904 | 0.935 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.021 | robustness | 60 | 0.060 | 0.162 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.847 | robustness | 60 | 0.892 | 0.925 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.807 | robustness | 60 | 0.856 | 0.894 |
| 0.020 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.431 | robustness | 60 | 0.492 | 0.554 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.510 | robustness | 60 | 0.572 | 0.632 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.454 | robustness | 60 | 0.516 | 0.577 |
| 0.020 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.004 | robustness | 60 | 0.020 | 0.105 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.043 | robustness | 60 | 0.100 | 0.214 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.490 | robustness | 60 | 0.552 | 0.612 |
| 0.020 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.838 | robustness | 60 | 0.940 | 0.979 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.454 | robustness | 60 | 0.516 | 0.577 |
| 0.020 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.803 | robustness | 60 | 0.852 | 0.891 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.419 | robustness | 60 | 0.480 | 0.542 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.759 | robustness | 60 | 0.812 | 0.856 |
| 0.020 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.794 | robustness | 60 | 0.844 | 0.884 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.419 | robustness | 60 | 0.480 | 0.542 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.020 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.442 | robustness | 60 | 0.504 | 0.565 |
| 0.020 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.575 | robustness | 60 | 0.636 | 0.693 |
| 0.025 | A hazard | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.025 | A frequency-based | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.025 | A success-based | 1000 | 0.700 | 0.872 | expA | 60 | 0.893 | 0.911 |
| 0.025 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.025 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.135 | expB | 60 | 0.156 | 0.180 |
| 0.025 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.563 | expB | 60 | 0.624 | 0.682 |
| 0.025 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.604 | expB | 60 | 0.740 | 0.841 |
| 0.025 | B power_law beta=missing m=2 | 250 | 0.700 | 0.587 | expB | 60 | 0.648 | 0.705 |
| 0.025 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.812 | expB | 60 | 0.920 | 0.968 |
| 0.025 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.895 | expB | 60 | 0.980 | 0.996 |
| 0.025 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.865 | expB | 60 | 0.960 | 0.989 |
| 0.025 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.786 | expB | 60 | 0.900 | 0.957 |
| 0.025 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.025 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.870 | expB | 60 | 0.912 | 0.941 |
| 0.025 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.033 | expC | 60 | 0.044 | 0.059 |
| 0.025 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.097 | expC | 60 | 0.115 | 0.136 |
| 0.025 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.853 | expC | 60 | 0.875 | 0.894 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.089 | expC | 60 | 0.124 | 0.171 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.162 | expC | 60 | 0.208 | 0.263 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.468 | expC | 60 | 0.499 | 0.530 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.462 | expC | 60 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.025 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.015 |
| 0.025 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.014 | expC | 60 | 0.028 | 0.057 |
| 0.025 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.028 | expC | 60 | 0.048 | 0.082 |
| 0.025 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.009 | expC | 60 | 0.020 | 0.046 |
| 0.025 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.213 | expC | 60 | 0.264 | 0.322 |
| 0.025 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.423 | expC | 60 | 0.484 | 0.546 |
| 0.025 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.462 | expC | 60 | 0.600 | 0.724 |
| 0.025 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.458 | expC | 60 | 0.520 | 0.581 |
| 0.025 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.583 | expC | 60 | 0.644 | 0.701 |
| 0.025 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.838 | expC | 60 | 0.940 | 0.979 |
| 0.025 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.838 | expC | 60 | 0.940 | 0.979 |
| 0.025 | D small_world seed=random | 250 | 0.700 | 0.102 | expD | 60 | 0.140 | 0.188 |
| 0.025 | D power_law seed=random | 250 | 0.700 | 0.334 | expD | 60 | 0.392 | 0.454 |
| 0.025 | D small_world seed=high_degree | 250 | 0.700 | 0.415 | expD | 60 | 0.476 | 0.538 |
| 0.025 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.025 | D small_world seed=bridge | 1000 | 0.700 | 0.466 | expD | 60 | 0.497 | 0.528 |
| 0.025 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.025 | D small_world seed=clustered | 250 | 0.700 | 0.022 | expD | 60 | 0.040 | 0.072 |
| 0.025 | D power_law seed=clustered | 250 | 0.700 | 0.645 | expD | 60 | 0.704 | 0.757 |
| 0.025 | E seed=random pioneer=random | 1000 | 0.700 | 0.164 | expE | 60 | 0.187 | 0.212 |
| 0.025 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.974 | expE | 60 | 0.984 | 0.990 |
| 0.025 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.593 | expE | 60 | 0.623 | 0.653 |
| 0.025 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.990 | expE | 60 | 0.996 | 0.998 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.137 | robustness | 60 | 0.180 | 0.232 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.458 | robustness | 60 | 0.520 | 0.581 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.474 | robustness | 60 | 0.536 | 0.597 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.435 | robustness | 60 | 0.496 | 0.558 |
| 0.025 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.085 | robustness | 60 | 0.120 | 0.166 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.141 | robustness | 60 | 0.184 | 0.237 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.130 | robustness | 60 | 0.172 | 0.224 |
| 0.025 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.004 | robustness | 60 | 0.020 | 0.105 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.021 | robustness | 60 | 0.060 | 0.162 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.113 | robustness | 60 | 0.152 | 0.202 |
| 0.025 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.562 | robustness | 60 | 0.700 | 0.809 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.120 | robustness | 60 | 0.160 | 0.211 |
| 0.025 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.514 | robustness | 60 | 0.576 | 0.636 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.096 | robustness | 60 | 0.132 | 0.180 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.307 | robustness | 60 | 0.364 | 0.425 |
| 0.025 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.273 | robustness | 60 | 0.328 | 0.388 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.096 | robustness | 60 | 0.132 | 0.180 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.025 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.120 | robustness | 60 | 0.160 | 0.211 |
| 0.025 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.180 | robustness | 60 | 0.228 | 0.284 |
| 0.030 | A hazard | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.030 | A frequency-based | 50 | 0.700 | 0.000 | expA | 60 | 0.000 | 0.071 |
| 0.030 | A success-based | 1000 | 0.700 | 0.574 | expA | 60 | 0.605 | 0.635 |
| 0.030 | B small_world beta=0.001 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.005 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.01 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.05 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.1 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.2 m=missing | 50 | 0.700 | 0.000 | expB | 60 | 0.000 | 0.071 |
| 0.030 | B small_world beta=0.4 m=missing | 1000 | 0.700 | 0.020 | expB | 60 | 0.029 | 0.041 |
| 0.030 | B small_world beta=0.7 m=missing | 250 | 0.700 | 0.210 | expB | 60 | 0.260 | 0.318 |
| 0.030 | B small_world beta=1.0 m=missing | 50 | 0.700 | 0.208 | expB | 60 | 0.320 | 0.458 |
| 0.030 | B power_law beta=missing m=2 | 250 | 0.700 | 0.514 | expB | 60 | 0.576 | 0.636 |
| 0.030 | B degree_matched_random beta=missing m=2 | 50 | 0.700 | 0.542 | expB | 60 | 0.680 | 0.792 |
| 0.030 | B power_law beta=missing m=3 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=3 | 50 | 0.700 | 0.604 | expB | 60 | 0.740 | 0.841 |
| 0.030 | B power_law beta=missing m=5 | 1000 | 0.700 | 0.996 | expB | 60 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=5 | 50 | 0.700 | 0.501 | expB | 60 | 0.640 | 0.759 |
| 0.030 | B power_law beta=missing m=8 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=8 | 50 | 0.700 | 0.542 | expB | 60 | 0.680 | 0.792 |
| 0.030 | B power_law beta=missing m=12 | 50 | 0.700 | 0.929 | expB | 60 | 1.000 | 1.000 |
| 0.030 | B degree_matched_random beta=missing m=12 | 250 | 0.700 | 0.661 | expB | 60 | 0.720 | 0.772 |
| 0.030 | C homogeneous beta=0.4 vary=false | 1000 | 0.700 | 0.003 | expC | 60 | 0.006 | 0.013 |
| 0.030 | C lower_mean beta=0.4 vary=false | 1000 | 0.700 | 0.008 | expC | 60 | 0.013 | 0.022 |
| 0.030 | C higher_variance beta=0.4 vary=false | 1000 | 0.700 | 0.536 | expC | 60 | 0.567 | 0.597 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=false | 250 | 0.700 | 0.009 | expC | 60 | 0.020 | 0.046 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=false | 250 | 0.700 | 0.011 | expC | 60 | 0.024 | 0.051 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=false | 1000 | 0.700 | 0.156 | expC | 60 | 0.179 | 0.204 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=false | 50 | 0.700 | 0.128 | expC | 60 | 0.220 | 0.352 |
| 0.030 | C mixture pi=0.01 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.05 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.05 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.1 beta=0.1 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.01 beta=0.2 vary=true | 50 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.071 |
| 0.030 | C mixture pi=0.03 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.05 beta=0.2 vary=true | 250 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.1 beta=0.2 vary=true | 250 | 0.700 | 0.002 | expC | 60 | 0.008 | 0.029 |
| 0.030 | C mixture pi=0.01 beta=0.4 vary=true | 250 | 0.700 | 0.000 | expC | 60 | 0.000 | 0.015 |
| 0.030 | C mixture pi=0.03 beta=0.4 vary=true | 250 | 0.700 | 0.034 | expC | 60 | 0.056 | 0.092 |
| 0.030 | C mixture pi=0.05 beta=0.4 vary=true | 250 | 0.700 | 0.079 | expC | 60 | 0.112 | 0.157 |
| 0.030 | C mixture pi=0.1 beta=0.4 vary=true | 50 | 0.700 | 0.098 | expC | 60 | 0.180 | 0.308 |
| 0.030 | C mixture pi=0.01 beta=0.7 vary=true | 250 | 0.700 | 0.130 | expC | 60 | 0.172 | 0.224 |
| 0.030 | C mixture pi=0.03 beta=0.7 vary=true | 250 | 0.700 | 0.235 | expC | 60 | 0.288 | 0.347 |
| 0.030 | C mixture pi=0.05 beta=0.7 vary=true | 50 | 0.700 | 0.522 | expC | 60 | 0.660 | 0.776 |
| 0.030 | C mixture pi=0.1 beta=0.7 vary=true | 50 | 0.700 | 0.542 | expC | 60 | 0.680 | 0.792 |
| 0.030 | D small_world seed=random | 250 | 0.700 | 0.011 | expD | 60 | 0.024 | 0.051 |
| 0.030 | D power_law seed=random | 250 | 0.700 | 0.269 | expD | 60 | 0.324 | 0.384 |
| 0.030 | D small_world seed=high_degree | 250 | 0.700 | 0.099 | expD | 60 | 0.136 | 0.184 |
| 0.030 | D power_law seed=high_degree | 1000 | 0.700 | 0.996 | expD | 60 | 1.000 | 1.000 |
| 0.030 | D small_world seed=bridge | 1000 | 0.700 | 0.124 | expD | 60 | 0.144 | 0.167 |
| 0.030 | D power_law seed=bridge | 50 | 0.700 | 0.929 | expD | 60 | 1.000 | 1.000 |
| 0.030 | D small_world seed=clustered | 250 | 0.700 | 0.002 | expD | 60 | 0.008 | 0.029 |
| 0.030 | D power_law seed=clustered | 250 | 0.700 | 0.567 | expD | 60 | 0.628 | 0.686 |
| 0.030 | E seed=random pioneer=random | 1000 | 0.700 | 0.021 | expE | 60 | 0.030 | 0.043 |
| 0.030 | E seed=random pioneer=hub_bridge | 1000 | 0.700 | 0.831 | expE | 60 | 0.854 | 0.875 |
| 0.030 | E seed=hub_bridge pioneer=random | 1000 | 0.700 | 0.217 | expE | 60 | 0.243 | 0.271 |
| 0.030 | E seed=hub_bridge pioneer=hub_bridge | 1000 | 0.700 | 0.924 | expE | 60 | 0.940 | 0.953 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=1.5 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.25 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=2.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.019 | robustness | 60 | 0.036 | 0.067 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=3.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.120 | robustness | 60 | 0.160 | 0.211 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=5.0 digital_growth_sd=1.0 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.25 | 250 | 0.700 | 0.120 | robustness | 60 | 0.160 | 0.211 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=0.75 | 250 | 0.700 | 0.144 | robustness | 60 | 0.188 | 0.241 |
| 0.030 | F robustness_axis=premium_sigma premium_ratio=10.0 digital_growth_sd=1.0 | 250 | 0.700 | 0.009 | robustness | 60 | 0.020 | 0.046 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.6499999999999999 | 250 | 0.700 | 0.016 | robustness | 60 | 0.032 | 0.062 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.7 | 250 | 0.700 | 0.004 | robustness | 60 | 0.012 | 0.035 |
| 0.030 | F robustness_axis=theta_mean digital_growth_sd=1.0 theta_sweep=0.75 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.003 | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.006 | 250 | 0.700 | 0.011 | robustness | 60 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=seed_fraction digital_growth_sd=1.0 seed_fraction_sweep=0.012 | 50 | 0.700 | 0.312 | robustness | 60 | 0.440 | 0.577 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=synchronous | 250 | 0.700 | 0.009 | robustness | 60 | 0.020 | 0.046 |
| 0.030 | F robustness_axis=update_schedule digital_growth_sd=1.0 update_schedule=asynchronous | 250 | 0.700 | 0.221 | robustness | 60 | 0.272 | 0.330 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=normal | 250 | 0.700 | 0.019 | robustness | 60 | 0.036 | 0.067 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=truncated_normal | 250 | 0.700 | 0.069 | robustness | 60 | 0.100 | 0.143 |
| 0.030 | F robustness_axis=return_distribution digital_growth_sd=1.0 return_distribution_sweep=lognormal | 250 | 0.700 | 0.052 | robustness | 60 | 0.080 | 0.120 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=own | 250 | 0.700 | 0.011 | robustness | 60 | 0.024 | 0.051 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=mean | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=median | 50 | 0.700 | 0.000 | robustness | 60 | 0.000 | 0.071 |
| 0.030 | F robustness_axis=performance_benchmark digital_growth_sd=1.0 performance_benchmark_sweep=p75 | 50 | 0.700 | 0.929 | robustness | 60 | 1.000 | 1.000 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=absorbing | 250 | 0.700 | 0.004 | robustness | 60 | 0.012 | 0.035 |
| 0.030 | F robustness_axis=abandonment digital_growth_sd=1.0 abandonment_sweep=nonabsorbing | 250 | 0.700 | 0.034 | robustness | 60 | 0.056 | 0.092 |
