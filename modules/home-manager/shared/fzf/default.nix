{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
    fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
    defaultOptions = [
      "--height 40%"
      "--border"
      "--layout=reverse"
      "--info=inline"
    ];
    changeDirWidgetOptions = [
      "--preview 'ls -la {}'"
    ];
    fileWidgetOptions = [
      "--preview 'cat {}'"
    ];
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [ "-d 40%" ];
    };
  };
}
