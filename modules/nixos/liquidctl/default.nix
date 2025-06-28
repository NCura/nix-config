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
        # "${pkgs.liquidctl}/bin/liquidctl --match ST set fans speed 20 0  60 25  65 75  70 100"
        # "${pkgs.liquidctl}/bin/liquidctl --match XT set fans speed 20 50  60 50  65 75  70 100"
        "${pkgs.liquidctl}/bin/liquidctl --match ST set fans speed 30"
        "${pkgs.liquidctl}/bin/liquidctl --match XT set fans speed 30"
      ];
    };
  };
}
