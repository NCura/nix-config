{
  config,
  pkgs,
  ...
}: {
  services.ttyd = {
    enable = true;
    port = 7681;

    # Allow clients to write to the terminal (true for interactive, false for read-only)
    writeable = true;

    # Security settings
    checkOrigin = true;

    # Network settings
    # Bind to all interfaces (firewall will restrict access to VPN only)
    interface = null;

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

  # Open firewall port only for the wireguard interface (VPN access)
  # networking.firewall.interfaces.wg-infomaniak.allowedTCPPorts = [ 7681 ];
  networking.firewall.allowedTCPPorts = [7681];
}
