# Source base script
source config_base.sh

# Apply saved preferences for MacOS
apply_preferences preferences/macos

# Apply saved preferences for third-party apps
apply_preferences preferences/third_party

###############################################################################
# Kill affected applications                                                  #
###############################################################################

#TODO: revise list
for app in \
	"Activity Monitor" \
	"1Password" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \ 	# Core Foundations Preferences background service
	"Contacts" \
	"Dock" \
	"Finder" \
	"Firefox" \
	"iCal" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \ 		# Menu bar and GUI manager
	"Terminal" \
	"Tunnelblick" \
	"Wireguard" \
	do
		killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."