# Replication package — Misfits-Cascades

Replication code and results for the article **"When a Few Misfits Trigger Digital Adoption Cascades: Network Reach, Threshold Heterogeneity, and Performance-Conditioned Complex Contagion in an Agent-Based Model of Firms"** (submitted to JASSS).

The model is an agent-based model of firms on an observation network that adopt a digital technology by imitating their successful neighbours. It is implemented in **Julia** using **Agents.jl** and **Graphs.jl**.

## Contents

```
src/                model code (agent, model step, networks, thresholds, seeding, metrics, experiments, figures)
scripts/            one script per experiment (A–L), calibration, topology regression, figures, stylized facts
test/               unit tests
results/            summary CSVs, per-run CSVs, and metadata JSON for Experiments A–J  (large *_curves.csv excluded — see below)
outputs/            audit, revision report, claim audit, and Experiments G–L outputs (large raw files excluded)
figures/            publication figures (PNG + PDF)
Project.toml,
Manifest.toml       exact Julia environment
README.md           original development notes
REVISION_NOTES.md   record of the revision experiments
LICENSE             MIT (code); CC BY 4.0 (data and figures)
CITATION.cff        how to cite the software and the article
```

## Large files (regenerable; excluded from this archive)

To keep the repository small, the per-period trajectory files (`*_curves.csv`) and the per-adoption files (`exposure_at_adoption.csv`) are **not** included; they total several GB and are fully regenerable. All **summary** CSVs, **per-run** CSVs, **metadata** JSON, and **figures** are included, which reproduce every number and figure in the paper. To regenerate the raw trajectories, run the scripts below. (If a full raw-output archive is needed, it can be deposited as a separate Zenodo data record.)

## Reproduce

Julia ≥ 1.10.

```bash
julia --project -e 'using Pkg; Pkg.instantiate()'
julia --project -e 'using Pkg; Pkg.test()'

# quick smoke test of all experiments (minutes):
julia --project scripts/run_all_quick.jl --seed 20260603

# paper-scale (full) runs:
julia --project scripts/run_expA_nullmodels.jl --full --seed 20260603
julia --project scripts/run_expB_topology.jl   --full --seed 20260603
# ... (Experiments C–L analogously; see scripts/)
julia --project scripts/make_figures.jl
```

Every run writes per-run, per-period, and summary CSVs plus a metadata JSON recording the master seed, per-run seeds, settings, and package versions. Figures are regenerated from the CSVs.

## How to cite

Please cite both the article and this software (see `CITATION.cff`). Replace the DOI and repository placeholders once the archive is created.

## Licence

Code: MIT. Data and figures: CC BY 4.0. See `LICENSE`.

## Publishing this package (to obtain a citable DOI)

A Dropbox folder is **not** sufficient for journal submission: it is not persistent, versioned, or citable. Use one of:

1. **GitHub + Zenodo (recommended).** Create a public GitHub repo, push this folder, then in Zenodo enable the repository and publish a release — Zenodo mints a DOI automatically and archives an immutable snapshot. Paste the DOI into `CITATION.cff`, the manuscript reproducibility appendix, the title page, and the cover letter.
2. **CoMSES Net / OpenABM** (community model registry for ABMs, recommended by JASSS): upload the model, which provides peer-reviewed archiving and a DOI.
3. **Zenodo direct upload** of the release `.zip` if you prefer not to use GitHub.

After publishing, search the manuscript and title page for the placeholder `[REPOSITORY URL` / `[ZENODO-DOI` and replace with the live links.
