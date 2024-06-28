#!/bin/bash

# Define the source directory where the files are located
source_dir="/home/pan_svichka/.config/waybar/"

# Define the destination directory
destination_dir="$HOME/.config/waybar/style2/"

# Check if the destination directory exists, if not, create it
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

# Move the files to the destination directory
mv "$source_dir/config" "$destination_dir"
mv "$source_dir/style.css" "$destination_dir"

# Check if the files are moved successfully
if [ $? -eq 0 ]; then
    echo "Files moved successfully to $destination_dir"
else
    echo "Failed to move files"
fi
