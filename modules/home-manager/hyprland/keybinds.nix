{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      # --------------------------------------------------------
      # MOD
      # --------------------------------------------------------

      # "$mod, Q, killactive,"
      "$mod, W, exec, pkill -SIGUSR1 waybar"
      "$mod, E, exec, pypr toggle ranger && hyprctl dispatch bringactivetotop"
      "$mod, R, exec, rofi -show drun"
      "$mod, T, exec, ghostty"
      # "$mod, Y, ,"
      # "$mod, U, ,"
      "$mod, I, exec, vivaldi"
      "$mod, O, exec, pypr toggle obsidian-nvim && hyprctl dispatch bringactivetotop"
      "$mod, P, exec, pypr toggle obsidian && hyprctl dispatch bringactivetotop"

      # "$mod, code:23, ,"
      "$mod, A, exec, web-search"
      "$mod, S, exec, screenshootin"
      "$mod, D, exec, pypr toggle chat && hyprctl dispatch bringactivetotop"
      "$mod, F, fullscreen,"
      # "$mod, G, ,"
      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, L, movefocus, r"
      # "$mod, H, exec, /home/nicolas/bin/navigate.sh left"
      # "$mod, J, exec, /home/nicolas/bin/navigate.sh down"
      # "$mod, K, exec, /home/nicolas/bin/navigate.sh up"
      # "$mod, L, exec, /home/nicolas/bin/navigate.sh right"
      # "$mod, code:47, ,"
      "$mod, code:48, exec, pypr toggle term && hyprctl dispatch bringactivetotop"

      "$mod, Z, workspace, 1"
      "$mod, X, workspace, 2"
      "$mod, C, workspace, 3"
      "$mod, V, workspace, 4"
      "$mod, B, workspace, 5"
      "$mod, N, workspace, 6"
      "$mod, M, workspace, 7"
      "$mod, code:59, workspace, 8"
      "$mod, code:60, workspace, 9"
      "$mod, code:61, workspace, 10"

      # --------------------------------------------------------
      # MOD + SHIFT
      # --------------------------------------------------------

      "$mod SHIFT, W, exec, rofi -show window"
      "$mod SHIFT, T, togglefloating,"

      # "$mod SHIFT, A, , "
      "$mod SHIFT, S, resizeactive, -100 0"
      "$mod SHIFT, D, resizeactive, 0 -100"
      "$mod SHIFT, F, resizeactive, 0 100"
      "$mod SHIFT, G, resizeactive, 100 0"
      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, J, movewindow, d"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, L, movewindow, r"
      # "$mod SHIFT, code:47, , "

      "$mod SHIFT, Z, movetoworkspacesilent, 1"
      "$mod SHIFT, X, movetoworkspacesilent, 2"
      "$mod SHIFT, C, movetoworkspacesilent, 3"
      "$mod SHIFT, V, movetoworkspacesilent, 4"
      "$mod SHIFT, B, movetoworkspacesilent, 5"
      "$mod SHIFT, N, movetoworkspacesilent, 6"
      "$mod SHIFT, M, movetoworkspacesilent, 7"
      "$mod SHIFT, code:59, movetoworkspacesilent, 8"
      "$mod SHIFT, code:60, movetoworkspacesilent, 9"
      "$mod SHIFT, code:61, movetoworkspacesilent, 10"

      # --------------------------------------------------------
      # MOD + CONTROL
      # --------------------------------------------------------

      "$mod CONTROL, Q, exit,"
      "$mod CONTROL, P, exec, pypr reload"
      "$mod CONTROL, B, exec, pkill waybar && waybar"

      # --------------------------------------------------------
      # MOD + CONTROL + ALT
      # --------------------------------------------------------

      "$mod CONTROL ALT, Q, killactive, "
      # "$mod CONTROL ALT, W, exec, "
      "$mod CONTROL ALT, E, exec, rofi -modi emoji -show emoji"
      # "$mod CONTROL ALT, R, exec, "
      # "$mod CONTROL ALT, T, exec, "
      # "$mod CONTROL ALT, Y, exec, "
      # "$mod CONTROL ALT, U, exec, "
      # "$mod CONTROL ALT, I, exec, "
      "$mod CONTROL ALT, O, exec, obsidian"
      "$mod CONTROL ALT, P, exec, hyprpicker -a"
      # "$mod CONTROL ALT, A, exec, "
      # "$mod CONTROL ALT, S, exec, "
      # "$mod CONTROL ALT, D, exec, "
      # "$mod CONTROL ALT, F, exec, "
      # "$mod CONTROL ALT, G, exec, "
      # "$mod CONTROL ALT, H, exec, "
      # "$mod CONTROL ALT, J, exec, "
      # "$mod CONTROL ALT, K, exec, "
      # "$mod CONTROL ALT, L, exec, "
      # "$mod CONTROL ALT, code:47, exec, "
      # "$mod CONTROL ALT, Z, exec, "
      # "$mod CONTROL ALT, X, exec, "
      "$mod CONTROL ALT, C, exec, rofi -show calc -modi calc"
      "$mod CONTROL ALT, V, exec, vivaldi"
      "$mod CONTROL ALT, B, exec, qutebrowser"
      # "$mod CONTROL ALT, N, exec, "
      # "$mod CONTROL ALT, M, exec, "
      # "$mod CONTROL ALT, code:59, exec, "
      # "$mod CONTROL ALT, code:60, exec, "
      # "$mod CONTROL ALT, code:61, exec, "
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
      ", XF86AudioPlay, exec, playerctl play-pause"
    ];

    bindel = [
      ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_SINK@ 0 && wpctl set-volume @DEFAULT_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_SINK@ 0 && wpctl set-volume @DEFAULT_SINK@ 5%-"
    ];
  };
  # wayland.windowManager.hyprland.extraConfig = ''
  #   bind = $mod, R, submap, rofisubmap
  #   submap = rofisubmap
  #   bind = , w, exec, whatsapp
  #   bind = , w, submap, reset
  #   bind = , e, exec, rofi -modi emoji -show emoji
  #   bind = , e, submap, reset
  #   bind = , r, exec, rofi -show drun -modi drun
  #   bind = , r, submap, reset
  #   bind = , s, exec, spotify
  #   bind = , s, submap, reset
  #   bind = , c, exec, rofi -show calc -modi calc
  #   bind = , c, submap, reset
  #   bind = , b, exec, vivaldi
  #   bind = , b, submap, reset
  #   bind = , escape, submap, reset
  #   submap = reset
  # '';
}
