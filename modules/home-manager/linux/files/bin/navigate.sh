#!/usr/bin/env bash

ACTIVE_WINDOW_INFO=$(hyprctl activewindow -j)
INITIAL_TITLE=$(echo $ACTIVE_WINDOW_INFO | jq -r '.initialTitle')
PID=$(echo $ACTIVE_WINDOW_INFO | jq -r '.pid')

case "$1" in
    left)
        KEYBIND="h"
        HYPR_DIRECTION="l"
        KITTY_DIRECTION="left"
        NVIM_KEYMAP=35;
        ;;
    down)
        KEYBIND="j"
        HYPR_DIRECTION="d"
        KITTY_DIRECTION="bottom"
        NVIM_KEYMAP=36;
        ;;
    up)
        KEYBIND="k"
        HYPR_DIRECTION="u"
        KITTY_DIRECTION="top"
        NVIM_KEYMAP=37;
        ;;
    right)
        KEYBIND="l"
        HYPR_DIRECTION="r"
        KITTY_DIRECTION="right"
        NVIM_KEYMAP=38;
        ;;
    *)
        echo "Invalid direction"
        exit 1
        ;;
esac

is_nvim_active_window() {
    local is_nvim=false
    local KITTY_INFO=$(kitty @ --to unix:@mykitty-$PID ls)

    local cmdline=$(echo "$KITTY_INFO" | jq -r '.[].tabs[].windows[] | select(.is_active == true).foreground_processes[] | .cmdline[]')

    if echo "$cmdline" | grep -q -i "nvim"; then
        is_nvim=true
    fi
    
    echo "$is_nvim"
}

if [ "$INITIAL_TITLE" = "kitty" ]; then
    if [ "$(is_nvim_active_window)" = true ]; then
        # notify-send -t 1000 "Nvim"
        ydotool key 29:1 42:1 56:1 ${NVIM_KEYMAP}:1 ${NVIM_KEYMAP}:0 56:0 42:0 29:0
        # ydotool key 29:1 42:1 56:1 35:1 35:0 56:0 42:0 29:0
    else
        # notify-send -t 1000 "Kitty"
        kitty @ --to unix:@mykitty-$PID focus-window --match "neighbor:$KITTY_DIRECTION"
        if [ $? -ne 0 ]; then
            echo "No neighboring Kitty window found, falling back to Hyprland"
            hyprctl dispatch movefocus $HYPR_DIRECTION
        fi
    fi
else
    echo "The active window initial title is not kitty."
    hyprctl dispatch movefocus $HYPR_DIRECTION
fi

