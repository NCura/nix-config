{ pkgs, ... }:
{
  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;
    settings = {
      positionX = "center";
      positionY = "top";
    };
    style = ''
      .notification {
        border-radius: 12px;
      }
    '';
  };
}
