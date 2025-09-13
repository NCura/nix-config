{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/darwin/dock.nix
    ../../modules/darwin/dock-config.nix
    ../../modules/darwin/environment.nix
    ../../modules/darwin/home-manager-config.nix
    ../../modules/darwin/nix-settings.nix
    ../../modules/darwin/packages-system.nix
    ../../modules/darwin/packages-user.nix
    ../../modules/darwin/security.nix
    ../../modules/darwin/system.nix
    ../../modules/darwin/system-defaults.nix
    ../../modules/darwin/users.nix
  ];
}