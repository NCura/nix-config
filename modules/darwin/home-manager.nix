{
  inputs,
  pkgs,
  config,
  ...
}: let
  user = "nicolascura";
in {
  imports = [
    ./dock
  ];

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    # casks = pkgs.callPackage ./casks.nix {};
    casks = [
      "discord"
      "dropbox"
      "caffeine"
      "whatsapp"
      "notion"
      "unity-hub"
    ];
    # onActivation.cleanup = "uninstall";

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    # If you have previously added these apps to your Mac App Store profile (but not installed them on this system),
    # you may receive an error message "Redownload Unavailable with This Apple ID".
    # This message is safe to ignore. (https://github.com/dustinlyons/nixos-config/issues/83)
    # masApps = {
    #   "1password" = 1333542190;
    #   "wireguard" = 1451685025;
    # };
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${user} = {...}: {
      imports = [
        ../shared
        ./zsh
      ];
      home = {
        # enableNixpkgsReleaseCheck = false;
        # packages = pkgs.callPackage ./packages.nix {};
        # file = lib.mkMerge [
        #   sharedFiles
        #   additionalFiles
        # ];
        stateVersion = "23.11";
        username = "${user}";
        homeDirectory = "/Users/${user}";
      };
    };
  };

  local.dock.enable = true;
  local.dock.entries = [
    {path = "${pkgs.kitty}/Applications/Kitty.app/";}
    # {
    #   path = "${config.users.users.${user}.home}/Applications/";
    #   section = "others";
    #   options = "--sort name --view list --display folder";
    # }
    # {
    #   path = "/Applications/";
    #   section = "others";
    #   options = "--sort name --view list --display folder";
    # }
  ];
}
