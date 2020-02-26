#!/bin/bash
#
##################################################################################################################
# Name			:	docker.sh
# Author		:	vekio
# Description	:	install docker-ce and docker-compose
# Notes			:	https://docs.docker.com/install/linux/docker-ce/debian/
#                   https://docs.docker.com/compose/install/
##################################################################################################################

# update the package lists
sudo apt-get update

# install docker
curl -sSL https://get.docker.com | sh

# allow your user to access the docker cli without needing root access
sudo usermod -aG docker alberto

sudo apt-get install -y libffi-dev libssl-dev python3 python3-pip

# install docker-compose using python3 and pip3
sudo pip3 install docker-compose
