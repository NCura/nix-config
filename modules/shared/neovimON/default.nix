{
  config,
  pkgs,
  ...
}: {
  # home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "~/nix-config/modules/home-manager/neovim/files";
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./files;

  # home.packages = with pkgs; [
  #   ### Language servers
  #   # cssls
  #   # css_variables
  #   # html
  #   # jsonls
  #   lua-language-server
  #   marksman
  #   nil
  #   sqls
  #   vscode-langservers-extracted
  #   typos-lsp
  #
  #   ### DAP
  #
  #   ### Linter
  #   markdownlint-cli
  #   markdownlint-cli2
  #
  #   ### Formatters
  #   # HTML
  #   # htmlbeautifier
  #
  #   # Javascript
  #   prettierd
  #
  #   # JSON
  #   jsonfmt
  #
  #   # Lua
  #   stylua
  #
  #   # Nix
  #   nixfmt-rfc-style
  #   nixpkgs-fmt
  #   alejandra
  #
  #   # PHP
  #   php82Packages.php-cs-fixer
  #
  #   # Shell
  #   shfmt
  #
  #   # TOML
  #   taplo
  # ];
}
