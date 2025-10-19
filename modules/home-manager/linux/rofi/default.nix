{
  pkgs,
  lib,
  ...
}:
{
  programs.rofi = {
    enable = true;
    # package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-calc
      # (pkgs.rofi-calc.override {rofi-unwrapped = rofi-wayland-unwrapped;})
      # (pkgs.rofi-emoji.override {rofi-unwrapped = rofi-wayland-unwrapped;})
      rofi-emoji
      rofi-bluetooth
      # rofi-screenshot
      rofi-power-menu
    ];
    theme = lib.mkForce ./theme.rasi;
  };
}
