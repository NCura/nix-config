{inputs, ...}: let
  user = "nicolas";
in {
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
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${user} = {...}: {
      imports = [
        ../shared

        ../home-manager/bash
        ../home-manager/files
        ../home-manager/hyprland
        ../home-manager/obs
        # ./../../modules/home-manager/qutebrowser
        ../home-manager/ranger
        ../home-manager/rofi
        ../home-manager/swappy
        ../home-manager/swaync
        # ./../../modules/home-manager/tmux
        ../home-manager/waybar
        # ./../../modules/home-manager/zellij
        ../home-manager/zoxide

        ../home-manager/default-applications.nix
        ../home-manager/gtk-qt.nix
        ../home-manager/others.nix
        ../home-manager/packages.nix
      ];
      home = {
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
