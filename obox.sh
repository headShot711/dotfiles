# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install packages

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed vim firefox curl xorg xorg-xrandr lightdm lightdm-gtk-greeter xfce4 openbox obconf tint2 menumaker lxterminal lxappearance nitrogen rofi yad screen ranger leafpad linux-headers htop neofetch wget base-devel mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g tlp yt-dlp dunst xclip unzip p7zip bluez bluez-utils blueman networkmanager network-manager-applet dhcpcd wpa_supplicant xdg-utils xdg-user-dirs alsa-utils pavucontrol firefox chromium mate-polkit exa

# Set bash alias
cd
echo "alias ls='exa -lah'" >> .bashrc

# Enable services
sudo systemctl enable lightdm

cd
mkdir -v walls
mkdir -v ~/.config/openbox
sudo cp -rv ~/dotfiles/openbox/autostart ~/.config/openbox/autostart

