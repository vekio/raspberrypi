#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   basic config
##################################################################################################################

# Use a .env file to set, eg EMAIL=email@example.com
ENVPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
set -a; [ -f $ENVPATH/.env ] && . $ENVPATH/.env; set +a

# Set system timezone
sudo timedatectl set-timezone $TIMEZONE

# Set up static ethernet ip. Example:
# interface eth0
# static ip_address=192.168.1.100/24
# static routers=192.168.1.1
# static domain_name_servers=8.8.8.8
sudo cp /etc/dhcpcd.conf /etc/dhcpcd.conf.orig
echo -e "$DHCPCD" | sudo tee -a /etc/dhcpcd.conf

# Remove swap
sudo dphys-swapfile swapoff && \
sudo dphys-swapfile uninstall && \
sudo systemctl disable dphys-swapfile

# Disable wifi
echo "dtoverlay=disable-wifi" | sudo tee -a /boot/config.txt

# Mount HDD called store
# Check UUID with lsblk -f
echo "$HDDUUID $MOUNTPOINT ext4 defaults,auto,users,rw,nofail,x-systemd.device-timeout=30 0 0" | sudo tee -a /etc/fstab

# Change hostname
sudo cp /etc/hosts /etc/hosts.orig
sudo cp /etc/hostname /etc/hostname.orig
echo "$HOSTNAME" | sudo tee /etc/hostname
sudo sed -i 's/raspberrypi/'"$HOSTNAME"'/g' /etc/hosts

# Need reboot
sudo reboot
