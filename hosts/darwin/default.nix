{ pkgs, lib, inputs, ... }:

let user = "nicolascura"; in
 {


  imports = [
    ../../modules/darwin/home-manager.nix
  ];
      services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      trusted-users = [ "@admin" "${user}" ];
      #substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
      #trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
	experimental-features = "nix-command flakes";

    };

    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };
};

      environment.systemPackages =
        [ pkgs.vim
#pkgs.vivaldi
        ];

      # Set Git commit hash for darwin-version.
      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

      nixpkgs.hostPlatform = "aarch64-darwin";

security.pam.enableSudoTouchIdAuth = true;

  system = {
    stateVersion =5;

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        ApplePressAndHoldEnabled = false;

        KeyRepeat = 2; # Values: 120, 90, 60, 30, 12, 6, 2
        InitialKeyRepeat = 15; # Values: 120, 94, 68, 35, 25, 15

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
      };
menuExtraClock.ShowSeconds = true; 

      dock = {
        autohide = true;
mru-spaces = false;
        show-recents = false;
        launchanim = true;
        orientation = "bottom";
        tilesize = 48;
      };

      finder = {
        _FXShowPosixPathInTitle = false;
AppleShowAllExtensions = true;
AppleShowAllFiles = true;

      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };
  };
    }
