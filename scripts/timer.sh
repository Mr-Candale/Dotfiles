#!/bin/bash

# Function to display time remaining
function show_time_remaining() {
  local duration=$1
  local increment=1

  for ((i = 0; i < duration; i++)); do
    sleep "$increment"
    ((remaining = duration - i))
    local hours=$((remaining / 3600))
    local minutes=$(( (remaining % 3600) / 60 ))
    local seconds=$((remaining % 60))
    printf "\r%02d:%02d:%02d" "$hours" "$minutes" "$seconds"
  done

  echo ""  # Move to the next line after the timer completes

  # Play a sound when the timer ends (add your sound file path here)
  paplay ~/Music/sfx/timer.wav
}

# Function to convert HH MM SS to seconds
function hh_mm_ss_to_seconds() {
  local hh=$1
  local mm=$2
  local ss=$3
  echo $((hh * 3600 + mm * 60 + ss))
}

# Main timer function
function start_timer() {
  local hh=$1
  local mm=$2
  local ss=$3

  if [ "$hh" -lt 0 ] || [ "$mm" -lt 0 ] || [ "$ss" -lt 0 ]; then
    echo "Timer duration components (HH, MM, SS) must be non-negative."
    exit 1
  fi

  local time_in_seconds=$(hh_mm_ss_to_seconds "$hh" "$mm" "$ss")

  if [ "$time_in_seconds" -le 0 ]; then
    echo "Timer duration must be greater than 0 seconds."
    exit 1
  fi

  echo "Timer set for $hh hours, $mm minutes, and $ss seconds."
  show_time_remaining "$time_in_seconds"
  echo "Timer completed!"
}

# Help function
function show_help() {
  echo "Usage: $0 [OPTIONS]"
  echo "Options:"
  echo "  -h <hours>    Set the hours component of the timer."
  echo "  -m <minutes>  Set the minutes component of the timer."
  echo "  -s <seconds>  Set the seconds component of the timer."
  echo "  -d            Show this help message."
}

# Parse command-line arguments
while getopts ":h:m:s:d" opt; do
  case $opt in
    h)
      hours="$OPTARG"
      ;;
    m)
      minutes="$OPTARG"
      ;;
    s)
      seconds="$OPTARG"
      ;;
    d)
      show_help
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      show_help
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      show_help
      exit 1
      ;;
  esac
done

# Check if any of the timer components were set
if [ -n "$hours" ] || [ -n "$minutes" ] || [ -n "$seconds" ]; then
  if [ -n "$hours" ]; then
    if [ -n "$minutes" ]; then
      if [ -n "$seconds" ]; then
        start_timer "$hours" "$minutes" "$seconds"
      else
        start_timer "$hours" "$minutes" 0
      fi
    elif [ -n "$seconds" ]; then
      start_timer "$hours" 0 "$seconds"
    else
      start_timer "$hours" 0 0
    fi
  elif [ -n "$minutes" ]; then
    if [ -n "$seconds" ]; then
      start_timer 0 "$minutes" "$seconds"
    else
      start_timer 0 "$minutes" 0
    fi
  elif [ -n "$seconds" ]; then
    start_timer 0 0 "$seconds"
  fi
else
  echo "No timer components specified."
  show_help
  exit 1
fi

