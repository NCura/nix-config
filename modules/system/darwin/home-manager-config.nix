{
  inputs,
  ...
}:
let
  user = "nicolascura";
in
{
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${user} =
      { ... }:
      {
        home = {
          stateVersion = "23.11";
          username = "${user}";
          homeDirectory = "/Users/${user}";
        };
      };
  };
}
