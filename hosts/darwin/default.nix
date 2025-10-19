{
  pkgs,
  inputs,
  ...
}: let
  system = ../../modules/system/darwin;
  hm = ../../modules/home-manager;
in {
  imports = [
    (system + /dock-config.nix)
    (system + /dock.nix)
    (system + /environment.nix)
    (system + /home-manager-config.nix)
    (system + /nix-settings.nix)
    (system + /packages-system.nix)
    (system + /packages-user.nix)
    (system + /security.nix)
    (system + /system-defaults.nix)
    (system + /system.nix)
    (system + /users.nix)
    (system + /wireguard-client.nix)
    (system + /zsh.nix)
  ];

  home-manager.users.nicolascura.imports = [
    (hm + /shared)

    (hm + /shared/ghostty)
  ];
}