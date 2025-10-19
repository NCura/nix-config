{
  config,
  pkgs,
  ...
}:
{
  # User-wide packages managed through Homebrew
  homebrew = {
    enable = true;

    # Homebrew casks (GUI applications)
    casks = [
      "discord"
      "dropbox"
      "caffeine"
      "whatsapp"
      "notion"
      "unity-hub"
      "docker-desktop"
    ];

    # Homebrew formulae (CLI tools)
    brews = [
      # Add CLI tools here
      # Example:
      # "git"
      # "curl"
    ];

    # Mac App Store applications
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
    masApps = {
      # Example:
      # "1password" = 1333542190;
      # "wireguard" = 1451685025;
    };

    # onActivation.cleanup = "uninstall";
  };
}
