#!/bin/bash
#
##################################################################################################################
# Name			:	fail2ban.sh
# Author		:	vekio
# Description	:	install fail2ban
# Notes			:	
##################################################################################################################

# update the package lists
sudo apt-get update

# install fail2ban
sudo apt-get install -y fail2ban

# copy the original jarl.conf file
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
