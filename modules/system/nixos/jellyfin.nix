{pkgs, ...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    # user = "nicolas";
  };

  services.jellyseerr = {
    enable = true;
    openFirewall = true;
  };

  services.bazarr = {
    enable = true;
  };

  services.radarr = {
    enable = true;
  };

  services.sonarr = {
    enable = true;
  };

  services.deluge = {
    enable = true;
    declarative = true;
    config = {
      download_location = "/deluge/torrents/";
      allow_remote = true;
    };
    authFile = "/deluge/auth";
    web = {
      enable = true;
      port = 8112;
    };
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
