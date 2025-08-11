#!/bin/bash


echo "////////////////////"
echo "Starting script..."
echo "////////////////////"


echo "===================="
echo "Moving Orignal Conf into New..."
echo "===================="

mv ~/Documents/install_script/pacman.conf /etc/pacman.conf 
sleep 1 

echo "\\\\\\\\\\\\\\\\\\\\"
echo "Finished Moving..."
echo "////////////////////"

sleep 1 

echo "===================="
echo "Installing All Apps..." 
echo "===================="

sleep 1 

sudo pacman -Syu 
sudo pacman -S --needed - < ~/Documents/install_script/pkglist.txt

sleep 1

echo "\\\\\\\\\\\\\\\\\\\\"
echo "All Apps now Installed..."
echo "////////////////////"

sleep 2

echo "===================="
echo " Moving GRC file [NMAP]...
echo "===================="

sleep 1 

mv ~/Documents/grc_copy/conf.nmap /usr/share/grc/nmap/conf.nmap
cp /usr/share/grc/nmap/conf.nmap ~/Documents/grc_copy/conf.nmap

sleep 1 

echo "\\\\\\\\\\\\\\\\\\\\"
echo "Moved and Copied CONF.NMAP"
echo "////////////////////"

sleep 1

echo "===================="
echo "Starting LY Welcomer..."
echo "===================="

sleep 1 

sudo systemctl start ly.service

echo "\\\\\\\\\\\\\\\\\\\\"
echo "Started LY Daemon"
echo "////////////////////"

sleep 1 

source ~/.zshrc

echo "\\\\\\\\\\\\\\\\\\\\"
echo "Downloading GRUB theme"
echo "////////////////////"

sleep 1 

wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh
bash /tmp/install.sh

echo "////////////////////"
echo "Successfully Complete..."
echo "\\\\\\\\\\\\\\\\\\\\"

sleep 1


