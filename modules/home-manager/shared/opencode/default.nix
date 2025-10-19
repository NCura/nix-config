{ pkgs, ... }:
{
  programs.opencode = {
    enable = true;

    package = import ./package.nix { inherit pkgs; };

    settings = {
      permission = {
        edit = "ask";
        bash = "ask";
        webfetch = "ask";
      };
    };

    agents = {
      nix-helper = ./agents/nix-helper.md;
      git-commit-manager = ./agents/git-commit-manager.md;
    };

    commands = {
      commit = ./commands/commit.md;
    };

    rules = '''';
  };
}
