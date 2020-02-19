#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	automate the first steps after install raspbian
#
# timezones: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
##################################################################################################################

# update && upgrade
sudo apt-get update && sudo apt-get upgrade -y

# remove swap
# check free -h
sudo dphys-swapfile swapoff && \
sudo dphys-swapfile uninstall && \
sudo systemctl disable dphys-swapfile

# timezone
sudo timedatectl set-timezone Europe/Madrid

# mount hdd
# check UUID with lsblk -f
echo "UUID=a8ee6272-205f-4f0f-990a-909844058505 /media/storage ext4 defaults,auto,users,rw,nofail,x-systemd.device-timeout=30 0 0" | sudo tee -a /etc/fstab

# network
# backup original dhcpcd file
sudo cp /etc/dhcpcd.conf /etc/dhcpcd.conf.bak
sudo wget -O /tmp/dhcpcd.conf https://raw.githubusercontent.com/vekio/raspberrypi/master/config/dhcpcd.conf
sudo cat /tmp/dhcpcd.conf | sudo tee -a /etc/dhcpcd.conf
sudo rm /tmp/dhcpcd.conf

# ssh
# bakcup sshd_config file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/vekio/raspberrypi/master/config/sshd_config
sudo usermod -aG ssh alberto
sudo systemctl restart ssh

# hostname
sudo cp /etc/hosts /etc/hosts.bak
sudo cp /etc/hostname /etc/hostname.bak
echo "cloud" | sudo tee /etc/hostname
sudo sed -i 's/raspberrypi/'"cloud"'/g' /etc/hosts

# change hostname needs reboot
sudo reboot
