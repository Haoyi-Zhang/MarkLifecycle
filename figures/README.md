# Release-assurance diagrams

`build_figures.py` draws the ancestry and independent-reconstruction diagrams
directly with Python and Matplotlib 3.11.2. It produces font-embedded vector
PDFs without invoking TeX. The ancestry labels depict the declared worst-case
28-carrier chain; the workflow shows all seven reconstructed relations.
Neither drawing represents a new measurement.

From `artifact`, run `python figures/build_figures.py --outdir figures`.
The paper compiler also generates these figures and copies them to
`paper/figures` before compiling. Existing statistical panels retain their
own data-driven producers.
