{ pkgs }:
{
  # Custom plugins not available or outdated in nixpkgs
  # Each plugin should be built using pkgs.vimUtils.buildVimPlugin

  fff-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "fff.nvim";
    version = "2024-10-21";
    src = pkgs.fetchFromGitHub {
      owner = "dmtrKovalenko";
      repo = "fff.nvim";
      rev = "e8850c3c62a13e92f71233350962e842fcabf01b";
      sha256 = pkgs.lib.fakeSha256; # Will need to update after first build
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
