# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/alacritty
mkdir -v ~/.config/i3
mkdir -v ~/.config/i3status

# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install packages

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xorg go lxappearance nitrogen cmus picom cronie i3-wm i3status i3lock kate dmenu curl base-devel mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g htop neofetch tlp yt-dlp dunst xclip unzip p7zip bluez bluez-utils blueman networkmanager network-manager-applet dhcpcd wpa_supplicant xdg-utils xdg-user-dirs alsa-utils pavucontrol ranger leafpad ttf-liberation scrot vlc thunar feh alacritty firefox vim polkit-gnome wget qbittorrent exa

# Install yay

cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S --noconfirm autotiling
yay -S --noconfirm ly

# Install font
cd
wget https://github.com/be5invis/Iosevka/releases/download/v27.3.4/super-ttc-iosevka-27.3.4.zip
unzip super-ttc-iosevka-27.3.4.zip
sudo mv iosevka.ttc /usr/share/fonts/
sudo fc-cache
rm -f super-ttc-iosevka-27.3.4.zip

# Set bash alias
cd
echo "alias ls='exa -lah'" >> .bashrc

# Copy config files
cd
sudo cp -rv ~/dotfiles/i3/alacritty.yml ~/.config/alacritty/
sudo cp -rv ~/dotfiles/i3/config ~/.config/i3/config
sudo cp -rv ~/dotfiles/i3/i3status.conf ~/.config/i3status/config
sudo cp -rv ~/dotfiles/walls/* ~/walls/

# Enable services
sudo systemctl enable ly.service
sudo systemctl enable bluetooth.service

# Get rid of the beep!
sudo -i
rmmod pcspkr
echo "blacklist pcspkr" >/etc/modprobe.d/nobeep.conf

clear
echo "DONE!"
