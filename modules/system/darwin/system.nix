{
  pkgs,
  inputs,
  ...
}:
let
  user = "nicolascura";
in
{
  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    primaryUser = "nicolascura";
    stateVersion = 5;
  };
}
