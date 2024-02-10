#!/usr/bin/env zsh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Set computer name                                        		  			  #
###############################################################################

# Ask computer name
# TODO:

# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"


###############################################################################
# Set automator workflows                                         		  	  #
###############################################################################

# Copy automator workflows
# TODO:


###############################################################################
# Set wallpaper & screensaver                                         		  #
###############################################################################

mxf_path=~/Pictures/images/'Morgoth X Fingolfin.jpg'
maps_path=~/Pictures/'02 Arda Maps'

# Copy images to Pictures
cp -f images/morgoth_X_fingolfin.jpg $mxf_path
cp -f images/morgoth_X_fingolfin_reduced.jpg ~/Pictures/images/'Morgoth X Fingolfin (reduced).jpg'

# Copy folders to Pictures

cp -f -R images/eu ~/Pictures/'01 Eu'
cp -f -R images/arda_maps $maps_path

# Define function to set wallpaper
# TODO:
#function wallpaper () {
#    automator -i "${1}" ~/Desktop/setDesktopPix.workflow
#    }
#wallpaper mxf_path

# Set screensaver source folder
defaults -currentHost write com.apple.ScreenSaverPhotoChooser 'SelectedFolderPath' $maps_path


###############################################################################
# Configurations                                                              #
###############################################################################

# Define function to run macos config files
function apply_macos_config () {
    zsh macos/$1
    }

# UI/UX  
apply_macos_config ui.sh

# Language & Region
apply_macos_config language_region.sh

# Hardware (trackpad, mouse, keyboard, Bluetooth accessories and others)
apply_macos_config hardware.sh

# Energy
apply_macos_config energy.sh

# Display
apply_macos_config display.sh

# Finder
apply_macos_config finder.sh

# Dock, Dashboard & Mission Control, Hot Corners
apply_macos_config desktop.sh

# Safari & WebKit
apply_macos_config safari.sh

# Mail
apply_macos_config mail.sh

# Spotlight
apply_macos_config spotlight.sh

# Terminal
apply_macos_config terminal.sh

# Utilities
apply_macos_config utilities.sh

# App Store
apply_macos_config app_store.sh

# Contacts
apply_macos_config contacts.sh

# Photos
apply_macos_config photos.sh

# Messages
apply_macos_config messages.sh

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Terminal" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
#TODO: echo_green "Done. Note that some of these changes require a logout/restart to take effect."
