# Ask for the administrator password upfront and keep-alive
# (update existing `sudo` time stamp until script has finished)
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Source base script
source config_base.sh

# Apply MacOS configurations
echo "Applying macOS configurations..."
zsh scripts/apply_macos.sh

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
	echo "OH-MY-ZSH already installed. Getting updates..."
	omz update
else
	echo "Installing OH-MY-ZSH..."
	URL=https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    zsh -c "$(curl -fsSL $URL)"
fi

# Apply dotfiles
echo "Applying dotfiles..."
apply_dotfiles $DOTFILES
source ~/.zshrc

# Apply apps & packages library
echo "Applying library..."
zsh scripts/apply_library.sh

# Create folder structure ("Clouds", "Mounts", ...)
echo "Creating folder structure..."
#zsh scripts/apply_structure.sh

# Set apps that start on login (Login Items)

# Set default web browser

# Apply settings (copy folders/files for 1Password, qBittorrent, VSCode, ...)

# Erase defined functions