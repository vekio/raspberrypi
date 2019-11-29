#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Links     :   https://howchoo.com/g/ote2mjkzzta/control-raspberry-pi-fan-temperature-python
##################################################################################################################

# Install fan controll scripts
cd /tmp
git clone https://github.com/Howchoo/pi-fan-controller.git
./pi-fan-controller/script/install
sudo rm -R pi-fan-controller
