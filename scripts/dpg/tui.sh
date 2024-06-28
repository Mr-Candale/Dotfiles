#!/bin/bash

# Function to clear the screen
clear_screen() {
    clear
}

# Function to display the main menu
display_menu() {
    clear_screen
    echo "Welcome to the Bash TUI Menu"
    echo "1. Option 1"
    echo "2. Option 2"
    echo "3. Quit"
}

# Function to handle user input
handle_input() {
    read -p "Enter your choice: " choice
    case $choice in
        1)
            clear_screen
            echo "You selected Option 1"
            read -n 1 -s -r -p "Press any key to continue..."
            display_menu
            handle_input
            ;;
        2)
            clear_screen
            echo "You selected Option 2"
            read -n 1 -s -r -p "Press any key to continue..."
            display_menu
            handle_input
            ;;
        3)
            clear_screen
            echo "Goodbye!"
            exit 0
            ;;
        *)
            clear_screen
            echo "Invalid choice. Please try again."
            read -n 1 -s -r -p "Press any key to continue..."
            display_menu
            handle_input
            ;;
    esac
}

# Main function
main() {
    while true; do
        display_menu
        handle_input
    done
}

# Start the TUI
main

