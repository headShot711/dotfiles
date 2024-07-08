#!/bin/sh

# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/qtile
mkdir -v ~/.config/alacritty
touch ~/.vimrc

#Enable parallel downloading and color
#sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-apps lxappearance jq keepassxc acpi wget unzip brightnessctl volumeicon flameshot timeshift pavucontrol nitrogen picom curl base-devel linux-headers vim htop vlc mpv neofetch xclip networkmanager network-manager-applet alsa-utils ranger leafpad ttf-liberation ttf-font-awesome scrot dolphin feh alacritty firefox polkit-gnome exa qtile python-psutil lightdm lightdm-gtk-greeter bluez bluez-utils blueman yt-dlp qtile

# Install yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install font
cd
wget https://github.com/be5invis/Iosevka/releases/download/v27.3.4/super-ttc-iosevka-27.3.4.zip
unzip super-ttc-iosevka-27.3.4.zip
sudo mv iosevka.ttc /usr/share/fonts/
sudo fc-cache
rm -f super-ttc-iosevka-27.3.4.zip

# Copy config files
cd
sudo cp -rv ~/dotfiles/qtile/config.py ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/autostart.sh ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile/alacritty.yml ~/.config/alacritty/
sudo cp -rv ~/dotfiles/walls/* ~/walls/
sudo cp -rv ~/dotfiles/qtile/.bashrc ~/
sudo cp -rv ~/dotfiles/i3-dark/vimrc ~/.vimrc

cd .config/qtile
sudo chmod +x autostart.sh
cd

# Enable services
sudo systemctl enable lightdm.service
sudo systemctl enable bluetooth.service
#sudo systemctl enable libvirtd.service

clear
echo "DONE!"
