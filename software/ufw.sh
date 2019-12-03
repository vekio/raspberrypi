#!/bin/bash
#
##################################################################################################################
# Version 	: 	1.0
# Author 	: 	vekio
##################################################################################################################

# Insall ufw firewall
sudo apt-get update && sudo apt-get install -y ufw

# Enable ufw
yes | sudo ufw enable

# Open ssh port
sudo ufw allow OpenSSH          # 22
sudo ufw allow DNS              # 53
sudo ufw allow WWW              # 80
sudo ufw allow WWW\ Secure      # 443
