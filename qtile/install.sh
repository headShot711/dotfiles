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
sudo pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xrandr xorg-apps lxappearance jq keepassxc acpi brightnessctl volumeicon flameshot timeshift pavucontrol nitrogen picom curl base-devel linux-headers vim htop vlc mpv neofetch xclip networkmanager network-manager-applet alsa-utils ranger leafpad ttf-liberation ttf-font-awesome scrot dolphin feh alacritty firefox polkit-gnome exa qtile python-psutil lightdm lightdm-gtk-greeter bluez bluez-utils blueman yt-dlp qtile

#xorg go lxappearance nitrogen cmus noto-fonts noto-fonts-emoji noto-fonts-extra picom evince jq pavucontrol keepassxc dmidecode acpi qtile brightnessctl volumeicon flameshot timeshift dmenu curl base-devel mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g htop neofetch tlp yt-dlp dunst xclip unzip p7zip bluez bluez-utils blueman networkmanager network-manager-applet dhcpcd wpa_supplicant xdg-utils xdg-user-dirs alsa-utils pavucontrol ranger leafpad ttf-liberation scrot vlc mpv pcmanfm feh alacritty firefox vim polkit-gnome wget qbittorrent eza lightdm lightdm-gtk-greeter

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
cd .config/qtile
sudo chmod +x autostart.sh
cd

# Enable services
sudo systemctl enable lightdm.service
sudo systemctl enable bluetooth.service
#sudo systemctl enable libvirtd.service

clear
echo "DONE!"
