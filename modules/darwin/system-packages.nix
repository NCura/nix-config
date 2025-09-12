{
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.vim
    pkgs.neovim
    pkgs.obsidian
    pkgs.audacity
    #pkgs.whatsapp-for-mac
    #pkgs.vivaldi
  ];
}