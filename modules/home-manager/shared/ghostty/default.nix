{ pkgs, lib, ... }:
let
  # Use ghostty-bin on Darwin, ghostty on Linux
  ghosttyPkg = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

  # Script to open files in nvim within ghostty
  ghostty-nvim = pkgs.writeShellScriptBin "ghostty-nvim" ''
    exec ${ghosttyPkg}/bin/ghostty -e ${pkgs.neovim}/bin/nvim "$@"
  '';
in
{
  programs.ghostty = {
    enable = true;
    package = ghosttyPkg;
    enableBashIntegration = true;
    installVimSyntax = true;
    settings = {
      # font-size = 16;
      working-directory = "home";
      confirm-close-surface = "true";
      keybind = [ "ctrl+f=write_scrollback_file:open" ];
      # Prevent inheriting working directory from shell integration
      window-inherit-working-directory = false;
    };
  };

  home.packages = [ ghostty-nvim ] ++ lib.optionals pkgs.stdenv.isDarwin [ ghosttyPkg ];

  # Create custom desktop file for nvim in ghostty
  xdg.dataFile."applications/ghostty-nvim.desktop".text = ''
    [Desktop Entry]
    Name=Neovim in Ghostty
    GenericName=Text Editor
    Comment=Edit text files in Neovim via Ghostty
    Exec=${ghostty-nvim}/bin/ghostty-nvim %F
    Terminal=false
    Type=Application
    Icon=nvim
    Categories=Utility;TextEditor;
    MimeType=text/plain;text/x-log;
    StartupNotify=false
  '';
}
