{
  pkgs,
  config,
  ...
}:
{
  stylix.enable = true;
  stylix.base16Scheme = ./../../../assets/styles/ncstyle.yaml;

  # stylix.image = ./../../assets/wallpapers/forest.jpg;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 24;

  stylix.fonts = {
    # serif = {
    #   # package = pkgs.nerd-fonts.arimo;
    #   # name = "Arimo";
    #   package = pkgs.dejavu_fonts;
    #   name = "DejaVu Serif";
    # };

    # sansSerif = {
    #   # package = pkgs.nerd-fonts.arimo;
    #   # name = "Arimo";
    #   package = pkgs.dejavu_fonts;
    #   name = "DejaVu Sans";
    # };
    #

    serif = config.stylix.fonts.monospace;
    sansSerif = config.stylix.fonts.monospace;
    emoji = config.stylix.fonts.monospace;
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
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
