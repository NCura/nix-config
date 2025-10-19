{lib, ...}: {
  imports = [./settings.nix];

  programs.waybar = {
    enable = true;
    style = lib.mkForce ./style.css;
  };
}
