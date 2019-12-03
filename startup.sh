#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   one single script to config raspberrypi after burn sdcard and install all the software I need
# Comments  :   I think the way I have done it is quite shabby there has to be another way
# Arguments :   raspberrypi's IP
##################################################################################################################
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
##################################################################################################################
if [ "$1" != "" ]; then
    # Use a .env file to set, eg EMAIL=email@example.com
    ENVPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. >/dev/null 2>&1 && pwd )"
    set -a; [ -f $ENVPATH/.env ] && . $ENVPATH/.env; set +a

    INSTALLPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/installation >/dev/null 2>&1 && pwd )"

    # Add new user
    ssh pi@$1 "bash -s" < $INSTALLPATH/adduser.sh

    # Login new user
    ssh $USERNAME@$1 "git clone https://github.com/vekio/raspberrypi.git"; bash raspberrypi/installation/config.sh

    # Wait for reboot
    sleep 1m

    # Login with new user and new ip if you change it in dhcpcd_config
    ssh $USERNAME@$NEWIP && bash raspberrypi/installation/install.sh

else
    echo "Missing argument, raspberrypi's IP"
fi