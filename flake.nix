{
  description = "Math team LaTeX development environment";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/0.tar.gz";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        tex = pkgs.texliveSmall.withPackages (ps: with ps; [
          amsmath animate beamer booktabs enumitem etoolbox fancyhdr
          geometry hyperref latexmk lm mathtools pgf setspace
          tikz-cd xcolor
        ]);
      in {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.just tex ];
        };
      });
}
