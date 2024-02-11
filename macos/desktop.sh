###############################################################################
# Dock                                                                       #
###############################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 72 pixels
defaults write com.apple.dock tilesize -int 72

# Change minimize/maximize window effect (scale | genie | suck)
defaults write com.apple.dock mineffect -string "genie"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool false

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool false

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
#defaults write com.apple.dock static-only -bool true

# Animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool true

# Remove the auto-hiding Dock delay
#defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
#defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock (true | false)
defaults write com.apple.dock autohide -bool false

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Show recent applications in Dock (true | false)
defaults write com.apple.dock show-recents -bool true

# Read dock applications-array and add single spacer to the left
#TODO:
#defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile"; tile-data={};}'

# Read dock others-array and add single spacer to the right
#TODO:
#defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

###############################################################################
# Dashboard                                                                   #
###############################################################################

# Disable Dashboard
#defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
#defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

###############################################################################
# Launchpad & Mission Control                                                 #
###############################################################################

# Speed up Mission Control animations
#defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
#defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Reset Launchpad, but keep the desktop wallpaper intact (only for macOS < 14)
#find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Change number of rows & columns in Launchpad
# See: https://easyosx.net/2022/07/04/how-to-reset-mac-os-launchpad/
defaults write com.apple.dock springboard-rows -int 5
defaults write com.apple.dock springboard-columns -int 8

# Add iOS & Watch Simulator to Launchpad
#sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
#sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

###############################################################################
# Hot Corners                                                                 #
###############################################################################
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen

# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → Application Windows
defaults write com.apple.dock wvous-tr-corner -int 3
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner → Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0