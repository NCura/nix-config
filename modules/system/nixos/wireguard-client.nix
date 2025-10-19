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
            # Gateway VPN server (primary - always on)
            publicKey = "6HBSPNC/7zKuppBvkvXdMrDBcoaIZ5OFS8Lb8M38ixo=";
            endpoint = "83.228.200.122:51820";
            # Builder VPN server (backup - when running)
            # publicKey = "1o1JWy+5CmxI8reFHCFjtIGB0U47Kj87S5bprVcjKQ8=";
            # endpoint = "2001:1600:16:11::62:51820";
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
      # Forward .consul domain queries to gateway's Consul DNS
      server = [
        "/.consul/10.0.1.5#8600"
        "1.1.1.1"
        "9.9.9.9"
      ];

      # Resolve all nicolascura.fr subdomains to gateway IP (VPN-only services)
      address = [
        "/nicolascura.fr/10.0.1.5"
      ];

      # Disable IPv6 (AAAA) responses to prevent Cloudflare bypass
      filter-AAAA = true;

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
