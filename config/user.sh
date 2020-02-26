#!/bin/bash
#
##################################################################################################################
# Name			:	user.sh
# Author		:	vekio
# Description	:	add alberto user to raspbian
# Notes			:	
##################################################################################################################

# add new user
sudo adduser --gecos "" alberto

# add new user to system groups
sudo usermod -aG adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi alberto

# disable sudo password
echo "alberto ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/010_pi-nopasswd
