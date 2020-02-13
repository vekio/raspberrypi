#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install fail2ban
# Comments	:	
##################################################################################################################

# update the package lists
sudo apt-get update

# install fail2ban
sudo apt-get install -y fail2ban

# copy the original jarl.conf file
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
