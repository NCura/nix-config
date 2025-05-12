{
  wayland.windowManager.hyprland = {
    settings = {
      animations = {
        enabled = true;
        first_launch_animation = false;

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        # bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 0, 7, myBezier"
          # "windowsIn, 1, 7, default, popin 80%"
          # "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 0, 7, default"
          "workspaces, 0, 6, default"
        ];
      };
    };
  };
}
