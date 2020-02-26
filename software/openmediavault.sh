#!/bin/bash
#
##################################################################################################################
# Name			:	openmediavault.sh
# Author		:	vekio
# Description	:	install openmediavualt
# Notes			:	https://github.com/OpenMediaVault-Plugin-Developers/installScript/blob/master/README.md
#                   https://forum.openmediavault.org/index.php/Thread/28789-Installing-OMV5-on-Raspberry-PI-s-Armbian-SBC-s-i386-32-bit-platforms/
##################################################################################################################

# install openmediavault
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash
