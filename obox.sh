# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install packages

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed vim firefox curl xorg lightdm lightdm-gtk-greeter xfce4 openbox obconf tint2 lxterminal lxappearance nitrogen rofi yad screen pluma nemo ranger leafpad linux-headers htop neofetch wget base-devel mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g tlp yt-dlp dunst xclip unzip p7zip bluez bluez-utils blueman networkmanager network-manager-applet dhcpcd wpa_supplicant xdg-utils xdg-user-dirs alsa-utils pavucontrol alacritty firefox chromium mate-polkit exa

# Set bash alias
cd
echo "alias ls='exa -lah'" >> .bashrc

# Enable services
sudo systemctl enable lightdm
