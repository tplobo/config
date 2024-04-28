#################################### Fonts ####################################

brew install --cask font-meslo-lg-nerd-font       # (for `p10k`)

################################## Essentials #################################

brew install --cask 1password
brew install --cask firefox
brew install --cask vlc

################################# Office Tools ################################

################################### Reading ###################################

brew install --cask zotero
brew install --cask djview
brew install --cask sequential

################################ Communication ################################

brew install --cask viber
brew install --cask whatsapp
brew install --cask skype
brew install --cask zoom
brew install --cask discord
brew install --cask microsoft-teams

############################### Developer Tools ###############################

# Java
#brew install --cask temurin                # OpenJDK
#brew install --cask corretto               # Amazon Java Developer's Kit 21
#brew install --cask corretto8              # Amazon Java Developer's Kit 8

# Git
brew install --cask sourcetree

# Coding
brew install --cask macvim
brew install --cask visual-studio-code
brew install --cask mysides                 # Change Finder Sidebar shortcuts

########################### File & Drive Management ###########################

# File Systems
brew install --cask macfuse
brew install --cask mounty                          # Write to NTFS

# MKV Tools
MKV=$LIBRARY_PATH'/MKVTools'
sudo mkdir -p $MKV
brew install --cask --appdir=$MKV mkvtoolnix
brew install --cask --appdir=$MKV mkvtools

# Converters
brew install --cask handbrake
brew install --cask mediahuman-audio-converter

# File management
brew install --cask filebot

# External disks
brew install --cask android-file-transfer
brew install --cask sdformatter

# Disk mapping
MAPS=$LIBRARY_PATH'/DiskMapping'
sudo mkdir -p $MAPS
brew install --cask --appdir=$MAPS disk-inventory-x     # https://www.derlien.com
brew install --cask --appdir=$MAPS omnidisksweeper      # https://www.omnigroup.com/more/

################################## Networking #################################

brew install --cask tunnelblick

################################### Clouds ####################################

#CLOUDS=$LIBRARY_PATH'/Clouds'
#sudo mkdir -p $CLOUDS

brew install --cask synology-drive
#brew install --cask onedrive           # (only if needed)
#brew install --cask dropbox            # (only if needed)
#brew install --cask megasync           # (only if needed)
#brew install --cask google-drive       # (only if needed)
#brew install --cask nextcloud          # (only if needed)

################################## Downloads ##################################

brew install --cask jdownloader
brew install --cask qbittorrent-lt20
# utorrent classic (app): https://www.utorrent.com

#################################### Games ####################################

brew install --cask openemu
brew install --cask epic-games
brew install --cask steam

################################### Hardware ##################################

brew install --cask stats
brew install --cask logi-options-plus
brew install --cask ubiquiti-unifi-controller
brew install --cask jabra-direct

#TODO:brew install --cask dozer         # Custom menu bar buttons