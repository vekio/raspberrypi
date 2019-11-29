#!/bin/bash
#
##################################################################################################################
# Version 	: 	1.0
# Author 	: 	vekio
# Purpose   :   install git and set a global config
##################################################################################################################

# Use a .env file to set, eg EMAIL=email@example.com
set -a; [ -f .env ] && . .env; set +a

# Install git
sudo apt-get update && sudo apt-get install -y git

# Set git global config
git config --global user.name $USERNAME
git config --global user.email $EMAIL
