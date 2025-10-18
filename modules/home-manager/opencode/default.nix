{
  programs.opencode = {
    enable = true;

    # Settings written to $XDG_CONFIG_HOME/opencode/config.json
    settings = {
      # Example configuration
      # theme = "opencode";
      # model = "anthropic/claude-sonnet-4-20250514";
      # autoshare = false;
      # autoupdate = true;
    };

    # Custom agents - stored in ~/.config/opencode/agent/
    agents = {
      nix-helper = ./agents/nix-helper.md;
      git-commit-manager = ./agents/git-commit-manager.md;
    };

    # Custom commands - stored in ~/.config/opencode/command/
    commands = {
      commit = ./commands/commit.md;
    };

    # Global custom instructions - written to $XDG_CONFIG_HOME/opencode/AGENTS.md
    # Add your project-specific guidelines and instructions here.
    rules = '''';
  };
}
