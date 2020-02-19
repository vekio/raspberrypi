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

# ports
sudo ufw allow 666/tcp          # 666
sudo ufw allow DNS              # 53
sudo ufw allow WWW              # 80
sudo ufw allow WWW\ Secure      # 443
