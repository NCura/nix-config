{
  config,
  pkgs,
  ...
}: {
  # WireGuard client configuration for connecting to your VPN server
  networking.wireguard = {
    enable = true;
    interfaces = {
      wg-infomaniak = {
        # Client IP in the VPN network
        ips = ["10.100.0.2/32"];

        # Your private key file path
        privateKeyFile = "/home/nicolas/wireguard-keys/nicolas-local-private.key";

        peers = [
          {
            # Your VPN server
            publicKey = "Ee+Y0DtQuSFbG7Zv3WF3gs/tCoUVWBQH0QfMQbwUU00=";
            endpoint = "83.228.202.172:51820";
            allowedIPs = ["10.0.1.0/24"]; # Route all traffic through VPN
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };

  # Add wireguard-tools for management
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];
}

