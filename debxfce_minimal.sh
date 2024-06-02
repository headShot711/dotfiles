#!/usr/bin/env bash

# Build-essential.
sudo apt install -y build-essential

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# xfce4
sudo apt install -y xfce4

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Networking
sudo apt install -y policykit-1-gnome network-manager network-manager-gnome

# Thunar
sudo apt install -y thunar

# Terminal (eg. terminator,kitty,xcfe4-terminal)
sudo apt install -y terminator

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pamixer

# Appearance
sudo apt install -y lxappearance

# Browsers
sudo apt install -y firefox-esr
 
# Fonts and icons for now
sudo apt install -y fonts-recommended fonts-ubuntu fonts-font-awesome fonts-terminus

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa

# Bluetooth
sudo apt install -y bluez blueman
sudo systemctl enable bluetooth

# tools
sudo apt install -y geany l3afpad scrot evince transmission-gtk unzip neofetch htop
sudo apt install -y vim neofetch htop mpv vlc qimgv galculator redshift timeshift

# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings
sudo systemctl enable lightdm

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
