using Misfits

root = dirname(dirname(@__FILE__))
Misfits.make_publication_figures(
    result_dir = joinpath(root, "results"),
    figdir = joinpath(root, "figures"),
)
