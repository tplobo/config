# Source base script
source config_base.sh

# Apply saved preferences for MacOS
apply_preferences preferences/macos

# Change default profile in Terminal
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew (p10k)"
defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew (p10k)"

# Apply saved preferences for third-party apps
apply_preferences preferences/third_party

# Kill processes
ALL_PROCESSES=(
	"Activity Monitor"
	"1Password"
	"Address Book"
	"Calendar"
	"cfprefsd" 	    		# Core Foundations Preferences background service
	"Contacts"
	"Dock"
	"Finder"
	"Firefox"
	"iCal"
	"Mail"
	"Messages"
	"Photos"
	"Safari"
	"SystemUIServer"      	# Menu bar and GUI manager
	"Terminal"
	"Tunnelblick"
	"Wireguard"
)
kill_processes $ALL_PROCESSES
