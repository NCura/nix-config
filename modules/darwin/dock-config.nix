{
  config,
  pkgs,
  ...
}: {
  local.dock.enable = true;
  local.dock.entries = [
    {path = "${pkgs.kitty}/Applications/Kitty.app/";}
    # {
    #   path = "${config.users.users.${config.system.primaryUser}.home}/Applications/";
    #   section = "others";
    #   options = "--sort name --view list --display folder";
    # }
    # {
    #   path = "/Applications/";
    #   section = "others";
    #   options = "--sort name --view list --display folder";
    # }
  ];
}