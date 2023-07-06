.#!/bin/sh

# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xlib
sudo pacman -S --noconfirm --needed xorg
sudo pacman -S --noconfirm --needed xorg-server
sudo pacman -S --noconfirm --needed xorg-xinit
sudo pacman -S --noconfirm --needed xorg-utils
sudo pacman -S --noconfirm --needed xorg-xinit
sudo pacman -S --noconfirm --needed xorg-server-utils
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
sudo pacman -S --noconfirm --needed xdg-utils
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed leafpad

cd
cp /etc/X11/xinitrc ~/.xinitrc

# Install yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

yay -S --noconfirm ly


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

# Enable services
sudo systemctl enable bluetooth.service
sudo systemctl enable ly.service

# Get rid of the beep!
sudo -i
rmmod pcspkr
echo "blacklist pcspkr" >/etc/modprobe.d/nobeep.conf

# add to xinitrc

echo "xcompmgr &" >> ~/.xinitrc
echo "exec dwm" >> ~/.xinitrc
echo "dwmblocks &" >> ~/.xinitrc
echo "/home/hs/.local/bin/newlook &" >> ~/.xinitrc
