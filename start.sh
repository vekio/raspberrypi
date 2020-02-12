#!/bin/bash

##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	automate the first steps after install raspbian
# Comments	:	timezones table: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
#               man passwd: passwd -l, lock the password of the named account
#               remove swap was a good option, but i am not sure anymore
##################################################################################################################

# variables
PASSWORD=""             # password
TIMEZONE=""             # timezone continent/city
NETWORK=""              # network eg: "# network\ninterface eth0\nstatic ip_address=192.168.1.100/24\nstatic routers=192.168.1.1\nstatic domain_name_servers=8.8.8.8 8.8.4.4"
HOSTNAME=""             # hostname

# set system timezone
sudo timedatectl set-timezone $TIMEZONE

# remove swap
# sudo dphys-swapfile swapoff && \
# sudo dphys-swapfile uninstall && \
# sudo systemctl disable dphys-swapfile

# backup original dhcpcd file
sudo cp /etc/dhcpcd.conf /etc/dhcpcd.conf.bk
# add the network
echo -e "$NETWORK" > /dev/null 2>&1 | sudo tee -a /etc/dhcpcd.conf

# change pi's password
sudo passwd -l pi

# Change hostname
sudo cp /etc/hosts /etc/hosts.bk
sudo cp /etc/hostname /etc/hostname.bk
echo "$HOSTNAME" > /dev/null 2>&1 | sudo tee /etc/hostname
sudo sed -i 's/raspberrypi/'"$HOSTNAME"'/g' /etc/hosts

# reboot
sudo reboot
