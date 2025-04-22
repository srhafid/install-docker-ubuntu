#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Remove Docker packages
echo "Removing Docker packages..."
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Remove Docker Compose binary
echo "Removing Docker Compose binary..."
sudo rm -f /usr/local/bin/docker-compose

# Remove Docker's official GPG key and repository
echo "Removing Docker GPG key and repository..."
sudo rm -f /etc/apt/keyrings/docker.gpg
sudo rm -f /etc/apt/sources.list.d/docker.list

# Remove user from the docker group
echo "Removing user from the Docker group..."
sudo deluser "$USER" docker

# Remove any leftover Docker files
echo "Removing Docker files and directories..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker

# Clean up unnecessary packages and dependencies
echo "Removing unnecessary packages..."
sudo apt-get autoremove -y
sudo apt-get clean

# Update package index
sudo apt update

echo "🚀 Docker and Docker Compose were successfully uninstalled!"
