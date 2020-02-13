#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install latest version of python3 and some needed packages
# Comments	:	
##################################################################################################################

# https://installvirtual.com/how-to-install-python-3-8-on-raspberry-pi-raspbian/

# update the package lists
sudo apt-get update

# install pip3
sudo apt-get install -y python3-pip
