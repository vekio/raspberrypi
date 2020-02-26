#!/bin/bash
#
##################################################################################################################
# Name			:	git.sh
# Author		:	vekio
# Description	:	install git and set global config
# Notes			:	
##################################################################################################################

# update the package lists
sudo apt-get update

# install git
sudo apt-get install -y git

# git global config
git config --global user.name vekio
git config --global user.email albertocasta@protonmail.com
