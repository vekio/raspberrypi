#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install ufw and allow some ports
##################################################################################################################

# update the package lists
sudo apt-get update

# install ufw
sudo apt-get install -y ufw

# enable ufw
yes | sudo ufw enable

# rules
sudo ufw allow 666/tcp          # ssh
sudo ufw allow DNS              # dns
sudo ufw allow WWW              # http
sudo ufw allow WWW\ Secure      # https
sudo ufw allow 2375/tcp         # docker daemon
sudo ufw allow Samba            # samba
