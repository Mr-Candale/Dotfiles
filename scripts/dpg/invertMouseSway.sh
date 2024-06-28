#!/bin/bash

# Get current mouse coordinates
eval $(swaygrab -p -r -d 1 | awk '/Pointer/ {print "x="$2, "y="$3}')

# Invert the mouse coordinates
swaymsg move absolute $((3840 - $x)) $((2160 - $y))

