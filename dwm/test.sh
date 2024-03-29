# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install packages

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xorg
sudo pacman -S --noconfirm --needed xorg-xinit
sudo pacman -S --noconfirm --needed xorg-server
sudo pacman -S --noconfirm --needed go
sudo pacman -S --noconfirm --needed git  
sudo pacman -S --noconfirm --needed vim  
sudo pacman -S --noconfirm --needed dmenu  
sudo pacman -S --noconfirm --needed alacritty  
sudo pacman -S --noconfirm --needed picom
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed base-devel
udo pacman -S --noconfirm --needed cmake
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed rofi
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed dhcpcd
sudo pacman -S --noconfirm --needed wpa_supplicant
sudo pacman -S --noconfirm --needed alsa-utils
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed leafpad  
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed ttf-font-awesome
sudo pacman -S --noconfirm --needed thunar 
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed exa
sudo pacman -S --noconfirm --needed tlp
sudo pacman -S --noconfirm --needed thermald

# Install yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install dwm
cd
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st
cd dwm
sudo make clean install
cd ../dmenu/
sudo make clean install
cd ../st
sudo make clean install
cd

# Move wallpapers folder from github to walls
cd
mkdir -p walls
sudo cp -rv ~/dotfiles/walls/* ~/walls/
cd

# Add to xinitrc
cp /etc/X11/xinit/xinitrc /home/hs/.xinitrc
# Rmove last 5 lines from .xinintrc
head -n -5 .xinitrc > temp && mv temp .xinitrc
echo "xrandr -s 1920x1080" >> ~/.xinitrc
echo "feh --bg-scale ~/walls/wall.jpg" >> ~/.xinitrc
echo "picom &" >> ~/.xinitrc
echo "exec slstatus &" >> ~/.xinitrc
echo "exec dwm" >> ~/.xinitrc
cd

# Copy config files and recompile dwm
sudo cp -rv ~/dotfiles/dwm/config.h ~/dwm/
cd ~/dwm
curl -O https://lists.suckless.org/dev/att-7590/shiftview.c
sudo make clean install
cd

# Compile slstatus
git clone https://git.suckless.org/slstatus
cd slstatus
make
sudo ln -sf ~/slstatus/slstatus /usr/local/bin
cd

echo "Installation completed. Reboot system"
printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"

