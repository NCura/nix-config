{
  pkgs,
  ...
}:
{
  environment.pathsToLink = [ "/share/bash" ];
  environment.shells = [ pkgs.bash ];
  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    XDG_CONFIG_HOME = "$HOME/.config";
  };
}
