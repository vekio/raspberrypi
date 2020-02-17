#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install vim on raspbian
##################################################################################################################

# update the package lists
sudo apt-get update

# install git
sudo apt-get install -y vim

# download my .vimrc
wget https://raw.githubusercontent.com/vekio/dotfiles/master/vim/.vimrc
