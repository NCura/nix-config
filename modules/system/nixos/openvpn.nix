{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    openvpn
  ];

  services.openvpn.servers = {
    work = {
      config = ''
        config /home/nicolas/Documents/nicolascura_connect.ovpn
      '';
      updateResolvConf = true;
      autoStart = false;
    };
  };
}
