{
  config,
  pkgs,
  ...
}:
{
  programs.neovim =
    let
      addWithFile = pluginName: {
        plugin = pkgs.vimPlugins.${pluginName};
        type = "lua";
        config = builtins.readFile (toString ./. + "/plugins/" + pluginName + ".lua");
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
      ];

      plugins = with pkgs.vimPlugins; [
        # Colorscheme
        (addWithFile "catppuccin-nvim")

        # LSP progress UI
        (addWithFile "fidget-nvim")

        # File explorer
        (addWithFile "oil-nvim")

        # Treesitter with all grammars
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects

        # Plugin configurations
        (addWithFile "nvim-treesitter")
      ];
    };
}
