{
  pkgs,
  inputs,
  ...
}:
let
  system = ../../modules/system/darwin;
  systemShared = ../../modules/system/shared;
  homeShared = ../../modules/home-manager/shared;
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
  ];

  home-manager.users.nicolascura.imports = [
    (homeShared + /bash.nix)
    (homeShared + /claude-code)
    (homeShared + /fastfetch)
    (homeShared + /ghostty)
    (homeShared + /git)
    (homeShared + /kitty)
    (homeShared + /neovim-nix)
    (homeShared + /oh-my-posh)
    (homeShared + /ssh.nix)
  ];
}
