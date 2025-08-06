{
  pkgs,
  inputs,
  ...
}: {
  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && sway
  '';

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty";
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
      ];
      input."*" = {
        xkb_layout = "us, us";
        kb_variant = "basic, intl";
        kb_options = "grp:win_space_toggle";
        xkb_numlock = true;
      };
      keybindings = ''

      '';
    };
  };
}
