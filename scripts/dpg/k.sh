#!/bin/bash

# Set the terminal size and hide cursor
printf "\e[8;40;100t"
tput civis

# Function to generate a random number between 0 and 9
generate_number() {
    echo $((RANDOM % 10))
}

# Function to display falling numbers
falling_numbers() {
    tput cup 0 0
    for ((i = 0; i < 40; i++)); do
        for ((j = 0; j < 10; j++)); do
            tput cup $((i + j)) $i
            echo -e "\e[38;5;$(generate_number)mx"
            sleep 0.05
        done
    done
}

# Function to display a loading bar
loading_bar() {
    for ((i = 0; i <= 100; i++)); do
        tput cup 50 0
        echo -n "Loading: ["
        for ((j = 0; j < i / 2; j++)); do
            echo -n "#"
        done
        for ((j = i / 2; j < 50; j++)); do
            echo -n " "
        done
        echo -n "] $i%"
        sleep 0.1
        tput el1  # Clear the line
    done
    echo
}

# Function to create an animation
animation() {
    frames=("⣾⢿⡿⣿" "⡿⣿⣟⣿" "⣿⣿⣿⣿" "⣷⣿⣿⣻")
    while true; do
        for frame in "${frames[@]}"; do
            tput cup 30 0
            echo -e "$frame"
            sleep 0.2
        done
    done
}

# Main script
clear
falling_numbers
loading_bar
animation

# Reset terminal settings and show cursor
printf "\e[8;24;80t"
tput cnorm

