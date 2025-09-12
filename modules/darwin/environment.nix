{
  pkgs,
  ...
}: {
  environment.pathsToLink = ["/share/zsh"];
  nixpkgs.config.allowUnfree = true;
}