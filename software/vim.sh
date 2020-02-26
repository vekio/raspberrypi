#!/bin/bash
#
##################################################################################################################
# Version	:	1.0
# Author	:	vekio
# Purpose	:	install vim
##################################################################################################################

# update the package lists
sudo apt-get update

# install git
sudo apt-get install -y vim

# download my .vimrc
wget -O /home/alberto/.vimrc https://raw.githubusercontent.com/vekio/dotfiles/master/.vimrc
