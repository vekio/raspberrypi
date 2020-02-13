#/!bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	this script generate ssh key and it save it in my keybase account, also create a profile in
#               ssh/config and upload the public key to the server
# Comments	:	man passwd: passwd -l, lock the password of the named account
##################################################################################################################

# variables
COMMENT=""          # profile comment
FNAME=""            # file name
HNAME=""            # host name
HIP=""              # host IP or URL

# first run keybase
run_keybase

# generate ssh key
ssh-keygen -f /keybase/private/vekio/keys/$FNAME -t rsa -b 4096 -C "" -N ''

# upload the public key to the raspberrypi
ssh-copy-id -i /keybase/private/vekio/keys/$FNAME.pub pi@$HIP 

# generate .ssh/config profile
echo -e "# $COMMENT\n  Host $HNAME\n  HostName $HIP\n  User pi\n  IdentifyFile /keybase/private/vekio/keys/$FNAME" > /dev/null 2>&1 | tee -a $HOME/.ssh/config
