#!/bin/sh
## /etc/X11/xinit/xinitrc.d

# Get a list of connected outputs from xrandr
outputs=$(xrandr | grep " connected" | awk '{print $1}')

# Check if there are two outputs
if [ "$(echo "$outputs" | wc -l)" -eq 3 ]; then
    # Turn off eDP-1
    xrandr --output eDP1 --off

    # Set the primary display to DP1-3 and set it to the right of eDP-1
    xrandr --output DP1-3 --primary --auto --right-of eDP1

    # Set the other display (DP-1-1) to the right of DP-1-3
    xrandr --output DP1-1 --auto --right-of DP1-3

    # Adjust fontsize
    cp ~/.config/alacritty/configs/docked.yml ~/.config/alacritty/alacritty.yml

else
    # Turn on eDP-1
    #xrandr --output eDP1 --primary --auto

    # Ensure other monitors are off
    xrandr --output DP1-3 --off
    xrandr --output DP1-1 --off

    # Adjust fontsize
    cp ~/.config/alacritty/configs/undocked.yml ~/.config/alacritty/alacritty.yml

fi

