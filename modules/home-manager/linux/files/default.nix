{
  home.file = {
    "bin/toggle-st-patrimoine.sh".source = ./bin/toggle-st-patrimoine.sh;
    "bin/open-neovide.sh".source = ./bin/open-neovide.sh;
    "bin/navigate.sh".source = ./bin/navigate.sh;
    ".local/share/fonts" = {
      source = ./fonts;
      recursive = true;
    };
  };
}
