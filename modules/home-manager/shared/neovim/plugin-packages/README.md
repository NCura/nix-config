# Custom Neovim Plugin Packages

This directory contains custom plugin package definitions for plugins that are:
- Not available in nixpkgs
- Outdated in nixpkgs
- Need a specific version or commit

## Adding a New Custom Plugin

1. Add the plugin definition to `default.nix`:

```nix
your-plugin = pkgs.vimUtils.buildVimPlugin {
  pname = "your-plugin";
  version = "YYYY-MM-DD";
  src = pkgs.fetchFromGitHub {
    owner = "github-username";
    repo = "plugin-repo";
    rev = "full-commit-hash";
    sha256 = pkgs.lib.fakeSha256; # Temporary, will be replaced
  };
};
```

2. Build to get the real sha256 hash:
```bash
darwin-rebuild build --flake .
```

3. Copy the correct hash from the error message and update `sha256`

4. Create a config file in `../plugins/your-plugin.lua` if needed

5. Add to the plugins list in `../default.nix`:
```nix
# Using addCustomWithFile for custom plugins with config
(addCustomWithFile customPlugins.your-plugin "your-plugin")

# Or without config file:
customPlugins.your-plugin
```

## Getting the Latest Commit Hash

Visit the GitHub repo and copy the full commit hash from the latest commit on the main/master branch.
