{
  pkgs,
  home-manager,
  ...
}: let
  user = "nicolas";
in {
  #
  # programs.home-manager.enable = true;

  users.users.${user} = {
    name = "${user}";
    home = "/home/${user}";
    description = "Nicolas Cura";
    isNormalUser = true;
    createHome = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "qemu-libvirtd"
      "libvirt"
      "kvm"
      "wwwrun"
      "uucp"
      "plugdev"
      "ydotool"
    ];
  };

  services.getty.autologinUser = "${user}";
  # nix.extraOptions = ''
  #   trusted-users = root nicolas
  #   extra-substituters = https://devenv.cachix.org;
  #   extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=;
  # '';
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = {
      home = {
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
        stateVersion = "23.11";
        username = "${user}";
        homeDirectory = "/home/${user}";
      };
    };
    # extraSpecialArgs = {
    #   inherit inputs;
    # };
  };
}
