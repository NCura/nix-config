{
  programs.bash.shellAliases = {
    ls = "eza --icons --header --all --long --no-time --no-user --no-permissions --no-filesize --group-directories-first";
    lss = "eza --icons --all --across --group-directories-first";
    lsl = "eza --icons --header --all --long --group-directories-first";

    cd = "__zoxide_z";
    cdi = "__zoxide_zi";

    grep = "grep --color=auto";

    nr = "sudo nixos-rebuild switch --flake ~/nix-config/.";
    nfu = "sudo nix flake update --flake ~/nix-config/";
    ne = "cd ~/nix-config && nvim";
    nd = "nix develop";
    ngc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";

    ".." = "cd ..";
    cat = "bat";
    # history = "history | fzf --layout reverse --height 50% --border --tac | awk {$1=\"\"; print substr($0,2)}' | wl-copy";
    history = "history | fzf --layout=reverse --height=50% --border --tac | awk '{\$1=\"\"; print substr(\$0,2)}' | wl-copy";

    ncsleep = "sudo systemctl suspend";
    ncreboot = "sudo systemctl reboot";
    ncpoweroff = "sudo systemctl poweroff";
    nccleanlocalhost = "kill $(lsof -ti :3000)";

    # st-patrimoine = "~/bin/open-neovide.sh /var/lib/www/staging.st-patrimoine.com";
    # project-bwp = "kitty --session bwp & disown";
    # obsidian = "nvim ~/Documents/Obsidian/Core";
    obsidian = "cd ~/Documents/Obsidian/Core && nvim";
  };
}
