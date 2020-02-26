#!/bin/bash
#
##################################################################################################################
# Name			:	fan-controller.sh
# Author		:	vekio
# Description	:	install a fan controller
# Notes			:	https://howchoo.com/g/ote2mjkzzta/control-raspberry-pi-fan-temperature-python
#                   https://github.com/Howchoo/pi-fan-controller
##################################################################################################################

# update the package lists
sudo apt-get update

# install fan controll repository
cd /tmp
git clone https://github.com/Howchoo/pi-fan-controller.git
sudo pip3 install -r pi-fan-controller/requirements.txt
./pi-fan-controller/script/install
sudo rm -R pi-fan-controller
