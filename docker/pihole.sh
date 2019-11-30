#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   set up pi-hole with my own adlist, whitelist, regex
# Links     :   https://stackoverflow.com/a/4774063
##################################################################################################################

# Full path to this script
# so doesnt matter where you clone the repository
# for run this script
SCRIPTPAHT="$( cd "$(dirname "$0")"; pwd -P)"

# Add adlists/regexlist/whitelist to pihole docker volume
cat $SCRIPTPAHT/adlists.list | sudo tee $VOLUMES/etc/pihole/adlists.list
cat $SCRIPTPAHT/regex.list | sudo tee $VOLUMES/etc/pihole/regex.list
cat $SCRIPTPAHT/whitelist.list | sudo tee $VOLUMES/etc/pihole/whitelist.list
