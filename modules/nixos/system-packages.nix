{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
    "electron-25.9.0"
    "openssl-1.1.1w" # sublime4
  ];

  programs.ydotool.enable = true;
  # programs.nix-ld.enable = true;

  # To search, run: nix search wget
  environment.systemPackages = with pkgs; [
    vim
    neovim
    micro
    wget
    curl
    git
    eza
    fzf
    atuin
    bat
    zip
    unzip
    btop
    htop
    glances
    wl-clipboard
    lm_sensors
    liquidctl
    wlr-randr
    ripgrep
    sshfs
    lazygit
    ripgrep
    v4l-utils
    polkit_gnome
    linuxKernel.packages.linux_6_6.xone
    #   material-icons
    nss # for Bazecor
    nspr # for Bazecor
    atk
    psmisc # for killall
    jq # A lightweight and flexible command-line JSON processor
    openssl
    cmake
    gnumake
    gccgo
    # cargo
    # nodejs_22
    # gnome.adwaita-icon-theme
    synergy
    wineWowPackages.waylandFull
    bazecor
    trashy
    devenv
    synergy
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    symbola
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts
    noto-fonts-extra
  ];
}
