#!/bin/bash
#
##################################################################################################################
# Version 	: 	1.0
# Author 	: 	vekio
##################################################################################################################

# Remove pi user
sudo pkill -u pi
sudo deluser -remove-home pi
