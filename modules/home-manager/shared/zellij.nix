{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      ui.pane_frames.hide_session_name = true;
    };
  };
}
