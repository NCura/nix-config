{pkgs, ...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    # user = "nicolas";
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
