#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Ensure the script has execute permissions
chmod +x "$0"

# Update packages and install necessary dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release

# Create directory for Docker GPG keys
sudo mkdir -p /etc/apt/keyrings

# Download and store Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker’s official APT repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index and install Docker Engine and plugins
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add current user to the docker group to run Docker without sudo
sudo usermod -aG docker "$USER"

# Download the latest version of Docker Compose binary
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest \
  | grep -Po '"tag_name": "\K[^"]+')
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose

# Make the binary executable
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
docker-compose --version

# Clean up: Remove this script after execution
rm -- "$0"

echo "🚀 Docker and Docker Compose were installed successfully!"
echo "⚠️ Please log out and log back in (or restart your terminal) to apply the Docker group changes."
