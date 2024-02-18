# Source base script
source config_base.sh

# Create folder structure ("Clouds", "Mounts", ...)
echo "Creating folder structure..."
zsh scripts/apply_structure.sh

# Apply MacOS configurations
echo "Applying macOS configurations..."
zsh scripts/apply_macos.sh

# Install oh-my-zsh
OMZ=https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh -c "$(curl -fsSL $OMZ)"

# Apply dotfiles
echo "Applying dotfiles..."
apply_items $DOTFILES

# Apply apps & packages library
echo "Applying library..."
zsh scripts/apply_library.sh

# Set apps that start on login (Login Items)

# Set default web browser

# Apply settings (copy folders/files for 1Password, qBittorrent, VSCode, ...)

# Erase defined functions