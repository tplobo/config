# Source base script
source config_base.sh

################################### Folders ###################################

# Create folders
FOLDERS=(
    '$HOME/☁️ Clouds ☁️'
    '$HOME/⛰️ Mounts ⛰️'
    '$HOME/Applications/MATLAB'
)
apply_folders $FOLDERS

# Create sym-link to default mac icons
ICONS='/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources'
ln -s $ICONS ~/Pictures/'Default MacOS Icons'

################################### Finder ####################################

# Remove all and then add Finder sidebar shortcuts
# (depends on `mysides` package from Homebrew)
mysides-nuke
SHORTCUTS=(
    "☁️ Clouds ☁️ file://$HOME/%E2%98%81%EF%B8%8F%20Clouds%20%E2%98%81%EF%B8%8F/"
    "⛰️ Mounts ⛰️ file://$HOME/%E2%9B%B0%EF%B8%8F%20Mounts%20%E2%9B%B0%EF%B8%8F/"
    "$(id -un) file://$HOME/"
    "Desktop file://$HOME/Desktop/"
    "Applications file:///Applications"
)
IFS=$'\n'; mysides-fill "$SHORTCUTS"; unset IFS

################################## Launchpad ##################################

# Apply Launchpad organization
apply_launchpad

################################## Launchpad ##################################

# Set apps in Dock
#TODO: