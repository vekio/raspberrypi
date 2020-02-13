#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install git and set global config
# Comments	:	
##################################################################################################################

# global config
NAME=""
EMAIL=""

# update the package lists
sudo apt-get update

# install git
sudo apt-get install -y git

# git global config
git config --global user.name $NAME
git config --global user.email $EMAIL
