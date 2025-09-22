{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false; # Disable default config to avoid deprecation warning

    # SSH client configuration
    matchBlocks = {
      # Disable host key checking for the 10.0.1.0/24 network
      # This prevents SSH from storing or checking host keys for these IPs
      "10.0.1.*" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
          UserKnownHostsFile = "/dev/null";
          LogLevel = "ERROR"; # Suppresses the warning about adding to known hosts
        };
      };

      "83.228.200.122" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
          UserKnownHostsFile = "/dev/null";
          LogLevel = "ERROR"; # Suppresses the warning about adding to known hosts
        };
      };

      "vpn.node.consul" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
          UserKnownHostsFile = "/dev/null";
        };
      };

      "monitoring.node.consul" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
          UserKnownHostsFile = "/dev/null";
        };
      };

      "consul.service.consul" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
          UserKnownHostsFile = "/dev/null";
        };
      };

      "consul1.node.consul" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
          UserKnownHostsFile = "/dev/null";
        };
      };

      "consul2.node.consul" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
          UserKnownHostsFile = "/dev/null";
        };
      };

      "consul3.node.consul" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
          UserKnownHostsFile = "/dev/null";
        };
      };

      # Default match block for all other hosts
      "*" = {
        extraOptions = {
          # Keep connections alive
          ServerAliveInterval = "60";
          ServerAliveCountMax = "3";

          # Reuse connections
          ControlMaster = "auto";
          ControlPersist = "10m";
          ControlPath = "~/.ssh/control-%r@%h:%p";
        };
      };
    };
  };
}
