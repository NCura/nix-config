{lib, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
        mouse_move_enables_dpms = false;
        key_press_enables_dpms = true;
        background_color = lib.mkForce "rgb(0b1826)";
        initial_workspace_tracking = 2;
        middle_click_paste = false;
      };
    };
  };
}
