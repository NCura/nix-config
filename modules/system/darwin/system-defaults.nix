{
  config,
  pkgs,
  ...
}: {
  system.defaults = {
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
}