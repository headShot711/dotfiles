#!/bin/sh

# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install packages
sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed libx11
sudo pacman -S --noconfirm --needed xlib
sudo pacman -S --noconfirm --needed base-devel
sudo pacman -S --noconfirm --needed freetype2
sudo pacman -S --noconfirm --needed fontconfig
sudo pacman -S --noconfirm --needed xorg-xrandr
sudo pacman -S --noconfirm --needed libxft
sudo pacman -S --noconfirm --needed libxinerama
sudo pacman -S --noconfirm --needed vim
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono
sudo pacman -S --noconfirm --needed ttf-font-awesome
sudo pacman -S --noconfirm --needed xwallpaper
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed xcompmgr
sudo pacman -S --noconfirm --needed python-pywal
sudo pacman -S --noconfirm --needed zsh-syntax-highlighting
sudo pacman -S --noconfirm --needed xdotool
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed unzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed pulseaudio
sudo pacman -S --noconfirm --needed pulseaudio-bluetooth
sudo pacman -S --noconfirm --needed alsa-utils
sudo pacman -S --noconfirm --needed pavucontrol
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed mpv
sudo pacman -S --noconfirm --needed pcmanfm
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed gvfs
sudo pacman -S --noconfirm --needed gvfs-mtp
sudo pacman -S --noconfirm --needed ntfs-3g
sudo pacman -S --noconfirm --needed bluez
sudo pacman -S --noconfirm --needed bluez-utils
sudo pacman -S --noconfirm --needed blueman
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed dhcpcd
sudo pacman -S --noconfirm --needed wpa_supplicant
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed leafpad
sudo pacman -S --noconfirm --needed pyside2
sudo pacman -S --noconfirm --needed syncplay

cd
cp /etc/X11/xinit/xinitrc ~/.xinitrc
# Rmove last 5 lines from .xinintrc
head -n -5 .xinitrc > temp && mv temp .xinitrc

cd
mkdir -p .local/src
git clone https://github.com/bugswriter/dwm.git
git clone https://github.com/bugswriter/dmenu.git
git clone https://github.com/bugswriter/st.git
cd dwm
sudo make clean install
cd
cd dmenu
sudo make clean install
cd
cd st
sudo make clean install

cd
git clone https://github.com/torrinfail/dwmblocks.git
cd dwmblocks
sudo make clean install


# Move wallpapers folder from github to walls
cd
mkdir -p walls
sudo cp -rv ~/dotfiles/walls/* ~/walls/
cd

# Move and setup newlook script
cd
sudo cp -rv ~/dotfiles/newlook.sh ~/.local/src/
cd .local/src
sudo chmod +x newlook.sh
cd

# Enable services
sudo systemctl enable bluetooth.service

# add to xinitrc

echo "/home/hs/.local/src/newlook.sh &" >> ~/.xinitrc
echo "xrandr -s 1920x1080" >> ~/.xinitrc
echo "xcompmgr &" >> ~/.xinitrc
echo "exec dwm" >> ~/.xinitrc
echo "dwmblocks &" >> ~/.xinitrc
cd

# Get rid of the beep!
sudo -i
rmmod pcspkr
echo "blacklist pcspkr" >/etc/modprobe.d/nobeep.conf
echo "Installation completed. Reboot system"
printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
