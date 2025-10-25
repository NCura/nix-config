{ pkgs }:
let
  fff-src = pkgs.fetchFromGitHub {
    owner = "dmtrKovalenko";
    repo = "fff.nvim";
    rev = "e8850c3c62a13e92f71233350962e842fcabf01b";
    sha256 = "sha256-qyzM45FaXqLipnBW2zTao2SvY21qiFsdsX+Mn2Tu3xI=";
  };
in
{
  # Custom plugins not available or outdated in nixpkgs
  # Each plugin should be built using pkgs.vimUtils.buildVimPlugin

  fff-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "fff.nvim";
    version = "2024-10-21";
    src = fff-src;

    nativeBuildInputs = with pkgs; [
      rustPlatform.cargoSetupHook
      rust-bin.nightly.latest.default
      perl
      pkg-config
      openssl
    ];

    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      src = fff-src;
      name = "fff.nvim-vendor";
      hash = "sha256-ZZt4BlMgRik4LH92F5cgS84WI1Jeuw68jP+y1+QXfDE=";
    };

    buildPhase = ''
      runHook preBuild
      cargo build --release
      runHook postBuild
    '';

    # Skip neovim require check since it needs runtime cargo build
    doCheck = false;
  };

  nvim-recorder = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-recorder";
    version = "2025-10-25";
    src = pkgs.fetchFromGitHub {
      owner = "chrisgrieser";
      repo = "nvim-recorder";
      rev = "5e72567e5d43c0b81b179df8aa3135645fc91a38";
      sha256 = "sha256-57D8VOSSK1hFljLmA2zXQO1Sd7b5LsMFZH5SYO3CS9c=";
    };
  };

  # Add more custom plugins here as needed
  # example-plugin = pkgs.vimUtils.buildVimPlugin {
  #   pname = "example-plugin";
  #   version = "2024-01-01";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "username";
  #     repo = "example-plugin";
  #     rev = "commit-hash";
  #     sha256 = pkgs.lib.fakeSha256;
  #   };
  # };
}
