#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   install latest version of wiringpi project
# Links     :   http://wiringpi.com/wiringpi-updated-to-2-52-for-the-raspberry-pi-4b/
#               http://wiringpi.com/
##################################################################################################################

# Insall wiringpi
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb