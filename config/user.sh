#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	add a user to raspbian
##################################################################################################################

# variables
USERNAME="alberto"
GROUPS="adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi"

# add new user
sudo adduser --gecos "" $USERNAME
sudo passwd $USERNAME

# add new user to system groups
sudo usermod -aG $GROUPS $USERNAME

# disable sudo password
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/010_pi-nopasswd
