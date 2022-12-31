#######################################################
# Post install script for arch base
# Author: headShot
# Prerequisite packages: git
#######################################################

# git clone https://github.com/headShot711/dotfiles
# cd dotfiles
# sh install.sh
# enter password if prompted

# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/i3
mkdir -v ~/.config/alacritty
mkdir -v ~/.config/polybar

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xorg  
sudo pacman -S --noconfirm --needed go
sudo pacman -S --noconfirm --needed lxappearance
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed picom
sudo pacman -S --noconfirm --needed i3-gaps
sudo pacman -S --noconfirm --needed i3status
sudo pacman -S --noconfirm --needed i3lock
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed base-devel
sudo pacman -S --noconfirm --needed mtools
sudo pacman -S --noconfirm --needed dosfstools
sudo pacman -S --noconfirm --needed linux-headers
sudo pacman -S --noconfirm --needed gvfs
sudo pacman -S --noconfirm --needed ntfs-3g
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed yt-dlp
sudo pacman -S --noconfirm --needed rofi
sudo pacman -S --noconfirm --needed polybar
sudo pacman -S --noconfirm --needed dunst
sudo pacman -S --noconfirm --needed xclip
sudo pacman -S --noconfirm --needed unzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed bluez
sudo pacman -S --noconfirm --needed bluez-utils
sudo pacman -S --noconfirm --needed blueman
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed dhcpcd
sudo pacman -S --noconfirm --needed wpa_supplicant
sudo pacman -S --noconfirm --needed xdg-utils
sudo pacman -S --noconfirm --needed xdg-user-dirs
sudo pacman -S --noconfirm --needed pulseaudio
sudo pacman -S --noconfirm --needed pulseaudio-bluetooth
sudo pacman -S --noconfirm --needed alsa-utils
sudo pacman -S --noconfirm --needed pavucontrol
sudo pacman -S --noconfirm --needed cmus
sudo pacman -S --noconfirm --needed zathura  
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed leafpad  
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed ttf-font-awesome
sudo pacman -S --noconfirm --needed scrot
sudo pacman -S --noconfirm --needed mpv 
sudo pacman -S --noconfirm --needed thunar 
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed vim 
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed task
sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
sudo pacman -S --noconfirm --needed qbittorrent      
sudo pacman -S --noconfirm --needed libvirt
sudo pacman -S --noconfirm --needed qemu-full
sudo pacman -S --force --needed iptables-nft
sudo pacman -S --noconfirm --needed dnsmasq
sudo pacman -S --noconfirm --needed virt-manager
sudo pacman -S --noconfirm --needed qemu-arch-extra
sudo pacman -S --noconfirm --needed ovmf
sudo pacman -S --noconfirm --needed vde2
sudo pacman -S --noconfirm --needed ebtables
sudo pacman -S --noconfirm --needed bridge-utils
sudo pacman -S --noconfirm --needed openbsd-netcat
sudo pacman -S --noconfirm --needed nomacs

# Install yay

cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S --noconfirm pfetch
yay -S --noconfirm autotiling
yay -S --noconfirm ly

# Copy config files
cd
sudo cp -rv ~/dotfiles/i3/* ~/.config/i3/
sudo cp -rv ~/dotfiles/alacritty/* ~/.config/alacritty/
sudo cp -rv ~/dotfiles/polybar/* ~/.config/polybar/
sudo cp -rv ~/dotfiles/walls/* ~/walls/
sudo chmod +x ~/.config/polybar/launch.sh

# Enable services
sudo systemctl enable bluetooth.service
sudo systemctl enable libvirtd.service
sudo systemctl enable ly.service

# Most important command! Get rid of the beep!
sudo -i
rmmod pcspkr
echo "blacklist pcspkr" >/etc/modprobe.d/nobeep.conf

echo "Installation completed. Reboot system"
