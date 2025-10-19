{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixfmt-tree
    sops
  ];
}
