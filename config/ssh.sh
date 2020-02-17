#!/bin/bash
#
##################################################################################################################
# Version	:	1.1
# Author	:	vekio
# Purpose	:	changes sshd_config options
##################################################################################################################

# bakcup sshd_config file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# download sshd_config
sudo wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/vekio/raspberrypi/master/config/sshd_config

# restart ssh
sudo systemctl restart ssh
