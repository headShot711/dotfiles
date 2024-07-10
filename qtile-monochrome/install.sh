#!/bin/sh

# Make directories
cd
touch ~/.vimrc
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/qtile
mkdir -v ~/.config/alacritty
mkdir -v ~/.config/rofi

#Enable parallel downloading and color
#sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S betterlockscreen ttf-monofur-nerd

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm xorg-server xorg-xinit xorg-xrandr xorg-apps lxappearance jq keepassxc acpi tlp wget qt5-graphicaleffects qt5-svg qt5-quickcontrols2 thunar rofi mousepad tree mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g unzip brightnessctl volumeicon flameshot timeshift pavucontrol nitrogen picom curl base-devel linux-headers nano vim htop btop vlc mpv neofetch xclip networkmanager network-manager-applet alsa-utils fff leafpad ttf-liberation ttf-font-awesome noto-fonts noto-fonts-emoji noto-fonts-extra scrot dolphin feh alacritty firefox polkit-gnome exa qtile python-psutil bluez bluez-utils blueman yt-dlp qtile

# Copy config files
cd
sudo cp -rv ~/dotfiles/qtile-monochrome/config.py ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile-monochrome/power_menu.sh ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile-monochrome/alacritty.yml alacritty.toml ~/.config/alacritty/
sudo cp -rv ~/dotfiles/qtile-monochrome/config.rasi ~/.config/rofi/
sudo cp -rv ~/dotfiles/qtile-monochrome/*.jpg ~/walls/
sudo cp -rv ~/dotfiles/qtile-monochrome/.bashrc ~/
sudo cp -rv ~/dotfiles/qtile-monochrome/.vimrc ~/.vimrc

cd .config/qtile
sudo chmod +x power_menu.sh
cd

# Enable services
sudo systemctl enable bluetooth.service

clear
echo "DONE!"
