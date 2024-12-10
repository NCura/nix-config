{pkgs, ...}: {
  programs.neovim = let
    addWithFile = pluginName: {
      plugin = pkgs.vimPlugins.${pluginName};
      type = "lua";
      config = builtins.readFile (toString ./. + "/plugins/" + pluginName + ".lua");
    };
  in {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
      ${builtins.readFile ./autocmds.lua}
    '';

    extraPackages = with pkgs; [
      lua-language-server
      stylua
      nil
      nixfmt-rfc-style
      nixpkgs-fmt
      alejandra
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      vim-nix

      (addWithFile "telescope-nvim")
      telescope-ui-select-nvim
      telescope-fzf-native-nvim
      telescope-file-browser-nvim

      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = "${builtins.readFile ./plugins/nvim-treesitter.lua}";
      }
    ];
  };
}
