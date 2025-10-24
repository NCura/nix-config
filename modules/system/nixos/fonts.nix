{pkgs, ...}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    symbola
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts
    noto-fonts-extra
  ];
}
