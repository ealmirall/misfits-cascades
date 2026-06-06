using CSV
using DataFrames
using Misfits
using Statistics

function run_stylized_facts(; quick=false, seed=20260603)
    root = dirname(dirname(@__FILE__))
    settings = quick ? quick_settings() : full_settings()
    cells = [
        (label=:slow_adoption_high_returns, family=:small_world, beta=0.05, k=settings.k, N=settings.N, threshold_treatment=:homogeneous, threshold_params=(theta_mean=settings.theta_mean,), seed_strategy=:random, seed_fraction=settings.seed_fraction, vary_network=false, network_seed=5101),
        (label=:sudden_endogenous_takeoff, family=:small_world, beta=0.2, k=settings.k, N=settings.N, threshold_treatment=:mixture, threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05), seed_strategy=:random, seed_fraction=settings.seed_fraction, pioneer_strategy=:random, vary_network=false, network_seed=5102),
        (label=:clustered_adoption, family=:small_world, beta=0.05, k=settings.k, N=settings.N, threshold_treatment=:mixture, threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05), seed_strategy=:clustered, seed_fraction=settings.seed_fraction, pioneer_strategy=:random, vary_network=false, network_seed=5103),
        (label=:visible_exemplars, family=:small_world, beta=0.2, k=settings.k, N=settings.N, threshold_treatment=:mixture, threshold_params=(theta_mean=settings.theta_mean, pi=0.05, theta_low=0.05), seed_strategy=:hub_bridge, seed_fraction=settings.seed_fraction, pioneer_strategy=:hub_bridge, vary_network=false, network_seed=5104),
    ]
    rows = Dict{Symbol,Any}[]
    curves = Dict{Symbol,Any}[]
    for (i, cell) in enumerate(cells)
        reps = settings.n_focal
        for rep in 1:reps
            row, curve = Misfits.run_single(cell, seed + 100i + rep, rep, "stylized", settings, "stylized_facts")
            row[:stylized_fact] = cell.label
            push!(rows, row)
            for c in curve
                c[:stylized_fact] = cell.label
                push!(curves, c)
            end
        end
    end
    result_dir = joinpath(root, "results")
    mkpath(result_dir)
    df = DataFrame(rows)
    CSV.write(joinpath(result_dir, "stylized_facts_runs.csv"), df)
    CSV.write(joinpath(result_dir, "stylized_facts_summary.csv"), summarize_runs(df, [:stylized_fact]))
    CSV.write(joinpath(result_dir, "stylized_facts_curves.csv"), DataFrame(curves))
end

if abspath(PROGRAM_FILE) == @__FILE__
    quick = "--quick" in ARGS
    seed = 20260603
    seed_idx = findfirst(==("--seed"), ARGS)
    if seed_idx !== nothing && seed_idx < length(ARGS)
        seed = parse(Int, ARGS[seed_idx + 1])
    end
    run_stylized_facts(; quick=quick, seed=seed)
end
