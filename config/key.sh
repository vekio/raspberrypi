#!/bin/bash
#
##################################################################################################################
# Name			:	key.sh
# Author		:	vekio
# Description	:	this script generate a ssh key and save it in my keybase account
#                   also create a profile in ssh/config and upload the public key to the server
# Notes			:	
##################################################################################################################

# first run keybase
run_keybase
ls /keybase/private/vekio/keys

# generate ssh key
ssh-keygen -f /keybase/private/vekio/keys/cloud -t rsa -b 4096 -C "" -N ''

# remove the know host
ssh-keygen -f "/home/alberto/.ssh/known_hosts" -R "192.168.1.120"

# upload the public key to the raspberrypi
ssh-copy-id -i /keybase/private/vekio/keys/cloud.pub alberto@192.168.1.120

# generate .ssh/config profile
echo -e "# raspberrypi4\nHost cloud\n  HostName 192.168.1.120\n  Port 666\n  User alberto\n  IdentityFile /keybase/private/vekio/keys/cloud" | tee -a /home/alberto/.ssh/config
