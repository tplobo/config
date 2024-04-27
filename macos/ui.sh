# Disable the sound effects on boot
#sudo nvram SystemAudioVolume=" "
sudo nvram StartupMute=%01

# Set highlight color to green
#defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Disable the over-the-top focus ring animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Adjust toolbar title rollover delay
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# Increase window resize speed for Cocoa applications (default is 0.2)
#defaults delete NSGlobalDomain NSWindowResizeTime
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Configure Crash Reporter
#defaults write com.apple.CrashReporter DialogType -string "none"
#defaults write com.apple.CrashReporter DialogType -string "basic"
defaults write com.apple.CrashReporter DialogType -string "developer"

# Set Help Viewer windows to non-floating mode (true, false)
defaults write com.apple.helpviewer DevMode -bool true

# Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)
# Commented out, as this is known to cause problems in various Adobe apps :(
# See: https://github.com/mathiasbynens/dotfiles/issues/237
#echo "0x08000100:0" > ~/.CFUserTextEncoding

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
#defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

###############################################################################
# Login screen                                                                #
###############################################################################

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login screen
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Set a welcome message on the login screen
email="tiago_p_lobo@hotmail.com"
login_msg="This device belongs to Tiago Pomella Lobo. Please contact me: $email"
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText $login_msg
#sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText ""

###############################################################################
# Menu bar                                                                    #
###############################################################################

# Disable transparency in the menu bar and elsewhere on Yosemite
#defaults write com.apple.universalaccess reduceTransparency -bool true

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Reduce spacing of icons in menu bar (takes effect after logout/login)
# Default is 8
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6

# Show the type of keyboard layout in the menu bar (true | false)
defaults write com.apple.TextInputMenu visible -bool false

# Analog clock (true | false)
defaults write com.apple.menuextra.clock IsAnalog -bool false

# Flash the time separators, the ":" in HH:MM (true | false)
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
    
# Display the time with seconds
defaults write com.apple.menuextra.clock 'DateFormat' 'EEE MMM d  H:mm:ss'


###############################################################################
# Scrollbars                                                                  #
###############################################################################

# Always show scrollbars (`WhenScrolling`, `Automatic` and `Always`)
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Click the scrollbar to jump to spot (false = jump to next page)
defaults write -g AppleScrollerPagingBehavior -bool true

# Disable smooth scrolling
# (Uncomment if you’re on an older Mac that messes up the animation)
#defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false