#!/bin/bash
#
##################################################################################################################
# Version 	: 	1.1
# Author 	: 	vekio
# Purpose   :   install git and set a global config
##################################################################################################################

# Use a .env file to set, eg EMAIL=email@example.com
ENVPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. >/dev/null 2>&1 && pwd )"
set -a; [ -f $ENVPATH/.env ] && . $ENVPATH/.env; set +a

# Install git
sudo apt-get update && sudo apt-get install -y git

# Set git global config
git config --global user.name $USERNAME
git config --global user.email $EMAIL
