#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   install or update openssh
##################################################################################################################

# Install OpenSSH
sudo apt update && sudo apt install -y openssh-server

# Copy the original sshd_config file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig

# PermitRootLogin no
sed -i '/#PermitRootLogin prohibit-password/c\PermitRootLogin no' /etc/ssh/sshd_config
# PubkeyAuthentication yes
sed -i '/#PubkeyAuthentication yes/c\PubkeyAuthentication yes' /etc/ssh/sshd_config
# PasswordAuthentication no
sed -i '/#PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config
# UsePAM no
sed -i '/UsePAM yes/c\UsePAM no' /etc/ssh/sshd_config

# Restart ssh
sudo systemctl restart ssh
sudo service ssh reload
