#!/bin/bash
#
##################################################################################################################
# Version   :   1.1
# Author 	:   vekio
# Purpose   :   set up pi-hole with my own adlist, whitelist, regex
##################################################################################################################

# Use a .env file to set, eg EMAIL=email@example.com
ENVPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. >/dev/null 2>&1 && pwd )"
set -a; [ -f $ENVPATH/.env ] && . $ENVPATH/.env; set +a

# Full path to this lists path
# so doesnt matter where you clone the repository
# for run this script
LISTSPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Add adlists/regexlist/whitelist to pihole docker volume
cat $LISTSPATH/adlists.list | sudo tee $VOLUMES/etc/pihole/adlists.list
cat $LISTSPATH/regex.list | sudo tee $VOLUMES/etc/pihole/regex.list
cat $LISTSPATH/whitelist.list | sudo tee $VOLUMES/etc/pihole/whitelist.list