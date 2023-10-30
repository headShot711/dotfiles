# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install packages

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xorg
sudo pacman -S --noconfirm --needed xorg-xinit
sudo pacman -S --noconfirm --needed xorg-server
sudo pacman -S --noconfirm --needed git  
sudo pacman -S --noconfirm --needed vim  
sudo pacman -S --noconfirm --needed dmenu  
sudo pacman -S --noconfirm --needed alacritty  
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed picom
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed base-devel
#sudo pacman -S --noconfirm --needed mtools
#sudo pacman -S --noconfirm --needed dosfstools
#sudo pacman -S --noconfirm --needed exfat-utils
#sudo pacman -S --noconfirm --needed linux-headers
#sudo pacman -S --noconfirm --needed gvfs
#sudo pacman -S --noconfirm --needed gvfs-mtp
#sudo pacman -S --noconfirm --needed ntfs-3g
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed neofetch
#sudo pacman -S --noconfirm --needed lm_sensors
#sudo pacman -S --noconfirm --needed yt-dlp
sudo pacman -S --noconfirm --needed rofi
#sudo pacman -S --noconfirm --needed xclip
#sudo pacman -S --noconfirm --needed unzip
#sudo pacman -S --noconfirm --needed p7zip
#sudo pacman -S --noconfirm --needed bluez
#sudo pacman -S --noconfirm --needed bluez-utils
#sudo pacman -S --noconfirm --needed blueman
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed dhcpcd
sudo pacman -S --noconfirm --needed wpa_supplicant
#sudo pacman -S --noconfirm --needed xdg-utils
#sudo pacman -S --noconfirm --needed xdg-user-dirs
sudo pacman -S --noconfirm --needed alsa-utils
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed leafpad  
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed ttf-font-awesome
#sudo pacman -S --noconfirm --needed scrot
#sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed thunar 
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed polkit-gnome
#sudo pacman -S --noconfirm --needed qbittorrent

# Install yay

cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Installation completed. Reboot system"
printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"

