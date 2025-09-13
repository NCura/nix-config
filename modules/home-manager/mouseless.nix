{
  systemd.user.services.mouseless = {
    # Enable = true;
    Unit = {
      Description = "Mouseless key remapping service";
    };
    Service = {
      ExecStartPre = "/bin/sleep 2";
      ExecStart = "sudo %h/bin/mouseless --config %h/.config/mouseless/config.yaml";
      Restart = "always";
      RestartSec = 3;
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
  home.file.".config/mouseless/config.yaml".text = ''
    # the default speed for mouse movement and scrolling
    baseMouseSpeed: 750.0
    baseScrollSpeed: 20.0

    # the rest of the config defines the layers with their bindings
    layers:
      # the first layer is active at start
      - name: initial
        bindings:
          # when tab is held and another key pressed, activate mouse layer
          # tab: tap-hold-next tab ; toggle-layer mouse ; 500
          # rightalt: tap-hold rightalt ; layer mouse ; 100
          rightalt: layer mouse
          # mod: tap-hold mod ; toggle-layer mouse ; 300
          # r+u: layer mouse
      # a layer for mouse movement
      - name: mouse
        passThrough: false
        bindings:
          rightalt: layer initial
          q: layer initial
          # keep the mouse layer active
          space: layer mouse
          l: move  1  0
          h: move -1  0
          j: move  0  1
          k: move  0 -1

          d: scroll up
          f: scroll down
          q: speed 4.0
          z: speed 0.3
          g: button left
          a: button middle
          s: button right
  '';
}
