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
    ../../modules/nixos/internationalisation.nix
    ../../modules/nixos/home-manager.nix
    # ../../modules/nixos/ollama.nix
    ../../modules/nixos/polkit.nix
    ../../modules/nixos/printing.nix
    ../../modules/nixos/session-variables.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/system-packages.nix
    ../../modules/nixos/virtualization.nix
    # ../../modules/nixos/wordpress.nix
    ../../modules/nixos/xdg-portal.nix
  ];

  networking.hosts = {
    "192.168.1.73" = [
      "local-nicolascura.com"
    ];
  };

  system.stateVersion = "23.11";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [
    "kvm-amd"
    "xone"
    "v4l2loopback"
  ];
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
  # For obs
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback
    # pkgslinuxPackages_6_6.xone for xbox controller
  ];
  services.xserver.videoDrivers = ["amdgpu"];

  security.sudo.wheelNeedsPassword = false;

  boot.supportedFilesystems = ["ntfs"];
  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
    # To try to prevent "Network change detected" errors
    interfaces.eno1.useDHCP = false;
    interfaces.wlp9s0.useDHCP = false;
    interfaces.eno2.useDHCP = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
    firewall.allowedTCPPorts = [3000];
    # firewall.extraCommands = ''
    #   iptables -A INPUT -p tcp --dport 3000 -s 192.168.1.42 -j ACCEPT
    #   iptables -A INPUT -p tcp --dport 3000 -s 192.168.1.54 -j ACCEPT
    #   iptables -A INPUT -p tcp --dport 3000 -s 192.168.1.73 -j ACCEPT
    #   iptables -A INPUT -p tcp --dport 3000 -j DROP
    # '';
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  hardware.graphics = {
    enable = true;
    # driSupport = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
    extraPackages32 = [pkgs.driversi686Linux.amdvlk];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    curl
    expat
    fontconfig
    freetype
    fuse
    fuse3
    glib
    icu
    libclang.lib
    libdbusmenu
    libxcrypt-legacy
    libxml2
    nss
    openssl
    python3
    stdenv.cc.cc
    libxkbcommon
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libxcb
    xorg.libXext
    xorg.libXi
    xorg.libXrender
    xorg.libXtst
    xz
    zlib
  ];
}
