#!/bin/bash
#
##################################################################################################################
# Name			:	wirinpi.sh
# Author		:	vekio
# Description	:	install wiringpi project
# Notes			:	check version installed with "gpio -v"
##################################################################################################################

# install wiringpi
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
rm wiringpi-latest.deb
