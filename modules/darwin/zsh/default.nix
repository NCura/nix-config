{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      if [ -z "$SSH_AGENT_PID" ]; then
          eval "$(ssh-agent -s)" > /dev/null
      fi

      if [ -f $HOME/.ssh/github ]; then
          ssh-add ~/.ssh/github &> /dev/null
      fi

      fastfetch
    '';
  };
}