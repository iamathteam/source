set shell := ["bash", "-cu"]
set positional-arguments := true

# Show available commands.
default:
    @just --list

# Compile a LaTeX source; optionally give the PDF a different base name.
# Example: just texc 2026/10.30/main.tex stations
texc source name="":
    args=(); if [[ -n "$2" ]]; then args+=("-jobname=$2"); fi; latexmk -cd -pdf -interaction=nonstopmode -halt-on-error "${args[@]}" "$1"

# Watch a source and its dependencies, rebuilding when they change.
texw source name="":
    args=(); if [[ -n "$2" ]]; then args+=("-jobname=$2"); fi; latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -pvc "${args[@]}" "$1"

# Remove auxiliary files, keeping the PDF. Use the same name as for texc.
clean source name="":
    args=(); if [[ -n "$2" ]]; then args+=("-jobname=$2"); fi; latexmk -cd -c "${args[@]}" "$1"
