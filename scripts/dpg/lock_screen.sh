#!/bin/bash
IDLE_THRESHOLD=10000  # Adjust this to your preferred idle time (milliseconds)

while true; do
    IDLE=$(xprintidle)
    if [ "$IDLE" -ge "$IDLE_THRESHOLD" ]; then
        i3lock  # Use your preferred screen locker command
    fi
    sleep 60  # Check every minute
done

