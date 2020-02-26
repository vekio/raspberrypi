#!/bin/bash
#
##################################################################################################################
# Name			:	samba.sh
# Author		:	vekio
# Description	:	install samba
# Notes			:	
##################################################################################################################

# config path
CONFIGPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../config" >/dev/null 2>&1 && pwd )"

# update the package lists
sudo apt-get update

# install samba
sudo apt-get install -y samba

# backup smb.conf
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# group media
sudo groupadd media
sudo usermod -aG media alberto

# update ufw
sudo ufw allow Samba

# smb.conf
sudo cat $CONFIGPATH/smb.conf | sudo tee /etc/samba/smb.conf
sudo systemctl restart smbd
