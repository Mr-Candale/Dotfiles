#!/bin/bash

# Run script to1.sh
exec /home/pan_svichka/.config/waybar/ms/1/to1.sh &

# Wait for 5 seconds
sleep 3

# Kill waybar application
pkill waybar

# Start script from2.sh
exec /home/pan_svichka/.config/waybar/ms/2/from2.sh &

# Start waybar again
waybar &
