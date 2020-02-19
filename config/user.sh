#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	add a alberto user to raspbian
##################################################################################################################

# add new user
sudo adduser --gecos "" alberto

# add new user to system groups
sudo usermod -aG adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi alberto

# disable sudo password
echo "alberto ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/010_pi-nopasswd
