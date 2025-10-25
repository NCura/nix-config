{ config, pkgs, ... }:
{
  services.ttyd = {
    enable = true;
    port = 7681;

    # Security settings
    checkOrigin = true;

    # Network settings
    interface = "127.0.0.1"; # Only allow local connections by default

    # Terminal command to run
    # entrypoint = [ "${pkgs.bash}/bin/bash" ];

    # Optional: Set log level (0-9, default 7)
    logLevel = 7;

    # Optional: Limit number of clients (0 for unlimited)
    maxClients = 10;

    # Optional: Enable SSL
    # enableSSL = true;
    # certFile = "/path/to/cert.pem";
    # keyFile = "/path/to/key.pem";

    # Optional: Enable authentication
    # passwordFile = "/path/to/password/file";
  };

  # Optional: Open firewall port if needed
  # networking.firewall.allowedTCPPorts = [ 7681 ];
}
