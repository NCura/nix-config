{pkgs, ...}: {
  systemd.services.liquidctl = {
    description = "AIO startup service";
    wantedBy = ["default.target"];
    after = ["network.target"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [
        "${pkgs.liquidctl}/bin/liquidctl initialize all"
        "${pkgs.liquidctl}/bin/liquidctl --match aura set sync color static ff5a2f"
        "${pkgs.liquidctl}/bin/liquidctl --match ST set fans speed 20 0  50 25  55 75  60 100"
        "${pkgs.liquidctl}/bin/liquidctl --match XT set fans speed 20 0  50 25  55 75  60 100"
      ];
    };
  };
}
