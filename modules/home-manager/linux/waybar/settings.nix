{pkgs, ...}: {
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 40;
      width = 1920;
      exclusive = false;
      margin-top = 10;
      start-hidden = true;

      modules-left = [
        "memory"
        "cpu"
        # "disk"
        # "network"
      ];

      modules-center = ["hyprland/workspaces"];

      modules-right = [
        "tray"
        # "pulseaudio"
        "clock"
      ];

      "hyprland/workspaces" = {
        format = "{name}"; # "{icon}";
        format-icons = {
          default = " ";
          active = " ";
          urgent = " ";
        };
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
      };

      "clock" = {
        interval = 1;
        format = "{:%A %d %B %H:%M:%S} ";
        # format = "{:%A %d %B %H:%M:%S} ";
        tooltip = true;
        # tooltip-format = "<big>{:%A, %d.%B %Y }</big><tt><small>{calendar}</small></tt>";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
          "mode" = "year";
          "mode-mon-col" = 3;
          "weeks-pos" = "";
          "on-scroll" = 1;
          "format" = {
            "months" = "<span color='#deb887'><b>{}</b></span>";
            "days" = "<span color='#ececec'><b>{}</b></span>";
            "weekdays" = "<span color='#deb887'><b>{}</b></span>";
            "today" = "<span color='#deb887'><b><u>{}</u></b></span>";
          };
        };
        actions = {
          "on-click-right" = "mode";
          "on-scroll-up" = "shift_up";
          "on-scroll-down" = "shift_down";
        };
      };

      "custom/hello-from-waybar" = {
        format = "hello {}";
        max-length = 40;
        interval = "once";
        exec = pkgs.writeShellScript "hello-from-waybar" ''
          echo "from within waybar"
        '';
      };

      "memory" = {
        interval = 5;
        format = "  {}% ";
        tooltip = true;
      };

      "cpu" = {
        interval = 5;
        format = " {}%";
        # format = " {usage:2}%";
        tooltip = true;
      };

      "disk" = {
        format = " {free}";
        tooltip = true;
      };

      "network" = {
        format-icons = [
          "󰤯"
          "󰤟"
          "󰤢"
          "󰤥"
          "󰤨"
        ];
        format-ethernet = " {bandwidthDownOctets}";
        format-wifi = "{icon} {signalStrength}%";
        format-disconnected = "󰤮";
        tooltip = true;
      };

      "tray" = {
        spacing = 12;
      };

      "pulseaudio" = {
        format = "{icon} {volume}% {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [
            ""
            ""
            ""
          ];
        };
        # on-click = "sleep 0.1 && pavucontrol";
      };
    };
  };
}
