{
  programs.git = {
    enable = true;
    userName = "Nicolas Cura";
    userEmail = "nicolas.cura@icloud.com";
    extraConfig.safe.directory = [
      "/var/lib/www/pidiffusion.com"
    ];
  };
}
