{ pkgs, lib, ... }:
let
  # Common options for internal/trusted hosts
  noStrictHostChecking = {
    StrictHostKeyChecking = "no";
    UserKnownHostsFile = "/dev/null";
    LogLevel = "ERROR"; # Suppresses the warning about adding to known hosts
  };
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false; # Disable default config to avoid deprecation warning

    # Automatically add SSH keys to agent and use macOS keychain (macOS only)
    extraConfig =
      lib.optionalString pkgs.stdenv.isDarwin ''
        AddKeysToAgent yes
        UseKeychain yes
      ''
      + ''
        IdentityFile ~/.ssh/infomaniak_nicolas_cura
      '';

    # SSH client configuration
    matchBlocks = {
      # Disable host key checking for the 10.0.1.0/24 network
      "10.0.1.*" = {
        extraOptions = noStrictHostChecking;
      };

      "83.228.200.122" = {
        extraOptions = noStrictHostChecking;
      };

      # All Consul nodes and services
      "*.node.consul *.service.consul *.nicolascura.fr" = {
        extraOptions = noStrictHostChecking;
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
