module Misfits

using Agents
using CSV
using DataFrames
using Dates
using Distributions
using Graphs
using Pkg
using Printf
using ProgressMeter
using Random
using Statistics
using StatsBase

include("thresholds.jl")
include("networks.jl")
include("seeding.jl")
include("model.jl")
include("metrics.jl")
include("experiments.jl")
include("figures.jl")

export Firm,
    ModelParams,
    build_network,
    draw_thresholds,
    seed_count_from_fraction,
    choose_seeds,
    choose_pioneers,
    make_model,
    model_step!,
    adoption_fraction,
    run_model,
    run_parameter_grid,
    summarize_runs,
    parse_common_args,
    quick_settings,
    full_settings,
    write_sidecar_json,
    ensure_output_dirs,
    make_publication_figures

end
