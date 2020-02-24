#!/bin/bash
#
##################################################################################################################
# Name			:	samba.sh
# Author		:	vekio
# Description	:	install samba
# Notes			:	
##################################################################################################################

# update the package lists
sudo apt-get update

# install samba
sudo apt-get install -y samba

# backup smb.conf
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
