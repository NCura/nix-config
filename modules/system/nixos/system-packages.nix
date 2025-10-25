{
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
    "electron-25.9.0"
    "openssl-1.1.1w" # sublime4
  ];

  nixpkgs.overlays = [
    (final: prev: {
      liquidctl = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.liquidctl;
      surrealist = prev.callPackage ./packages/surrealist.nix { };
    })
  ];

  environment.systemPackages = with pkgs; [
    # Clipboard and display (Wayland-specific)
    wl-clipboard
    wlr-randr

    # Hardware tools (Linux-specific)
    lm_sensors
    liquidctl
    v4l-utils

    # Desktop/GUI applications (Linux-specific)
    wineWowPackages.waylandFull
    bazecor
    surrealist

    # Desktop environment (Linux-specific)
    polkit_gnome

    # Kernel modules and drivers (Linux-specific)
    linuxKernel.packages.linux_6_6.xone
  ];
}
