{pkgs, ...}: {
  home.packages = with pkgs; [pyprland];

  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [ "scratchpads" ]

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "33% 75%"

    [scratchpads.ranger]
    animation = "fromTop"
    command = "kitty --class kitty-ranger -e nvim"
    class = "kitty-ranger"
    size = "33% 75%"

    [scratchpads.chat]
    animation = "fromTop"
    # command = "chromium --class chat --app=https://chat.openai.com"
    command = "kitty --class chat"
    class = "chat"
    size = "33% 75%"

    [scratchpads.obsidian]
    animation = "fromTop"
    command = "obsidian --class obsidian"
    class = "obsidian"
    size = "33% 75%"

    [scratchpads.obsidian-nvim]
    animation = "fromTop"
    command = "kitty --class obsidian-nvim -e nvim ~/Documents/Obsidian/Core"
    class = "obsidian-nvim"
    size = "33% 75%"
  '';
}
