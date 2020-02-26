#!/bin/bash
#
##################################################################################################################
# Name			:	config.sh
# Author		:	vekio
# Description	:	set up my basic config on raspbian
# Notes			:	timezones: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
##################################################################################################################


# config folder path
CONFIGPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# update && upgrade
sudo apt-get update && sudo apt-get upgrade -y

# remove swap
# check free -h
sudo dphys-swapfile swapoff && \
sudo dphys-swapfile uninstall && \
sudo systemctl disable dphys-swapfile

# timezone
sudo timedatectl set-timezone Europe/Madrid

# mount hdd as /home/alberto
# check UUID with lsblk -f
echo "UUID=a8ee6272-205f-4f0f-990a-909844058505 /media/storage ext4 defaults,auto,users,rw,nofail,x-systemd.device-timeout=30 0 0" | sudo tee -a /etc/fstab
sudo cp -a /home/alberto/. /media/storage/
sudo rm -r /home/alberto
sed -i '$ d' /etc/fstab
echo "UUID=a8ee6272-205f-4f0f-990a-909844058505 /home/alberto ext4 defaults,auto,users,rw,nofail,x-systemd.device-timeout=30 0 0" | sudo tee -a /etc/fstab

# network
# backup original dhcpcd file
sudo cp /etc/dhcpcd.conf /etc/dhcpcd.conf.bak
sudo cat $CONFIGPATH/dhcpcd.conf | sudo tee -a /etc/dhcpcd.conf

# ssh
# bakcup sshd_config file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo cat $CONFIGPATH/sshd_config | sudo tee /etc/ssh/sshd_config
sudo usermod -aG ssh alberto
sudo systemctl restart ssh

# hostname
sudo cp /etc/hosts /etc/hosts.bak
sudo cp /etc/hostname /etc/hostname.bak
echo "cloud" | sudo tee /etc/hostname
sudo sed -i 's/raspberrypi/'"cloud"'/g' /etc/hosts

# change hostname needs reboot
sudo reboot
