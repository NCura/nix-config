{
  pkgs,
  ...
}: {
  environment.pathsToLink = ["/share/zsh"];
  nixpkgs.config.allowUnfree = true;
  
  environment.variables = {
    XDG_CONFIG_HOME = "$HOME/.config";
  };
}