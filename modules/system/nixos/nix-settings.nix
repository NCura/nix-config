{
  nix = {
    settings = {
      download-buffer-size = 268435456; # 256 MiB
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      trusted-users = [
        "@admin"
        "nicolas"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.tmpfiles.settings."10-nix-gcroots" = {
    "/nix/var/nix/gcroots/remote-systems" = {
      d = {
        mode = "0755";
        user = "nicolas";
        group = "users";
      };
    };
  };
}
