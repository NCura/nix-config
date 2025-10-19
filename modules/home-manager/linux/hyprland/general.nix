{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      "general" = {
        gaps_in = 3;
        gaps_out = 0;
        border_size = 3;
        "col.active_border" = lib.mkForce "rgb(e6c9a6)";
        "col.inactive_border" = lib.mkForce "rgb(61594e)";

        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
        "snap" = {
          enabled = true;
        };
      };

      "dwindle" = {
        # default_split_ratio = 0.33;
        # split_width_multiplier = 1;
      };
    };
  };
}
