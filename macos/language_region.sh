# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "de"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

# Set the timezone (see `sudo systemsetup -listtimezones` for other values)
sudo systemsetup -settimezone "Europe/Berlin" > /dev/null

# Set first day of the week (2=monday, 3=tuesday, ...)
defaults write NSGlobalDomain AppleFirstWeekday -array "gregorian = 1"

# Set clock to 24h
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false
