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
IFS=$'\n'
mysides-fill "$SHORTCUTS"
unset IFS

################################## Launchpad ##################################

# Apply Launchpad organization
apply_launchpad

################################# Login Items #################################

# Clear current login items
clear_login_items

# Set apps that start on login
LOGIN_ITEMS=(
    "/Applications/ConnectMeNow4.app"
    "/Applications/Stats.app"
    "/Applications/Synology Drive Client.app"
    "/Applications/Tunnelblick.app"
    "/Applications/WireGuard.app"
)
fill_login_items $LOGIN_ITEMS

################################## Launchpad ##################################

# Set apps in Dock
#TODO: how to set apps in Dock from command line?

############################### Default Browser ###############################

# For this section to work, the desired browser needs to be already installed 
# (see `library/brew_casks.sh`) and both Terminal and Script Editor must be
# allowed control over the computer for assistive access in:
# System Preferences > Privacy & Security > Privacy > Accessibility.

# Set Edge as default web browser
#open -a "Microsoft Edge" --new --args --make-default-browser

# Set Chrome as default web browser
#open -a "Google Chrome" --new --args --make-default-browser

# Set Firefox as default web browser
open -a "Firefox" --new --args -silent -nosplash -setDefaultBrowser

# Wait for System Events to display confirmation dialog and press "Use"
sleep 1 
osascript scripts/pressUseButtonInDialog.scpt