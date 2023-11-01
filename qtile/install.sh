#!/bin/sh

# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/qtile
mkdir -v ~/.config/alacritty

#Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-apps lxappearance nitrogen picom curl base-devel linux-headers vim htop neofetch dunst xclip networkmanager network-manager-applet alsa-utils ranger leafpad ttf-liberation ttf-font-awesome scrot thunar feh alacritty firefox polkit-gnome exa qtile python-psutil cmus lightdm lightdm-gtk-greeter bluez bluez-utils blueman dhcpcd yt-dlp mtools dosfstools exfat-utils gvfs gvfs-mtp ntfs-3g tlp qbittorrent libvirt qemu-full iptables-nft dnsmasq virt-manager qemu-arch-extra ovmf vde2 ebtables bridge-utils openbsd-netcat vlc tor

# Install XFCE
sudo pacman -S --noconfirm --needed xfce4

# Copy config files
cd
sudo cp -rv ~/dotfiles/qtile/config.py ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/autostart.sh ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/alacritty.yml ~/.config/alacritty/
sudo cp -rv ~/dotfiles/walls/* ~/walls/
sudo cp -rv ~/dotfiles/qtile/.bashrc ~/
cd .config/qtile
sudo chmod +x autostart.sh
cd

# Enable services
sudo systemctl enable lightdm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable libvirtd.service
sudo systemctl enable tor.service

clear
echo "DONE!"
