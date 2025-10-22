{
  config,
  pkgs,
  ...
}:
{
  programs.neovim =
    let
      # Import custom plugin packages not in nixpkgs
      customPlugins = import ./plugin-packages { inherit pkgs; };

      # Helper for nixpkgs plugins with config files
      addWithFile = pluginName: {
        plugin = pkgs.vimPlugins.${pluginName};
        type = "lua";
        config = builtins.readFile (toString ./. + "/plugins/" + pluginName + ".lua");
      };

      # Helper for custom plugins with config files
      addCustomWithFile = plugin: configName: {
        inherit plugin;
        type = "lua";
        config = builtins.readFile (toString ./. + "/plugins/" + configName + ".lua");
      };

      # Helper to setup LSP servers from lsp/servers/*.lua
      setupLspServer = serverName: ''
        -- ${serverName} LSP
        -- Note: Using bracket notation for server names that are Lua keywords
        vim.lsp.config['${serverName}'] = ${builtins.readFile (./lsp/servers + "/${serverName}.lua")}
        vim.lsp.enable('${serverName}')
      '';
    in
    {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = ''
        -- Core configuration
        ${builtins.readFile ./config/options.lua}
        ${builtins.readFile ./config/autocmds.lua}
        ${builtins.readFile ./config/keymaps.lua}

        -- LSP configuration
        ${builtins.readFile ./lsp/init.lua}

        -- LSP servers
        ${setupLspServer "nil"}
        ${setupLspServer "lua_ls"}
        ${setupLspServer "rust_analyzer"}
      '';

      extraPackages = with pkgs; [
        ### Language servers
        nil # Nix LSP
        lua-language-server # Lua LSP
        rust-analyzer # Rust LSP

        ### Formatters
        nixfmt-rfc-style # Nix
        stylua # Lua
        rustfmt # Rust

        ### Git tools
        lazygit # TUI for git
      ];

      plugins = with pkgs.vimPlugins; [
        # Colorscheme
        (addWithFile "catppuccin-nvim")

        # LSP progress UI
        (addWithFile "fidget-nvim")

        # File explorer
        (addWithFile "oil-nvim")

        # Fuzzy file finder
        (addCustomWithFile customPlugins.fff-nvim "fff-nvim")

        # Git integration
        (addWithFile "lazygit-nvim")

        # Utilities
        (addWithFile "snacks-nvim")

        # Treesitter with all grammars
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects

        # Plugin configurations
        (addWithFile "nvim-treesitter")
      ];
    };
}
