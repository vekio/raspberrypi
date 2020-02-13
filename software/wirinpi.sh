#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install latest version of wiringpi project
# Comments	:	http://wiringpi.com/
#               latest version 2.52: http://wiringpi.com/wiringpi-updated-to-2-52-for-the-raspberry-pi-4b/
#               check installation with "gpio -v"
##################################################################################################################

# install wiringpi
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
rm wiringpi-latest.deb
