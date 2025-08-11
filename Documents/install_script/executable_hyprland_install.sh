#!/bin/bash


echo "\\\\\\\\\\\\\\\\\\"
echo "Starting..."
echo "//////////////////"

sleep 3

sudo pacman -Syu

echo "//////////////////"
echo "Updated Pacman..."
echo "//////////////////"

sleep 1 

sudo pacman -S base-devel git

sleep 1 

echo "//////////////////"
echo "Installed Essentials..."
echo "//////////////////"

echo "\\\\\\\\\\\\\\\\\\"
echo "Installing Relevent Packages..."
echo "//////////////////"

sudo pacman -S base-devel meson ninja cmake git pkgconf wlroots wayland wayland-protocols libinput xcb-util-xrm xorg-server-xwayland cairo pango libjpeg-turbo freetype2 pixman pulseaudio alsa-lib dbus polkit libevdev xcb-util fontconfig scdoc ly blueman hyprland
sudo pacman -S ly xorg-xinit xorg-server-xorg xorg-xsetroot dbus systemd pam ttf-dejavu noto-fonts fastfetch 


echo "\\\\\\\\\\\\\\\\\\"
echo "Starting Services..."
echo "//////////////////"

sleep 1 

sudo systemctl enable ly.service

sudo systemctl start ly.service
systemctl status ly.service

sleep 1 

echo "\\\\\\\\\\\\\\\\\\"
echo "Rebooting.."
echo "//////////////////"

sleep 5

sudo reboot 
