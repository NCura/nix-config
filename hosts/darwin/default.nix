{
  pkgs,
  inputs,
  ...
}:
let
  system = ../../modules/system/darwin;
  systemShared = ../../modules/system/shared;
  shared = ../../modules/home-manager/shared;
in
{
  imports = [
    (systemShared + /packages.nix)
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
    (shared + /fastfetch)
    (shared + /ghostty)
    (shared + /git)
    (shared + /kitty)
    (shared + /neovim)
    (shared + /oh-my-posh)
  ];
}
