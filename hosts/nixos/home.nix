{
  imports = [
    ./../../modules/home-manager/bash
    ./../../modules/home-manager/fastfetch
    ./../../modules/home-manager/files
    ./../../modules/home-manager/git
    ./../../modules/home-manager/hyprland
    ./../../modules/home-manager/kitty
    ./../../modules/home-manager/neovim
    ./../../modules/home-manager/obs
    ./../../modules/home-manager/oh-my-posh
    # ./../../modules/home-manager/qutebrowser
    ./../../modules/home-manager/ranger
    ./../../modules/home-manager/rofi
    ./../../modules/home-manager/swappy
    ./../../modules/home-manager/swaync
    # ./../../modules/home-manager/tmux
    ./../../modules/home-manager/waybar
    # ./../../modules/home-manager/zellij
    ./../../modules/home-manager/zoxide

    ./../../modules/home-manager/default-applications.nix
    ./../../modules/home-manager/gtk-qt.nix
    ./../../modules/home-manager/others.nix
    ./../../modules/home-manager/packages.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
  home.username = "nicolas";
  home.homeDirectory = "/home/nicolas";
}
