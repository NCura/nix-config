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
      "docker"
    ];
  };

  services.getty = {
    autologinUser = "${user}";
    autologinOnce = true;
  };

  # nix.extraOptions = ''
  #   trusted-users = root nicolas
  #   extra-substituters = https://devenv.cachix.org;
  #   extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=;
  # '';
  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${user} = {...}: {
      imports = [
        ../shared

        ../home-manager/bash.nix
        ../home-manager/dropbox.nix
        ../home-manager/files
        ../home-manager/gitui.nix
        ../home-manager/hyprland
        ../home-manager/mouseless.nix
        ../home-manager/obs.nix
        ../home-manager/qutebrowser.nix
        ../home-manager/ranger.nix
        ../home-manager/rofi
        ../home-manager/swappy.nix
        ../home-manager/swaync.nix
        ../home-manager/tmux.nix
        ../home-manager/waybar
        # ../home-manager/zellij.nix
        ../home-manager/zoxide.nix

        ../home-manager/default-applications.nix
        ../home-manager/gtk-qt.nix
        ../home-manager/others.nix
        ../home-manager/packages.nix
        ../home-manager/stylix-targets.nix
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
