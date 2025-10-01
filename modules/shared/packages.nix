{pkgs, ...}: {
  home.packages = with pkgs; [
    nixos-anywhere
    sops
  ];
}
