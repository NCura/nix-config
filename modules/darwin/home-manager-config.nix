{
  inputs,
  ...
}: let
  user = "nicolascura";
in {
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${user} = {...}: {
      imports = [
        ../shared

        ../home-manager/gitui.nix
        ./zsh.nix
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
        homeDirectory = "/Users/${user}";
      };
    };
  };
}