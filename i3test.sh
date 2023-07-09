#!/bin/bash

# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/i3
mkdir -v ~/.config/alacritty
mkdir -v ~/.config/polybar

#Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

#Use reflector to setup fastest mirrors
sudo pacman -S --noconfirm --needed reflector rsync curl
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xorg-xrandr xorg-xbacklight lxappearance nitrogen picom i3-gaps i3status i3lock base-devel tor mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g htop neofetch lm_sensors yt-dlp rofi polybar dunst xclip unzip p7zip networkmanager network-manager-applet dhcpcd wpa_supplicant xdg-utils xdg-user-dirs alsa-utils ranger leafpad ttf-liberation ttf-font-awesome scrot mpv thunar feh alacritty firefox vim  polkit-gnome qbittorrent bluez bluez-utils vlc

# Install XFCE
sudo pacman -S --noconfirm --needed xfce4 xfce4-goodies

# Install Virtual Box
sudo pacman -S --noconfirm virtualbox
sudo pacman -S --noconfirm virtualbox-host-modules-arch
sudo modprobe vboxdrv
sudo pacman -S --noconfirm qt5-x11extras
sudo gpasswd -a hs vboxusers

# Install yay
sudo pacman -S --noconfirm --needed go
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S --noconfirm --needed autotiling ly brave-bin virtualbox-ext-oracle

# Copy config files
cd
sudo cp -rv ~/dotfiles/i3/* ~/.config/i3/
sudo cp -rv ~/dotfiles/alacritty/* ~/.config/alacritty/
sudo cp -rv ~/dotfiles/polybar/* ~/.config/polybar/
sudo cp -rv ~/dotfiles/walls/* ~/walls/
sudo chmod +x ~/.config/polybar/launch.sh

# Enable services
sudo systemctl enable bluetooth.service
sudo systemctl enable ly.service
sudo systemctl enable tor.service

# Most important command! Get rid of the beep!
sudo -i
rmmod pcspkr
echo "blacklist pcspkr" >/etc/modprobe.d/nobeep.conf

echo "Installation completed. Reboot system"
printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
