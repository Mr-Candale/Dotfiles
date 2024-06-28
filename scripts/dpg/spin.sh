#!/bin/bash

spinner="/-\\|"

while true; do
    for i in $(seq 0 3); do
        echo -n "${spinner:$i:1}"
        echo -ne "\b"
        sleep 0.1
    done
done

