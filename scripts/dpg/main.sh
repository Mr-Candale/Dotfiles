#!/bin/bash

# Function to display the larger vertical hourglass animation
display_larger_vertical_hourglass() {
  local animation="/-|-\\|/"
  local delay=0.08  # Adjust this value to change the animation speed
  local count=0
  local height=20   # Adjust this value to change the height of the hourglass

  while true; do
    clear  # Clear the terminal
    printf "\e[?25l"  # Hide the cursor
    for ((i = 1; i <= height; i++)); do
      printf "%*s%s%s\n" $(( (height - i) / 2 )) "" "${animation:$count:1}" "${animation:$count:1}"
    done
    for ((i = height - 1; i >= 1; i--)); do
      printf "%*s%s%s\n" $(( (height - i) / 2 )) "" "${animation:$count:1}" "${animation:$count:1}"
    done
    sleep $delay
    ((count = (count + 1) % 8))
  done
}

# Start the larger vertical animation in the background
display_larger_vertical_hourglass &

# Capture the background process ID
hourglass_pid=$!

# Trap the SIGINT signal (Ctrl+C) to clean up and exit
trap 'kill -9 $hourglass_pid; clear; printf "\e[?25h\nAnimation stopped. Your script can continue here.\n"; exit 0' INT

# Main program logic (replace with your application logic)
echo "Press Ctrl+C to stop the animation..."
sleep 1000  # Simulate your application running for 10 seconds

