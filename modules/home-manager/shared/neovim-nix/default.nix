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
    in
    {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = ''
        ${builtins.readFile ./options.lua}
        ${builtins.readFile ./autocmds.lua}
        ${builtins.readFile ./keymaps.lua}
        ${builtins.readFile ./lsp.lua}
      '';

      extraPackages = with pkgs; [
        ### Language servers
        nil # Nix LSP

        ### Formatters
        nixfmt-rfc-style # Nix
      ];

      plugins = with pkgs.vimPlugins; [
        # No plugins for now - using native LSP
      ];
    };
}
