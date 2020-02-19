#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install git and set global config
##################################################################################################################

# update the package lists
sudo apt-get update

# install git
sudo apt-get install -y git

# git global config
git config --global user.name vekio
git config --global user.email albertocasta@protonmail.com
