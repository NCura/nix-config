{pkgs, ...}: {
  # WireGuard client configuration for connecting to your VPN server
  networking.wireguard = {
    enable = true;
    interfaces = {
      wg-infomaniak = {
        ips = ["192.168.2.2/32"];
        privateKeyFile = "/home/nicolas/wireguard-keys/nicolas-local-private.key";

        peers = [
          {
            # VPN server
            publicKey = "1o1JWy+5CmxI8reFHCFjtIGB0U47Kj87S5bprVcjKQ8=";
            endpoint = "83.228.200.122:51820";
            # Route traffic through VPN
            allowedIPs = ["10.0.1.0/24"];
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

  # Use dnsmasq for domain-specific DNS routing
  services.dnsmasq = {
    enable = true;
    settings = {
      # Route .consul domains to VPN DNS server and default DNS for everything else
      server = [
        "/.consul/10.0.1.5#8600"
        "1.1.1.1"
        "9.9.9.9"
      ];

      # Listen on localhost
      listen-address = "127.0.0.1";

      # Don't read /etc/resolv.conf
      no-resolv = true;

      # Enable query logging (comment out after testing)
      log-queries = true;
      log-facility = "/var/log/dnsmasq.log";
    };
  };

  # Make sure dnsmasq is used as the primary resolver
  networking.nameservers = ["127.0.0.1"];
}
