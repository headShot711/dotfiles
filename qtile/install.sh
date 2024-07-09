#!/bin/sh

# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/qtile
mkdir -v ~/.config/alacritty
mkdir -v ~/.config/kitty
mkdir -v ~/.config/rofi
touch ~/.vimrc

#Enable parallel downloading and color
#sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S betterlockscreen

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm xorg-server xorg-xinit xorg-xrandr xorg-apps lxappearance jq keepassxc acpi tlp wget rofi kitty kate tree mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g gwenview unzip brightnessctl volumeicon flameshot timeshift pavucontrol nitrogen picom curl base-devel linux-headers vim htop vlc mpv neofetch xclip networkmanager network-manager-applet alsa-utils ranger leafpad ttf-liberation ttf-font-awesome noto-fonts noto-fonts-emoji noto-fonts-extra scrot dolphin feh alacritty firefox polkit-gnome exa qtile python-psutil lightdm lightdm-gtk-greeter bluez bluez-utils blueman yt-dlp qtile


# Install font
cd
wget https://github.com/be5invis/Iosevka/releases/download/v27.3.4/super-ttc-iosevka-27.3.4.zip
unzip super-ttc-iosevka-27.3.4.zip
sudo mv iosevka.ttc /usr/share/fonts/
sudo fc-cache
rm -f super-ttc-iosevka-27.3.4.zip

#Setup virt-manager in Arch Linux:
#sudo pacman -S libvirt qemu-full iptables-nft dnsmasq virt-manager ovmf vde2 ebtables bridge-utils openbsd-netcat qemu-guest-agent libguestfs

#sudo usermod -a -G libvirt $(whoami)
#newgrp libvirt

#sudo systemctl start libvirtd
#sudo systemctl enable libvirtd

#sudo virsh net-start default
#sudo virsh net-autostart default


# Copy config files
cd
sudo cp -rv ~/dotfiles/qtile/config.py ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/autostart.sh ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/power_menu.sh ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/alacritty.yml ~/.config/alacritty/
sudo cp -rv ~/dotfiles/qtile/kitty/* ~/.config/kitty/
sudo cp -rv ~/dotfiles/qtile/rofi/config.rasi ~/.config/rofi/
sudo cp -rv ~/dotfiles/walls/* ~/walls/
sudo cp -rv ~/dotfiles/qtile/.bashrc ~/
sudo cp -rv ~/dotfiles/qtile/.vimrc ~/.vimrc

cd .config/qtile
sudo chmod +x autostart.sh
sudo chmod +x power_menu.sh
cd

# Enable services
sudo systemctl enable lightdm.service
sudo systemctl enable bluetooth.service
#sudo systemctl enable libvirtd.service

clear
echo "DONE!"
