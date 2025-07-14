{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    # customPaneNavigationAndResize = true;
    # disableConfirmationPrompt = true;
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # Vim-style pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Vim-style pane resizing
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
    '';
    keyMode = "vi";
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.cpu
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
    reverseSplit = true;
    # shortcut = "b";
    prefix = "M-C-t";
  };
}
