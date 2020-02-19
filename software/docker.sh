#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install latest version of docker-ce and docker-compose 
# 
# https://docs.docker.com/install/linux/docker-ce/debian/
# https://docs.docker.com/compose/install/
##################################################################################################################

# update the package lists
sudo apt-get update

# install docker's package dependencies
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# download and add docker's official public pgp key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# verify the fingerprint
sudo apt-key fingerprint 0EBFCD88

# add the `stable` channel's Docker upstream repository
echo "deb [arch=armhf] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

# update the apt package list (for the new apt repo)
sudo apt-get update

# install the latest version of docker ce 
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# allow your user to access the docker cli without needing root access
sudo usermod -aG docker pi

# error installing docker-compose, ffi.h not found
sudo apt-get install -y libffi-dev

# install docker-compose using python3 and pip3
sudo apt-get install -y python3-pip && \
    sudo pip3 install docker-compose
