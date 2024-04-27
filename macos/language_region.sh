# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "de"
defaults write NSGlobalDomain AppleLocale -string "en_DE@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

###############################################################################
# Date & Time                                                                 #
###############################################################################

# Set the timezone (see `sudo systemsetup -listtimezones` for other values)
# Discard outputs to avoid error message: https://github.com/LnL7/nix-darwin/issues/359
sudo systemsetup -settimezone "Europe/Berlin" 2>/dev/null 1>&2

# Set date format preferences (1=short, 2=medium, 3=long, 4=etc)
# See: https://gist.github.com/chris-79/654bfcd252280230fa82
# See: https://discussions.apple.com/thread/255315900
defaults write NSGlobalDomain AppleICUDateFormatStrings -dict-add "1" "dd/MM/y"
defaults write NSGlobalDomain AppleICUDateFormatStrings -dict-add "2" "d MMM y"
defaults write NSGlobalDomain AppleICUDateFormatStrings -dict-add "3" "d MMMM y"
defaults write NSGlobalDomain AppleICUDateFormatStrings -dict-add "4" "EEEE, d MMMM y"
#defaults delete NSGlobalDomain AppleICUDateFormatStrings

# Set time format preferences (1=short, 2=medium, 3=long, 4=etc)
defaults write NSGlobalDomain AppleICUTimeFormatStrings -dict-add "1" "HH:mm"
defaults write NSGlobalDomain AppleICUTimeFormatStrings -dict-add "2" "HH:mm:ss"
defaults write NSGlobalDomain AppleICUTimeFormatStrings -dict-add "3" "HH:mm:ss z"
defaults write NSGlobalDomain AppleICUTimeFormatStrings -dict-add "4" "HH:mm:ss zzzz"
#defaults deete NSGlobalDomain AppleICUTimeFormatStrings

# Set date & time formats also as the system preference
#defaults write com.apple.systempreferences AppleIntlCustomFormat -dict-add "AppleIntlCustomICUDictionary" "{'AppleICUDateFormatStrings'={'1'='yyyy/MM/dd';'2'='dd MMM y';'3'='dd MMMM y';'4'='EEEE, dd MMMM y';};'AppleICUTimeFormatStrings'={'1'='HH:mm';'2'='HH:mm:ss';'3'='HH:mm:ss z';'4'='HH:mm:ss zzzz';};}"

# Set first day of the week (1=sunday, 2=monday, 3=tuesday, ...)
defaults write NSGlobalDomain AppleFirstWeekday -array "gregorian = 1"

# Set clock to 24h
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false
    
    
