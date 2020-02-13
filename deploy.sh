#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	script to deploy all i need in a raspberypi 4 with raspbian
# Comments	:	
##################################################################################################################

# variables
HNAME=""            # host name given in key.sh, check .ssh/config

# path to the software folder
SOFTWAREPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/software >/dev/null 2>&1 && pwd )"
# path to the config folder
CONFIGPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/config >/dev/null 2>&1 && pwd )"

# key.sh
bash $CONFIGPATH/key.sh

# start.sh
ssh $HNAME "bash -s" < $CONFIGPATH/start.sh

# ssh.sh
ssh $HNAME "bash -s" < $CONFIGPATH/ssh.sh

# install-all.sh
bash $SOFTWAREPATH/install-all.sh
