#!/bin/sh

# Make directories
cd
touch ~/.vimrc
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/qtile
mkdir -v ~/.config/alacritty
mkdir -v ~/.config/rofi
mkdir -v ~/.config/dunst

# Install yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S betterlockscreen ly pfetch

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm xorg xdotool lxappearance dmidecode calcurse xfce4-settings dhcpcd wpa_supplicant git man ttf-monofur-nerd ttf-hack pacman-contrib jq keepassxc cmus xdg-utils xdg-user-dirs arc-gtk-theme breeze-gtk materia-gtk-theme papirus-icon-theme dunst dmenu acpi tlp wget rofi mousepad tree mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g unzip brightnessctl volumeicon flameshot timeshift pavucontrol nitrogen picom curl base-devel linux-headers nano vim htop btop vlc mpv neofetch xclip networkmanager network-manager-applet alsa-utils fff leafpad ttf-liberation ttf-font-awesome noto-fonts noto-fonts-emoji noto-fonts-extra scrot feh alacritty firefox polkit-gnome eza qtile python-psutil bluez bluez-utils blueman yt-dlp

# Install font from source
#cd
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Monofur.zip
#unzip Monofur.zip
#sudo mv ~/*.ttf /usr/share/fonts/
#sudo fc-cache
#rm -f Monofur.zip

# Copy config files
cd
sudo cp -rv ~/dotfiles/qtile-monochrome/config.py ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile-monochrome/autostart.sh ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile-monochrome/power_menu.sh ~/.config/qtile/
sudo cp -rv ~/dotfiles/qtile-monochrome/alacritty.yml alacritty.toml ~/.config/alacritty/
sudo cp -rv ~/dotfiles/qtile-monochrome/config.rasi ~/.config/rofi/
sudo cp -rv ~/dotfiles/qtile-monochrome/*.jpg ~/walls/
sudo cp -rv ~/dotfiles/qtile-monochrome/.bashrc ~/
sudo cp -rv ~/dotfiles/qtile-monochrome/.vimrc ~/.vimrc
#sudo cp -rv ~/dotfiles/qtile-monochrome/.xinitrc ~/.xinitrc
sudo cp -rv ~/dotfiles/qtile-monochrome/dunstrc ~/.config/dunst/

cd .config/qtile
sudo chmod +x power_menu.sh
sudo chmod +x autostart.sh
cd
xdg-user-dirs-update

# Enable services
sudo systemctl enable bluetooth.service
sudo systemctl enable tlp.service
sudo systemctl enable ly.service

clear
echo "DONE!"
