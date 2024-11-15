{pkgs, ...}:{
  programs.neovim = {
    enable = true;
        defaultEditor = true;
        extraLuaConfig = ''
            '';
        plugins = with pkgs.vimPlugins; [
            vim-nix
        ];
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
  };
}
