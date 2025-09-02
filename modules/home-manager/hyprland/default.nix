{
  pkgs,
  inputs,
  ...
}: let
  startupScriptPath = ./startup.sh;
  startupScript = pkgs.writeScriptBin "startup-hyprland" (builtins.readFile startupScriptPath);
in {
  imports = [
    ./animations.nix
    ./decoration.nix
    ./general.nix
    ./input.nix
    ./keybinds.nix
    ./misc.nix

    #./plugins/border-plus-plus.nix
    ./plugins/pyprland.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      exec-once = [
        "${startupScript}/bin/startup-hyprland"
        # "[workspace 3 silent] vivaldi"
        # "[workspace 8 silent] discord"
        "hypridle"
        "pypr"
      ];
      monitor = [
        # "DP-3, modeline 6511.45 7680 8416 9288 10896 2160 2161 2164 2490 +hsync -vsync, auto, auto"
        # "DP-3, 7680x2160@240, auto, auto"
        ", highres, auto, 1"
      ];
    };
    extraConfig = ''
      # exec-once = swaybg -c 0b1826 &
      exec-once = $POLKIT_BIN
      exec-once = dbus-update-activation-environment --systemd --all
      exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      windowrulev2 = float,class:^(?i)chat$
      # windowrulev2 = float, title:NC
      windowrulev2 = size 2560 1440, title:NC
      windowrulev2 = move 2560 360, title:NC
    '';
  };

  home.packages = with pkgs; [
    swaybg
    hyprpicker
    # hyprpaper
    # hypridle
    # hyprlock
    # hyprcursor
  ];

  # environment.systemPackages = with pkgs; [
  #   hypridle
  #   hyprlock
  #   hyprcursor
  # ];

  home.file = {
    # ".config/hypr/hyprpaper.conf".source = ./plugins/hyprpaper.conf;
    # ".config/hypr/hypridle.conf".source = ./plugins/hypridle.conf;
  };
}
