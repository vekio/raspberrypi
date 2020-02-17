#/!bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	this script generate ssh key and it save it in my keybase account, also create a profile in
#               ssh/config and upload the public key to the server
# Comments	:	passwd -l, lock the password of the named account, still be able to login with ssh key
#               ssh profiles: https://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/
##################################################################################################################

# variables
COMMENT=""          # profile comment
FNAME=""            # file name
HNAME=""            # host name
HIP=""              # host IP or URL

# first run keybase
run_keybase
sleep 2s

ls /keybase/private/vekio/keys/

# generate ssh key
ssh-keygen -f /keybase/private/vekio/keys/$FNAME -t rsa -b 4096 -C "" -N ''

# upload the public key to the raspberrypi
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$HIP"
ssh-copy-id -i /keybase/private/vekio/keys/$FNAME.pub pi@$HIP 

# generate .ssh/config profile
echo -e "# $COMMENT\nHost $HNAME\n  HostName $HIP\n  User pi\n  IdentityFile /keybase/private/vekio/keys/$FNAME" | tee -a $HOME/.ssh/config
