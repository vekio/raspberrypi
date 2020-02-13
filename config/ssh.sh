#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	changes sshd_config options
# Comments	:	
##################################################################################################################

# bakcup sshd_config file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig

sudo sed -i '/#PermitRootLogin prohibit-password/c\PermitRootLogin no' /etc/ssh/sshd_config     # PermitRootLogin no
sudo sed -i '/#PubkeyAuthentication yes/c\PubkeyAuthentication yes' /etc/ssh/sshd_config        # PubkeyAuthentication yes
sudo sed -i '/#PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config     # PasswordAuthentication no
sudo sed -i '/UsePAM yes/c\UsePAM no' /etc/ssh/sshd_config                                      # UsePAM no

# restart ssh
sudo systemctl restart ssh
sudo service ssh reload

# lock/remove pi's password
sudo passwd -l pi
