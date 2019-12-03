#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   add a new user to raspberrypi
##################################################################################################################

# Use a .env file to set, eg EMAIL=email@example.com
ENVPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. >/dev/null 2>&1 && pwd )"
set -a; [ -f $ENVPATH/.env ] && . $ENVPATH/.env; set +a

# Add new user.
sudo adduser --disabled-password --gecos "" $USERNAME

# Set the password for the new user.
echo -e "$PASSWORD\n$PASSWORD" | sudo passwd $USERNAME

# Add new user to system groups.
sudo usermod -aG $GROUPS $USERNAME

# Create ssh folder
sudo mkdir -p /home/$USERNAME/.ssh
sudo chmod 700 /home/$USERNAME/.ssh

# Add public key
echo $PUBLICKEY | sudo tee /home/$USERNAME/.ssh/authorized_keys
# Or you can use your keybase to download your public keys, eg:
# wget -O keys https://vekio.keybase.pub/keys?dl=1; cat keys | sudo tee /home/$USERNAME/.ssh/authorized_keys; rm keys
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
sudo chmod 700 /home/$USERNAME/.ssh
sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys

# Sudo password
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/010_pi-nopasswd
