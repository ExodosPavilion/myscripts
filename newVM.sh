#!/bin/bash

# Get new hostname from user input
read -p "Enter the new hostname: " new_hostname

# Update the hostname file
sudo bash -c "echo $new_hostname > /etc/hostname"

# Update all packages
sudo pacman -Syu --noconfirm

# Install tailscale from online script
curl -fsSL https://tailscale.com/install.sh | sh
