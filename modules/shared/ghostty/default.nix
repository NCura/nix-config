{pkgs, ...}: let
  # Script to open files in nvim within ghostty
  ghostty-nvim = pkgs.writeShellScriptBin "ghostty-nvim" ''
    exec ${pkgs.ghostty}/bin/ghostty -e ${pkgs.neovim}/bin/nvim "$@"
  '';
in {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    installVimSyntax = true;
    settings = {
      # font-size = 16;
      working-directory = "home";
      confirm-close-surface = "true";
      keybind = ["ctrl+f=write_scrollback_file:open"];
      # Prevent inheriting working directory from shell integration
      window-inherit-working-directory = false;
    };
  };

  home.packages = [ghostty-nvim];

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
