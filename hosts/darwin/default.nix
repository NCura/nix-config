{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/darwin/environment.nix
    ../../modules/darwin/home-manager.nix
    ../../modules/darwin/nix-settings.nix
    ../../modules/darwin/security.nix
    ../../modules/darwin/system.nix
    ../../modules/darwin/system-defaults.nix
    ../../modules/darwin/system-packages.nix
  ];
}