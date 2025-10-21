{
  pkgs,
  ...
}:
let
  user = "nicolascura";
in
{
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.bash;
  };
}
