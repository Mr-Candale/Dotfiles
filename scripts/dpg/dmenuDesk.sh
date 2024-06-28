#!/bin/bash
applications_dir="~/.local/share/applications"  # Change this to the directory where your .desktop files are located
selected_app=$(find $applications_dir -type f -name '*.desktop' -exec basename {} .desktop \; | dmenu -p "Run application: ")
if [ -n "$selected_app" ]; then
    desktop-file-run "$applications_dir/$selected_app.desktop"
fi

