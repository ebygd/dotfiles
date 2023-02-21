#!/bin/bash

# Terminate already running bar instances
# killall -q polybar
# If all your bars have ipc enabled, you can also use
polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar  main -c "$HOME/.config/polybar/ericmurphybar/config.ini" 2>&1 | tee -a /tmp/polybar.log & disown

polybar external -c "$HOME/.config/polybar/ericmurphybar/config.ini" 2>&1 | tee -a /tmp/polybar_external.log & disown

