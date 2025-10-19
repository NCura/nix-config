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
      home = {
        stateVersion = "23.11";
        username = "${user}";
        homeDirectory = "/home/${user}";
      };
    };
  };
}
