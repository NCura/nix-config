{pkgs, ...}: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  environment.systemPackages = with pkgs; [
    php83
    php
  ];

  services.httpd = {
    enable = true;
    enablePHP = true;
    phpOptions = ''
      upload_max_filesize = 100M
      post_max_size = 128M
    '';
    virtualHosts = {
      "localhost" = {
        documentRoot = "/var/lib/www/localhost";
        extraConfig = ''
          DirectoryIndex index.php
        '';
      };
      "nicolascura-staging.com.local" = {
        documentRoot = "/var/lib/www/staging.nicolascura.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/var/lib/www/staging.nicolascura.com">
            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
      "local.bordeauxwinepilgrim-staging.com" = {
        documentRoot = "/var/lib/www/bordeauxwinepilgrim.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/var/lib/www/bordeauxwinepilgrim.com">
            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
      "local.pidiffusion-staging.com" = {
        documentRoot = "/var/lib/www/pidiffusion.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/var/lib/www/pidiffusion.com">
            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
      "test-wordpress.com.local" = {
        documentRoot = "/var/lib/www/test-wordpress.com";
        extraConfig = ''
          DirectoryIndex index.php
          <Directory "/var/lib/www/test-wordpress.com">

            AllowOverride All
            Require all granted
            Options +FollowSymLinks
          </Directory>
        '';
      };
    };
  };

  networking.hosts = {
    "127.0.0.1" = [
      "nicolascura-staging.com.local"
      "local.pidiffusion-staging.com"
      "local.bordeauxwinepilgrim-staging.com"
      "test-wordpress.com.local"
    ];
  };
}
