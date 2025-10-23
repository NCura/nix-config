{
  description = "NC's flake for nixOS and macOS";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = {
    nixpkgs-unstable,
    nix-darwin,
    stylix,
    home-manager-unstable,
    nix-homebrew,
    homebrew-bundle,
    homebrew-core,
    homebrew-cask,
    rust-overlay,
    sops-nix,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs-unstable.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          # Add rust-overlay
          {
            nixpkgs.overlays = [rust-overlay.overlays.default];
          }

          stylix.nixosModules.stylix
          home-manager-unstable.nixosModules.home-manager
          sops-nix.nixosModules.sops
          {
            sops = {
              age.keyFile = "/home/nicolas/.config/sops/age/keys.txt";
              defaultSopsFile = ./secrets/surreal.yaml;
              secrets = {
                user = {};
                password = {};
              };
            };
          }
          ./hosts/nixos
        ];
      };
    };

    darwinConfigurations = {
      NCMBP14 = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          # Add rust-overlay
          {
            nixpkgs.overlays = [rust-overlay.overlays.default];
          }

          home-manager-unstable.darwinModules.home-manager

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "nicolascura";
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "homebrew/homebrew-bundle" = homebrew-bundle;
              };
              mutableTaps = false;
              autoMigrate = true;
            };
          }
          ./hosts/darwin
        ];
      };
    };
  };
}
