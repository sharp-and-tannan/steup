#!/bin/bash

# Add Docker's official GPG key and repository

set -e

echo "Updating system..."
sudo apt update

echo "Installing prerequisites..."
sudo apt install -y ca-certificates curl

echo "Creating keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "Downloading Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Adding Docker repository to Apt sources..."
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

echo "Updating Apt package index..."
sudo apt update

echo "Docker installing"
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y 
echo "Docker installed"


# curl -fsSL https://raw.githubusercontent.com/sharp-and-tannan/steup/refs/heads/main/docker.sh | bash

