#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	changes sshd_config options
# Comments	:	you can lock the user account but enable PAM
#               or unlock the user account but disable PAM
##################################################################################################################

# variables
PASSWORD=""       # password, eg: "password123\npassword123"

# bakcup sshd_config file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bk

sudo sed -i '/#PermitRootLogin prohibit-password/c\PermitRootLogin no' /etc/ssh/sshd_config     # PermitRootLogin no
sudo sed -i '/#PubkeyAuthentication yes/c\PubkeyAuthentication yes' /etc/ssh/sshd_config        # PubkeyAuthentication yes
sudo sed -i '/#PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config     # PasswordAuthentication no
sudo sed -i '/#PermitEmptyPasswords no/c\PermitEmptyPasswords no' /etc/ssh/sshd_config          # PermitEmptyPasswords no
sudo sed -i '/UsePAM yes/c\UsePAM no' /etc/ssh/sshd_config                                      # UsePAM no

# restart ssh
sudo systemctl restart ssh
sudo service ssh reload

# lock/remove pi's password
#sudo passwd -l pi

# change password
echo -e "$PASSWORD" | sudo passwd pi
