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
sudo pacman -S --noconfirm --needed xorg-server
sudo pacman -S --noconfirm --needed xorg-xinit
sudo pacman -S --noconfirm --needed xorg-apps
sudo pacman -S --noconfirm --needed python-psutil
sudo pacman -S --noconfirm --needed qtile
sudo pacman -S --noconfirm --needed lightdm
sudo pacman -S --noconfirm --needed lightdm-gtk-greeter
sudo pacman -S --noconfirm --needed go
sudo pacman -S --noconfirm --needed lxappearance
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed base-devel
sudo pacman -S --noconfirm --needed mtools
sudo pacman -S --noconfirm --needed dosfstools
sudo pacman -S --noconfirm --needed exfat-utils
sudo pacman -S --noconfirm --needed linux-headers
sudo pacman -S --noconfirm --needed gvfs
sudo pacman -S --noconfirm --needed gvfs-mtp
sudo pacman -S --noconfirm --needed ntfs-3g
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed tlp
sudo pacman -S --noconfirm --needed yt-dlp
sudo pacman -S --noconfirm --needed dunst
sudo pacman -S --noconfirm --needed xclip
sudo pacman -S --noconfirm --needed unzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed bluez
sudo pacman -S --noconfirm --needed bluez-utils
sudo pacman -S --noconfirm --needed blueman
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed dhcpcd
sudo pacman -S --noconfirm --needed wpa_supplicant
sudo pacman -S --noconfirm --needed xdg-utils
sudo pacman -S --noconfirm --needed xdg-user-dirs
sudo pacman -S --noconfirm --needed alsa-utils
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed leafpad  
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed ttf-font-awesome
sudo pacman -S --noconfirm --needed scrot
sudo pacman -S --noconfirm --needed exa
sudo pacman -S --noconfirm --needed thunar 
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed vim 
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed qbittorrent      
sudo pacman -S --noconfirm --needed libvirt
sudo pacman -S --noconfirm --needed qemu-full
sudo pacman -S --force --needed iptables-nft
sudo pacman -S --noconfirm --needed dnsmasq
sudo pacman -S --noconfirm --needed virt-manager
sudo pacman -S --noconfirm --needed qemu-arch-extra
sudo pacman -S --noconfirm --needed ovmf
sudo pacman -S --noconfirm --needed vde2
sudo pacman -S --noconfirm --needed ebtables
sudo pacman -S --noconfirm --needed bridge-utils
sudo pacman -S --noconfirm --needed openbsd-netcat
sudo pacman -S --noconfirm --needed python-dbus-next

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

# Configure brightness with brillo
sudo chmod a+rw /sys/class/backlight/nv_backlight/brightness
git clone https://gitlab.com/cameronnemo/brillo.git
cd brillo
sudo make
sudo make install

# Enable services
sudo systemctl enable lightdm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable libvirtd.service

clear
echo "DONE!"
