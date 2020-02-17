#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	remove user pi from raspbian
##################################################################################################################

# kill pi user process
sudo pkill -u pi

# remove pi user
sudo deluser -remove-home pi
