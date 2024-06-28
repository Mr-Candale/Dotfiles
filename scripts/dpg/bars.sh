#!/bin/bash

# Function to print a loading bar with a given percentage and style
function print_loading_bar() {
    local percentage=$1
    local bar_length=5
    local fill_length=$((percentage / 1))
    local empty_length=$((bar_length - fill_length))

    local bar=""
    for ((i = 0; i < fill_length; i++)); do
        bar+="█"
    done

    for ((i = 0; i < empty_length; i++)); do
        bar+="░"
    done

    printf "[%s] %3d%%\r" "$bar" "$percentage"
}

# Function to simulate loading bars with different styles
function simulate_loading_bar() {
    local style=$1
    for ((percentage = 0; percentage <= 100; percentage += 1)); do
        print_loading_bar $percentage
        sleep 0.05  # Adjust this value for the speed of the loading bars
    done
}

# Run 10 different loading bars in parallel
for style in {1..10}; do
    simulate_loading_bar $style &
done

# Wait for all background processes to finish
wait

