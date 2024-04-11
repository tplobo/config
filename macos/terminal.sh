# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Use specific default theme for all Terminal windows
defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks
defaults write com.apple.terminal ShowLineMarks -int 0