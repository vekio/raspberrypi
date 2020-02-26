#!/bin/bash
#
##################################################################################################################
# Name			:	ufw.sh
# Author		:	vekio
# Description	:	install ufw and add some rules
# Notes			:	
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
