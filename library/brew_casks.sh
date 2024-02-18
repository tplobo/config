
brew install --cask 1password

#################################### Fonts ####################################

brew install --cask font-meslo-lg-nerd-font       # (for `p10k`)

############################### Developer Tools ###############################

brew install --cask adoptopenjdk8                 # Java 8
brew install --cask macvim
brew install --cask visual-studio-code
brew install --cask sourcetree

################################ Communication ################################

brew install --cask viber
brew install --cask whatsapp
brew install --cask skype
brew install --cask zoom
brew install --cask discord
brew install --cask microsoft-teams

########################### File & Drive Management ###########################

# File Systems
brew install --cask macfuse
brew install --cask mounty                          # Write to NTFS

# MKV Tools
MKV='~/Applications/MKVTools'
brew install --cask --appdir=$MKV mkvtoolnix
brew install --cask --appdir=$MKV mkvtools

# Converters
brew install --cask handbrake
brew install --cask mediahuman-audio-converter
#TODO: message about 'https://www.mediahuman.com/video-converter/5/'

# File management
brew install --cask filebot

# External disks
brew install --cask android-file-transfer
brew install --cask sdformatter

# Disk mapping
MAPS='~/Applications/DiskMapping'
brew install --cask --appdir=$MAPS disk-inventory-x     # https://www.derlien.com
brew install --cask --appdir=$MAPS omnidisksweeper      # https://www.omnigroup.com/more/

#TODO: find package to make .ICNS files

################################### Reading ###################################

brew install --cask zotero
brew install --cask djview

############################## Remote Connection ##############################

brew install --cask tunnelblick

################################### Clouds ####################################

CLOUDS='~/Applications/Clouds'

brew install --cask --appdir=$CLOUDS synology-drive
#brew install --cask --appdir=$CLOUDS onedrive          # (only if needed)
#brew install --cask --appdir=$CLOUDS dropbox           # (only if needed)
#brew install --cask --appdir=$CLOUDS megasync          # (only if needed)
#brew install --cask --appdir=$CLOUDS google-drive      # (only if needed)
#brew install --cask --appdir=$CLOUDS nextcloud         # (only if needed)

################################## Downloads ##################################

brew install --cask jdownloader
brew install --cask qbittorrent-lt20

#################################### Games ####################################

brew install --cask openemu
brew install --cask epic-games
brew install --cask steam

################################### Hardware ##################################

brew install --cask stats
brew install --cask logi-options-plus
brew install --cask jabra-direct