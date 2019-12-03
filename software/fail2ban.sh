#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   install fail2ban
##################################################################################################################

# Install OpenSSH
sudo apt update && sudo apt install -y fail2ban

# Copy the original jarl.conf file
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
