# Source base script
source config_base.sh

# Create folder structure ("Clouds", "Mounts", ...)

# Apply MacOS configurations
echo "Applying macOS configurations..."
zsh scripts/apply_macos.sh

# Apply dotfiles
echo "Applying dotfiles..."
apply_items $DOTFILES

# Install oh-my-zsh


# Apply apps & packages library
zsh scripts/apply_library.sh

# Set apps that start on login (Login Items)

# Set default web browser

# Apply settings (copy folders/files for 1Password, qBittorrent, VSCode, ...)

# Erase defined functions