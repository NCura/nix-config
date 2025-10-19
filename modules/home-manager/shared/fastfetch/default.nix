{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ./../../../../assets/icons/nixos-logo.png;
        type = "kitty-direct";
        width = 30;
        preserveAspectRatio = true;
        padding = {
          top = 3;
          # right = 3;
          left = 3;
        };
      };
      modules = [
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "cpu";
          key = "│ CPU";
        }
        {
          type = "cpuusage";
          key = "│ CPU Usage";
        }
        {
          type = "gpu";
          key = "│ GPU";
        }
        {
          type = "memory";
          key = "│ RAM";
        }
        {
          type = "disk";
          key = "│ Disk";
        }
        {
          type = "board";
          key = "│ MB";
        }
        {
          type = "display";
          key = "│ Display";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "kernel";
          key = "│ Kernel";
        }
        {
          type = "os";
          key = "│ OS";
        }
        {
          type = "host";
          key = "│ Host";
        }
        {
          type = "packages";
          key = "│ Packages";
        }
        {
          type = "wm";
          key = "│ WM";
        }
        {
          type = "bios";
          key = "│ BIOS";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌────────────────────────Other───────────────────────┐";
        }
        {
          type = "uptime";
          key = "│ Uptime";
        }
        {
          type = "bluetooth";
          key = "│ Bluetooth";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
      ];
    };
  };
}
