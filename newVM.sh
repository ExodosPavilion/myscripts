#!/bin/bash

# Get new hostname from user input
read -p "Enter the new hostname: " new_hostname

# Update the hostname file
sudo bash -c "echo $new_hostname > /etc/hostname"

# Uninstall tailscale
sudo pacman -R tailscale

# Delete SSH host keys
sudo rm -f -v /etc/ssh/ssh_host_*_key*

# Generate new SSH host keys
sudo ssh-keygen -A -v

# Install archlinux-keyring
sudo pacman -S archlinux-keyring --noconfirm

# Update all packages
sudo pacman -Syu --noconfirm

# Install tailscale from online script
curl -fsSL https://tailscale.com/install.sh | sh
