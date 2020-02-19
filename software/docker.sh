#!/bin/bash
#
##################################################################################################################
# Version	:	2.0
# Author	:	vekio
# Purpose	:	install latest version of docker-ce and docker-compose 
# 
# https://docs.docker.com/install/linux/docker-ce/debian/
# https://docs.docker.com/compose/install/
##################################################################################################################

# update the package lists
sudo apt-get update

# install Docker
curl -sSL https://get.docker.com | sh

# allow your user to access the docker cli without needing root access
sudo usermod -aG docker alberto

sudo apt-get install -y libffi-dev libssl-dev python3 python3-pip

# install docker-compose using python3 and pip3
sudo pip3 install docker-compose
