{pkgs, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
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
      # fastfetch
    '';
  };
}
