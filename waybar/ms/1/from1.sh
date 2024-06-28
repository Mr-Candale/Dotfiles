#!/bin/bash

# Define the source directory where the files were originally located
source_dir="/home/pan_svichka/.config/waybar/"

# Define the destination directory where the files were moved previously
destination_dir="$HOME/.config/waybar/style1/"

# Check if the destination directory exists
if [ ! -d "$destination_dir" ]; then
    echo "Destination directory $destination_dir does not exist."
    exit 1
fi

# Move the files back to the source directory
mv "$destination_dir/config" "$source_dir"
mv "$destination_dir/style.css" "$source_dir"

# Check if the files are moved back successfully
if [ $? -eq 0 ]; then
    echo "Files moved back successfully to $source_dir"
else
    echo "Failed to move files back"
fi

