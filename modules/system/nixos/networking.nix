{
  config,
  pkgs,
  ...
}: {
  networking.hosts = {
    "192.168.1.73" = [
      "local-website.com"
      "www.local-website.com"
      "staging.local-website.com"
    ];
  };

  boot.supportedFilesystems = ["ntfs"];
  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
    # To try to prevent "Network change detected" errors
    interfaces.eno1.useDHCP = false;
    interfaces.wlp9s0.useDHCP = false;
    interfaces.eno2.useDHCP = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
    firewall.allowedTCPPorts = [3000];
    # firewall.extraCommands = ''
    #   iptables -A INPUT -p tcp --dport 3000 -s 192.168.1.42 -j ACCEPT
    #   iptables -A INPUT -p tcp --dport 3000 -s 192.168.1.54 -j ACCEPT
    #   iptables -A INPUT -p tcp --dport 3000 -s 192.168.1.73 -j ACCEPT
    #   iptables -A INPUT -p tcp --dport 3000 -j DROP
    # '';
  };
}