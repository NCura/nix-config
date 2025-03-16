{
  wayland.windowManager.hyprland = {
    settings = {
      "general" = {
        gaps_in = 2;
        gaps_out = 0;
        border_size = 2;
        # "col.active_border" = "rgb(deb887)";
        # "col.inactive_border" = "rgb(595959)";

        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      "dwindle" = {
        # default_split_ratio = 0.33;
        # split_width_multiplier = 1;
      };
    };
  };
}
