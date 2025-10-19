{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    profileExtra = ''
      # Login shell
       if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
         # sudo liquidctl --match aura set sync color static ff5a2f
         exec Hyprland
       fi
    '';
    bashrcExtra = ''
      set -o vi
      # All shells
      eval "$(ssh-agent -s)" > /dev/null
      if [ -f $HOME/.ssh/forgejo ]; then
        ssh-add ~/.ssh/forgejo &> /dev/null
      fi
      if [ -f $HOME/.ssh/gitlab ]; then
        ssh-add ~/.ssh/gitlab &> /dev/null
      fi
      if [ -f $HOME/.ssh/github ]; then
        ssh-add ~/.ssh/github &> /dev/null
      fi
      if [ -f $HOME/.ssh/infomaniak_nicolas_cura ]; then
        ssh-add ~/.ssh/infomaniak_nicolas_cura &> /dev/null
      fi
    '';
    initExtra = ''
      # Interactive shell
      # neofetch
      fastfetch
      # export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
    '';
  };
}
