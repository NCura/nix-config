{
  inputs,
  pkgs,
  ...
}: let
  user = "nicolascura";
in {
  users.users.${user} = {
    name = "${user}";
    home = "/home/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${user} = {...}: {
      imports = [
        ../shared
      ];
      home = {
        # enableNixpkgsReleaseCheck = false;
        # packages = pkgs.callPackage ./packages.nix {};
        # file = lib.mkMerge [
        #   sharedFiles
        #   additionalFiles
        # ];
        stateVersion = "23.11";
        username = "${user}";
        homeDirectory = "/home/${user}";
      };
    };
  };
}
