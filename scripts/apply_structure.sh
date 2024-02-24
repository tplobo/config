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

# Add Finder sidebar shortcuts (depends on `mysides` package from Homebrew)
#TODO: remove all current shortcuts
SHORTCUTS=(
    "Desktop file://$HOME/Desktop/"
    "'☁️ Clouds ☁️' file://$HOME/%E2%98%81%EF%B8%8F%20Clouds%20%E2%98%81%EF%B8%8F/"
    "'⛰️ Mounts ⛰️' file://$HOME/%E2%9B%B0%EF%B8%8F%20Mounts%20%E2%9B%B0%EF%B8%8F/"
    "$(id -un) file://$HOME/"
    "Applications file://$LIBRARY_PATH"
)
mysides add ${SHORTCUTS[@]}

################################## Launchpad ##################################



