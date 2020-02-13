#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	one script to install them all, from your local pc
# Comments	:	
##################################################################################################################

# variables
HNAME=""            # host name given in key.sh, check .ssh/config

# path to the software folder
SOFTWAREPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# git
ssh $HNAME "bash -s" < $SOFTWAREPATH/git.sh
# wiringpi
ssh $HNAME "bash -s" < $SOFTWAREPATH/wiringpi.sh
# fan-controller
ssh $HNAME "bash -s" < $SOFTWAREPATH/fan-controller.sh
# fail2ban
ssh $HNAME "bash -s" < $SOFTWAREPATH/fail2ban.sh
# python
ssh $HNAME "bash -s" < $SOFTWAREPATH/python3.sh
# docker
ssh $HNAME "bash -s" < $SOFTWAREPATH/docker.sh
