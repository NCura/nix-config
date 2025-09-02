eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github &> /dev/null
ssh-add ~/.ssh/infomaniak_nicolas_cura &> /dev/null

waybar &
# hyprpaper >~/hyprpaper.log 2>&1
