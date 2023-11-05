# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/i3
mkdir -v ~/.config/i3status

#Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xorg go lxappearance nitrogen picom i3-gaps i3status i3lock dmenu curl base-devel mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g htop neofetch tlp yt-dlp dunst xclip unzip p7zip bluez bluez-utils blueman networkmanager network-manager-applet dhcpcd wpa_supplicant xdg-utils xdg-user-dirs alsa-utils pavucontrol ranger leafpad ttf-liberation scrot vlc thunar feh alacritty firefox vim polkit-gnome wget
#sudo pacman -S --noconfirm --needed qbittorrent      
#sudo pacman -S --noconfirm --needed libvirt
#sudo pacman -S --noconfirm --needed qemu-full
#sudo pacman -S --force --needed iptables-nft
#sudo pacman -S --noconfirm --needed dnsmasq
#sudo pacman -S --noconfirm --needed virt-manager
#sudo pacman -S --noconfirm --needed qemu-arch-extra
#sudo pacman -S --noconfirm --needed ovmf
#sudo pacman -S --noconfirm --needed vde2
#sudo pacman -S --noconfirm --needed ebtables
#sudo pacman -S --noconfirm --needed bridge-utils
#sudo pacman -S --noconfirm --needed openbsd-netcat

# Install yay

cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S --noconfirm autotiling
yay -S --noconfirm ly

# Setup St terminal
cd
git clone https://git.suckless.org/st
cd st
sudo make install

# Install font
cd
wget https://github.com/be5invis/Iosevka/releases/download/v27.3.4/super-ttc-iosevka-27.3.4.zip
unzip super-ttc-iosevka-27.3.4.zip
sudo mv iosevka.ttc /usr/share/fonts/
sudo fc-cache
rm -f super-ttc-iosevka-27.3.4.zip

# Copy config files
cd
sudo cp -rv ~/dotfiles/i3/config ~/.config/i3/config
sudo cp -rv ~/dotfiles/i3/i3status.conf ~/.config/i3status/config
sudo cp -rv ~/dotfiles/walls/* ~/walls/

# Enable services
#sudo systemctl enable bluetooth.service
#sudo systemctl enable libvirtd.service
sudo systemctl enable ly.service

# Most important command! Get rid of the beep!
sudo -i
rmmod pcspkr
echo "blacklist pcspkr" >/etc/modprobe.d/nobeep.conf

clear
echo "DONE!"
