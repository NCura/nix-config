{
  config,
  pkgs,
  inputs,
  ...
}: let
  system = ../../modules/system/nixos;
  shared = ../../modules/home-manager/shared;
  linux = ../../modules/home-manager/linux;
in {
  imports = [
    ./hardware-configuration.nix
    (system + /aliases.nix)
    (system + /app-images.nix)
    (system + /audio.nix)
    (system + /bluetooth.nix)
    (system + /boot.nix)
    (system + /docker.nix)
    (system + /graphics.nix)
    (system + /home-manager.nix)
    (system + /internationalisation.nix)
    (system + /jellyfin.nix)
    (system + /liquidctl.nix)
    (system + /networking.nix)
    (system + /nix-settings.nix)
    # (system + /ollama.nix)
    (system + /openvpn.nix)
    (system + /polkit.nix)
    (system + /printing.nix)
    (system + /programs.nix)
    (system + /security.nix)
    (system + /session-variables.nix)
    (system + /steam.nix)
    (system + /stylix.nix)
    (system + /system.nix)
    (system + /system-packages.nix)
    (system + /virtualization.nix)
    (system + /wireguard-client.nix)
    (system + /wordpress.nix)
    (system + /xdg-portal.nix)
  ];

  home-manager.users.nicolas.imports = [
    (shared + /fastfetch)
    (shared + /git)
    (shared + /kitty)
    (shared + /neovim)
    (shared + /oh-my-posh)
    (shared + /packages.nix)

    (linux + /bash.nix)
    (linux + /default-applications.nix)
    (linux + /dropbox.nix)
    (linux + /files)
    (linux + /gitui.nix)
    (linux + /gtk-qt.nix)
    (linux + /hyprland)
    (linux + /mouseless.nix)
    (linux + /obs.nix)
    (linux + /others.nix)
    (linux + /packages.nix)
    (linux + /qutebrowser.nix)
    (linux + /ranger.nix)
    (linux + /rofi)
    (linux + /stylix-targets.nix)
    (linux + /swappy.nix)
    (linux + /swaync.nix)
    (linux + /waybar)
    # (shared + /zellij.nix)
  ];
}
