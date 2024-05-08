# Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Install packages

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed vim firefox curl xorg lightdm lightdm-gtk-greeter xfce4 leafpad linux-headers htop neofetch wget leafpad exa

curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed nmap wireshark-qt burpsuite metasploit netcat john nikto gobuster wpscan sqlmap 

# Set bash alias
cd
echo "alias ls='exa -lah'" >> .bashrc

# Enable services
sudo systemctl enable lightdm

clear
echo "DONE!"
