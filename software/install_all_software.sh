#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   one script to install all
##################################################################################################################

SOFTWAREPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Update and Upgrade packages
bash $SOFTWAREPATH/update_upgrade.sh

# Install git
bash $SOFTWAREPATH/git.sh

# Install ufw firewall
# Check ports insisde
bash $SOFTWAREPATH/ufw.sh

# Install fail2ban
bash $SOFTWAREPATH/fail2ban.sh

# Install fail2ban
bash $SOFTWAREPATH/openssh.sh

# Install docker & docker-compose
bash $SOFTWAREPATH/docker.sh

# Install wiringpi
bash $SOFTWAREPATH/wiringpi.sh

# Install fan_controller
bash $SOFTWAREPATH/fan_controller.sh
