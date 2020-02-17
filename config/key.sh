#!/bin/bash
#
##################################################################################################################
# Version	:	1.1
# Author	:	vekio
# Purpose	:	this script generate a ssh key and save it in a keybase account,
#               also create a profile in ssh/config and upload the public key to the server
##################################################################################################################

# variables
USERNAME=""         # user name
COMMENT=""          # profile comment
KEYFILE=""          # key file name
PROFILE=""          # ssh pronfile name
IP=""               # host IP or URL
PORT=""             # port to enable ssh
KEYBASE=""          # keybase path to your keys

# first run keybase
run_keybase
ls $KEYBASE

# generate ssh key
ssh-keygen -f $KEYBASE/$KEYFILE -t rsa -b 4096 -C "" -N ''

# remove the know host
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$IP"

# upload the public key to the raspberrypi
ssh-copy-id -i $KEYBASE/$KEYFILE.pub $USERNAME@$IP 

# generate .ssh/config profile
echo -e "# $COMMENT\nHost $PROFILE\n  HostName $IP\n  Port $PORT\n  User $USERNAME\n  IdentityFile $KEYBASE/$KEYFILE" | tee -a $HOME/.ssh/config
