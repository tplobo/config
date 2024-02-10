# Time to start screen saver (in seconds, 0=disabled)
# See: https://discussions.apple.com/thread/251362856
defaults write com.apple.screensaver idleTime 60

# Require password after sleep or screen saver begins (delay in seconds)
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 300

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Format of saved screenshots (PNG | BMP | GIF | JPG | PDF | TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
#defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true