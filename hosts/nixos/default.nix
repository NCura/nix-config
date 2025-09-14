{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/aliases.nix
    ../../modules/nixos/app-images.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/graphics.nix
    ../../modules/nixos/internationalisation.nix
    ../../modules/nixos/jellyfin.nix
    ../../modules/nixos/home-manager.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/nix-settings.nix
    # ../../modules/nixos/ollama.nix
    ../../modules/nixos/liquidctl.nix
    ../../modules/nixos/openvpn.nix
    ../../modules/nixos/polkit.nix
    ../../modules/nixos/printing.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/session-variables.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/system-packages.nix
    ../../modules/nixos/virtualization.nix
    ../../modules/nixos/wordpress.nix
    ../../modules/nixos/xdg-portal.nix

    ../../modules/shared/email
    ../../modules/shared/thunar
    # ../../modules/shared/packages.nix
    ../../modules/nixos/docker.nix
  ];
}
