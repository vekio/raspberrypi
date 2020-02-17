#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install ufw and allow some ports
# Comments	:	
##################################################################################################################

# update the package lists
sudo apt-get update

# enable ufw
yes | sudo ufw enable

# ports
sudo ufw allow OpenSSH          # 22
sudo ufw allow DNS              # 53
sudo ufw allow WWW              # 80
sudo ufw allow WWW\ Secure      # 443
