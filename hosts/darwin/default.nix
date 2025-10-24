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
    (homeShared + /atuin)
    (homeShared + /bash)
    (homeShared + /bat)
    (homeShared + /btop)
    (homeShared + /claude-code)
    (homeShared + /dircolors)
    (homeShared + /direnv)
    (homeShared + /eza)
    (homeShared + /fastfetch)
    (homeShared + /fd)
    (homeShared + /fzf)
    (homeShared + /ghostty)
    (homeShared + /git)
    (homeShared + /htop)
    (homeShared + /jq)
    (homeShared + /kitty)
    (homeShared + /neovim)
    (homeShared + /nix-search.nix)
    (homeShared + /oh-my-posh)
    (homeShared + /ripgrep)
    (homeShared + /ssh.nix)
  ];
}
