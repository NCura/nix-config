{
  config,
  pkgs,
  inputs,
  ...
}: let
  system = ../../modules/system/nixos;
  hm = ../../modules/home-manager;
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
    (hm + /shared)

    (hm + /linux/bash.nix)
    (hm + /linux/default-applications.nix)
    (hm + /linux/dropbox.nix)
    (hm + /linux/files)
    (hm + /linux/gitui.nix)
    (hm + /linux/gtk-qt.nix)
    (hm + /linux/hyprland)
    (hm + /linux/mouseless.nix)
    (hm + /linux/obs.nix)
    (hm + /linux/others.nix)
    (hm + /linux/packages.nix)
    (hm + /linux/qutebrowser.nix)
    (hm + /linux/ranger.nix)
    (hm + /linux/rofi)
    (hm + /linux/stylix-targets.nix)
    (hm + /linux/swappy.nix)
    (hm + /linux/swaync.nix)
    (hm + /linux/waybar)
    # (hm + /shared/zellij.nix)
  ];
}
