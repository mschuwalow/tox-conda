let
  fetchChannel = { rev, sha256 }: fetchTarball {
    inherit sha256;
    url = "https://github.com/NixOS/nixpkgs-channels/archive/${rev}.tar.gz";
  };
  pkgs = import (fetchChannel {
    rev = "07b42ccf2de451342982b550657636d891c4ba35";
    sha256 = "1a7ga18pwq0y4p9r787622ry8gssw1p6wsr5l7dl8pqnj1hbbzwh";
  }) { overlays = [ (import ./overlays/conda.nix) ]; };
in
pkgs.mkShell {

  buildInputs = with pkgs; [
    conda
    git
  ];

}