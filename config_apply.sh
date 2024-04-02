# Ask for the administrator password upfront and keep-alive
# (update existing `sudo` time stamp until script has finished)
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Create `config` group
echo "Creating config group..."
zsh scripts/create_group.sh

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
zsh scripts/apply_dotfiles.sh

# Apply apps & packages library
echo "Applying library..."
zsh scripts/apply_library.sh

# Create computer structure ("Clouds", "Mounts", ...)
echo "Creating computer structure..."
zsh scripts/apply_structure.sh

# Set default web browser

# Apply settings (copy folders/files for 1Password, qBittorrent, VSCode, ...)
echo "Creating folder structure..."
zsh scripts/apply_preferences.sh

# Erase defined functions