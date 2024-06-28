#!/bin/bash

# Start waybar and hyprpaper first
waybar &
hyprpaper &
gammastep -O 2700 &

# Wait for 7 seconds before starting the rest
sleep 5

ibus-daemon -rxRd &
otd-daemon -d &
fcitx5 -d &
import-gsettings &
swaync &
telegram-desktop &
pavucontrol &
alacritty &
firefox &
aegisub &
