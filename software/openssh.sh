#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   install or update openssh
##################################################################################################################

# Install OpenSSH
sudo apt update && sudo apt install -y openssh-server

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig

# PermitRootLogin no
sed -i '/PermitRootLogin/c\PermitRootLogin no' /etc/ssh/sshd_config

# PubkeyAuthentication yes
sed -i '/PubkeyAuthentication/c\PubkeyAuthentication yes' /etc/ssh/sshd_config

# PasswordAuthentication no
sed -i '/PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config

# UsePAM no
sed -i '/UsePAM/c\UsePAM no' /etc/ssh/sshd_config

# Restart ssh
sudo systemctl restart ssh
sudo service ssh reload
