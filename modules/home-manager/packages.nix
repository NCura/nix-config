{pkgs, ...}: let
  browsers = with pkgs; [
    vivaldi
    firefox
    chromium
    opera
  ];

  ides = with pkgs; [
    vscode
    sublime4
    jetbrains.rust-rover
  ];

  myPrograms = with pkgs; [
    discord
    webcord
    obsidian
    gimp
    spotify
    whatsapp-for-linux
  ];

  hyprlandTools = with pkgs; [
    swaynotificationcenter
    libnotify
    # swayidle
    # swaylock
  ];

  audioTools = with pkgs; [
    pavucontrol
    playerctl
  ];

  webTools = with pkgs; [
    filezilla
    nmap
    postman
  ];

  others = with pkgs; [
    rsync
    libvirt
    swww
    grim
    slurp
    swappy
    (import ./files/screenshootin.nix {inherit pkgs;})
    (import ./files/web-search.nix {inherit pkgs;})
    imv
    lutris
    fontforge-fonttools
    # font-awesome

    # (import ./bazecor {
    #   inherit lib;
    #   inherit appimageTools;
    #   inherit fetchurl;
    # })
  ];

  # nvim = with pkgs; [nil];

  combinedPackages =
    browsers ++ ides ++ myPrograms ++ hyprlandTools ++ audioTools ++ webTools ++ others;
in {
  home.packages = combinedPackages;
}
