# Make directories
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/alacritty
mkdir -v ~/.config/polybar

# Copy config files
sudo cp -rv ~/dotfiles/i3/* ~/.config/
sudo cp -rv ~/dotfiles/alacritty/* ~/.config/alacritty/
sudo cp -rv ~/dotfiles/polybar/* ~/.config/polybar/
sudo cp -rv ~/dotfiles/walls/* ~/walls/
chmod +x ~/.config/polybar/launch.sh