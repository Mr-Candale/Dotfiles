#!/bin/bash

# Define the fire colors
colors=(" " "." "o" "O" "@" "█")

# Define the size of the fire
width=40
height=20

# Initialize the fire array
for ((i = 0; i < height; i++)); do
    for ((j = 0; j < width; j++)); do
        fire_array[$i,$j]=0
    done
done

# Function to set the intensity of a pixel in the fire array
set_intensity() {
    local x=$1
    local y=$2
    local intensity=$3
    fire_array[$x,$y]=$intensity
}

# Function to spread the fire
spread_fire() {
    for ((y = height - 1; y >= 0; y--)); do
        for ((x = 0; x < width; x++)); do
            local pixel_intensity=${fire_array[$x,$y]}
            if [ $pixel_intensity -gt 0 ]; then
                local spread=$((RANDOM % 3))
                local target_x=$((x - spread + 1))
                local target_y=$((y - 1))
                if [ $target_y -ge 0 ]; then
                    set_intensity $target_x $target_y $pixel_intensity
                fi
            fi
        done
    done
}

# Function to render the fire
render_fire() {
    clear
    for ((y = 0; y < height; y++)); do
        for ((x = 0; x < width; x++)); do
            local intensity=${fire_array[$x,$y]}
            echo -n "${colors[$intensity]}"
        done
        echo
    done
}

# Main loop
while true; do
    # Set the intensity of the bottom row to a random value
    for ((x = 0; x < width; x++)); do
        set_intensity $x $((height - 1)) $((RANDOM % 6))
    done

    # Spread and render the fire
    spread_fire
    render_fire

    sleep 0.05
done

