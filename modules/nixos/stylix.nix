{pkgs, ...}: {
  stylix.enable = true;
  stylix.base16Scheme = ./../../assets/styles/ncstyle.yaml;

  stylix.image = ./../../assets/wallpapers/forest.jpg;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 24;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };

    sansSerif = {
      # package = pkgs.montserrat;
      # name = "Montserrat";
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sizes = {
      applications = 16;
      terminal = 18;
      desktop = 16;
      popups = 16;
    };
  };

  stylix.polarity = "dark";
}
