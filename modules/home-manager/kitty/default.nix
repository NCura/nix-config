{
  programs.kitty = {
    enable = true;
    # theme = "Catppuccin-Mocha";
    # font.name = "JetBrains Mono";
    # font.size = 14;
    settings = {
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      window_padding_width = 0;
      confirm_os_window_close = 0;
      allow_remote_control = true;
      listen_on = "unix:@mykitty";
      # background_opacity = "1.00";
    };
    keybindings = {
      "ctrl+alt+c" = "copy_or_interrupt";
      "ctrl+alt+v" = "paste_from_clipboard";

      "ctrl+alt+q" = "close_window";
      "ctrl+q" = "";
      "ctrl+shift+r" = "start_resizing_window";
      "ctrl+t" = "move_window_to_top";
      "ctrl+f" = "move_window_forward";
      "ctrl+shift+h" = "neighboring_window left";
      "ctrl+shift+j" = "neighboring_window down";
      "ctrl+shift+k" = "neighboring_window up";
      "ctrl+shift+l" = "neighboring_window right";
      # "ctrl+h" = "neighboring_window left";
      # "ctrl+j" = "neighboring_window down";
      # "ctrl+k" = "neighboring_window up";
      # "ctrl+l" = "neighboring_window right";
      "ctrl+alt+h" = "kitten pass_keys.py left ctrl+h";
      "ctrl+alt+j" = "kitten pass_keys.py bottom ctrl+j";
      "ctrl+alt+k" = "kitten pass_keys.py top ctrl+k";
      "ctrl+alt+l" = "kitten pass_keys.py right ctrl+l";
      "ctrl+alt+plus" = "change_font_size all +1.0";
      "ctrl+alt+minus" = "change_font_size all -1.0";
      "ctrl+n" = "new_window";

      "f5" = "launch --location=hsplit";
      "f6" = "launch --location=vsplit";
      "f7" = "layout_action rotate";
      # "ctrl+alt+shift+h" = "move_window left";
      # "ctrl+alt+shift+j" = "move_window down";
      # "ctrl+alt+shift+k" = "move_window up";
      # "ctrl+alt+shift+l" = "move_window right";
    };
    extraConfig = ''
      enabled_layouts splits:horizontal, vertical
      tab_bar_style fade
      tab_fade 1
      active_tab_font_style   bold
      inactive_tab_font_style bold
    '';
  };
}
