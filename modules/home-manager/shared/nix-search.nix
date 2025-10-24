{ pkgs, ... }:
let
  ns = pkgs.writeShellApplication {
    name = "ns";
    runtimeInputs = with pkgs; [
      fzf
      nix-search-tv
    ];
    text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    checkPhase = ""; # Disable shellcheck for external script
  };
in
{
  home.packages = [ ns ];
}
