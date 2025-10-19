{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;

    # Additional packages for better game compatibility
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Enable XWayland for SDL2 compatibility
  programs.xwayland.enable = true;
}
