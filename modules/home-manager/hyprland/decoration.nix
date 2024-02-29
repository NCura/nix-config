{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      "decoration" = {
        rounding = "5";
    
        blur = {
            enabled = "true";
            size = 3;
            passes = 1;
        };
    
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
    };
  };
}