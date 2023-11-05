# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/i3

#Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

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
sudo pacman -S --noconfirm --needed dmenu
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed base-devel
sudo pacman -S --noconfirm --needed mtools
sudo pacman -S --noconfirm --needed dosfstools
sudo pacman -S --noconfirm --needed exfat-utils
sudo pacman -S --noconfirm --needed linux-headers
sudo pacman -S --noconfirm --needed gvfs
sudo pacman -S --noconfirm --needed gvfs-mtp
sudo pacman -S --noconfirm --needed ntfs-3g
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed tlp
sudo pacman -S --noconfirm --needed yt-dlp
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
sudo pacman -S --noconfirm --needed alsa-utils
sudo pacman -S --noconfirm --needed pavucontrol
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed leafpad  
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed scrot
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed thunar 
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed vim 
sudo pacman -S --noconfirm --needed polkit-gnome
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

# Copy config files
cd
sudo cp -rv ~/dotfiles/i3/config ~/.config/i3/
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
