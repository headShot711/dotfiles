#!/bin/sh

# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/qtile
mkdir -v ~/config/picom
mkdir -v ~/.config/alacritty

#Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S xorg-server xorg-xinit xorg-apps lxappearance nitrogen picom curl base-devel linux-headers vim htop neofetch dunst xclip networkmanager network-manager-applet alsa-utils ranger leafpad ttf-liberation ttf-font-awesome scrot thunar feh alacritty firefox polkit-gnome exa qtile

# Install XFCE
#sudo pacman -S --noconfirm --needed xfce4

# Install yay
sudo pacman -S --no-confirm --needed go
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S --noconfirm ly

# Copy config files
cd
sudo cp -rv ~/dotfiles/qtile/config.py ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/autostart.sh ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/alacritty.yml ~/.config/alacritty/
sudo cp -rv ~/dotfiles/qtile/picom.conf ~/.config/picom/
sudo cp -rv ~/dotfiles/qtile/.bashrc ~/

# Enable services
#sudo systemctl enable bluetooth.service
#sudo systemctl enable libvirtd.service
sudo systemctl enable ly.service

# Most important command! Get rid of the beep!
sudo -i
rmmod pcspkr
echo "blacklist pcspkr" >/etc/modprobe.d/nobeep.conf

echo "Installation completed. Reboot system"
printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
