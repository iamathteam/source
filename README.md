# IA Math Team Source

Source code for all our slides, worksheet, etc.

This GitHub repository is linked to an Overleaf project (the owner of which must have Overleaf Premium; typically via GT Dual Enrollment)

## Local LaTeX workflow

Install Nix with flakes enabled, then run `nix develop` from the repository root.
Alternatively, with direnv installed, run `direnv allow` once to enter the shell
when you open the directory. The shell supplies LaTeX, `latexmk`, and `just`.
Before the new flake files are tracked by Git, use `nix develop "path:$PWD"`
instead of `nix develop`.

Give each command a path to a `.tex` file, relative to the repository root
(or an absolute path). Builds run in the source's directory, so relative images
and other inputs resolve as they do in the document. PDFs are written beside
their source.

- `just texc 2026/10.30/main.tex` builds `main.pdf`.
- `just texc 2026/10.30/main.tex stations` builds `stations.pdf` instead.
- `just texw 2026/10.30/main.tex stations` watches and rebuilds `stations.pdf`.
- `just clean 2026/10.30/main.tex stations` removes auxiliary files for that
  output, keeping the PDF. Omit `stations` when cleaning a default-named build.

The optional second argument is a PDF base name, not a path or a filename
with `.pdf`. Use the same name for build, watch, and clean.

Some older documents may need additional TeX packages or external tools.
