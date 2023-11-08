#!/bin/bash

# Connect to the i3 IPC interface and fetch workspace information
i3-msg -t get_workspaces | jq -r '.[] | "\(.name): \(.visible) \(.urgent)"'

