# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install packages
sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed vim firefox kate curl xorg xorg-xrandr lightdm lightdm-gtk-greeter xfce4 vlc openbox obconf feh tint2 menumaker volumeicon lxterminal lxappearance nitrogen rofi yad screen ranger leafpad linux-headers htop neofetch wget base-devel mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g tlp yt-dlp dunst xclip unzip p7zip bluez bluez-utils blueman networkmanager network-manager-applet dhcpcd wpa_supplicant xdg-utils xdg-user-dirs alsa-utils pavucontrol firefox chromium mate-polkit exa

# Install yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Set bash alias
cd
echo "alias ls='exa -lah'" >> .bashrc

# Enable services
sudo systemctl enable lightdm

# Copy config files
cd
mkdir -v walls
mkdir -v ~/.config/openbox
sudo cp -rv ~/dotfiles/openbox/autostart ~/.config/openbox/autostart
#sudo cp -rv ~/dotfiles/openbox/rc.xml ~/.config/openbox/rc.xml

#cd
#cp /etc/xdg/openbox/rc.xml ~/.config/openbox
