#!/bin/bash
#
##################################################################################################################
# Name			:	removepi.sh
# Author		:	vekio
# Description	:	remove user pi from raspbian
# Notes			:	
##################################################################################################################

# kill pi user process
sudo pkill -u pi

# remove pi user
sudo deluser -remove-home pi
