{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim
    neovim
    obsidian
    audacity
    #whatsapp-for-mac
    #vivaldi
  ];
}