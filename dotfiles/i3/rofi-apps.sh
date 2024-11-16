#!/bin/bash

# Function to log messages for debugging
log_debug() {
    echo "$1" >> ~/rofi-apps-debug.log
}

# Get the list of desktop applications
APPS=$(grep -l '^Exec=' /usr/share/applications/*.desktop | sed 's#.*/##' | sed 's/.desktop//' | sort | uniq)
log_debug "Available apps:\n$APPS"

# Show the list in rofi and get the selected application
SELECTED_APP=$(echo "$APPS" | rofi -dmenu -i -p "Run:")
log_debug "Selected app: $SELECTED_APP"

if [ -z "$SELECTED_APP" ]; then
    log_debug "No application selected. Exiting."
    exit 1
fi

# Find the corresponding .desktop file
DESKTOP_FILE="/usr/share/applications/$SELECTED_APP.desktop"
log_debug "Desktop file: $DESKTOP_FILE"

if [ ! -f "$DESKTOP_FILE" ]; then
    log_debug "Desktop file not found: $DESKTOP_FILE"
    echo "Application not found"
    exit 1
fi

# Get the Exec line from the .desktop file
EXEC_CMD=$(grep '^Exec=' "$DESKTOP_FILE" | head -1 | sed 's/^Exec=//' | sed 's/ %.*$//')
log_debug "Exec command: $EXEC_CMD"

if [ -z "$EXEC_CMD" ]; then
    log_debug "Exec command not found in .desktop file"
    echo "Exec command not found in .desktop file"
    exit 1
fi

# Check if the selected application requires sudo
if [[ "$EXEC_CMD" =~ ^(.*gparted.*|.*synaptic.*|.*anonsurf.*|.*anon-check-ip.*)$ ]]; then
    log_debug "Running with sudo: $EXEC_CMD"
    # Run the application with sudo
    echo "$EXEC_CMD" | sudo -S bash -c "$(cat)"
else
    log_debug "Running without sudo: $EXEC_CMD"
    # Run the application without sudo
    bash -c "$EXEC_CMD"
fi

log_debug "Command executed."

