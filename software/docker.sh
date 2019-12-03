#!/bin/bash
#
##################################################################################################################
# Version 	: 	1.0
# Author 	: 	vekio
# Purpose   :   install latest version of docker-ce and docker-compose 
# Links     :   https://docs.docker.com/install/linux/docker-ce/debian/
#               https://docs.docker.com/compose/install/
##################################################################################################################

# Update the apt package list.
sudo apt update

# Install Docker's package dependencies.
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Download and add Docker's official public PGP key.
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Verify the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Add the `stable` channel's Docker upstream repository.
echo "deb [arch=armhf] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

# Update the apt package list (for the new apt repo).
sudo apt update

# Install the latest version of Docker CE && Docker Compose
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER

# Install docker-compose using python3 and pip3
sudo apt install python3-pip && \
    sudo pip3 install docker-compose
