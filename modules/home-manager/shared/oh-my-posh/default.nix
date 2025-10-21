{
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = false;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./theme.json));
  };
}
