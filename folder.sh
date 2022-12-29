# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/alacritty
mkdir -v ~/.config/polybar

# Copy config files
cp -rv ~/dotfiles/i3/* ~/.config/
cp -rv ~/dotfiles/alacritty/* ~/.config/alacritty/
cp -rv ~/dotfiles/polybar/* ~/.config/polybar/
cp -rv ~/dotfiles/walls/* ~/walls/
chmod +x ~/.config/polybar/launch.sh
