# Function for direct download and installation of .dmg file
install_from_url () {
    local URL=$(echo $1 | tr -d ' ')
    local INSTALL_DIR=${2:-$LIBRARY_PATH}
    local TEMP_DMG=$(mktemp -t download.dmg)

    echo ' '
    echo "Direct download from: $URL"
    curl -Lo $TEMP_DMG $URL

    #TODO: Check if the file is a .dmg. If a .zip, extract it and find .dmg

    echo "Mount: $TEMP_DMG"
    local TEMP_MOUNT=$(hdiutil attach -nobrowse -noautoopen $TEMP_DMG | awk -F '\t' 'END {print $NF}')

    local FOUND=false
    for FILE in "$TEMP_MOUNT"/*; do
        if [[ $FILE == *.pkg ]]; then
            echo "Installing $FILE in: $INSTALL_DIR"
            sudo installer -pkg "$FILE" -target $INSTALL_DIR
            FOUND=true
            break
        elif [[ $FILE == *.app ]]; then
            echo "Installing $FILE in: $INSTALL_DIR"
            cp -R "$FILE" $INSTALL_DIR
            FOUND=true
            break
        fi
    done

    if [ "$FOUND" = false ]; then
        echo "Error: No .pkg or .app found in the .dmg"
        return 1
    fi

    echo "Unmounting $TEMP_MOUNT"
    hdiutil detach $TEMP_MOUNT

    echo "Removing: $TEMP_DMG"
    rm $TEMP_DMG
    echo ' '
}

################################ Worldographer ################################
# https://worldographer.com/

GAMES=$LIBRARY_PATH'/Games'
sudo mkdir -p $GAMES
URL="https://worldographer.com/releases/Worldographer-1.74.57.dmg"
install_from_url $URL $GAMES


################################ ConnectMeNow4 ################################
# https://www.tweaking4all.com/software/macosx-software/connectmenow-v4

# Processor: Apple Silicon
URL="https://www.tweaking4all.com/downloads/network/\
    ConnectMeNow4-v4.0.16-macOS-arm64.dmg"
install_from_url $URL

# Processor: Intel
#URL="https://www.tweaking4all.com/downloads/network/\
#    ConnectMeNow4-v4.0.16-macOS-x86-64.dmg"
#install_from_url $URL


################## Synology Active Backup for Business Agent ##################
# https://www.synology.com/en-global/support/download/DS920+?version=7.2

URL="https://global.synologydownload.com/download/Utility/\
    ActiveBackupBusinessAgent/2.6.2-3081/Mac/x86_64/\
    Synology%20Active%20Backup%20for%20Business%20Agent-2.6.2-3081.dmg\
    ?model=DS920%2B&bays=4&dsm_version=7.2.1&build_number=69057"
install_from_url $URL


######################### Media Human Video Converter #########################
# https://www.mediahuman.com/video-converter/5/

URL="https://www.mediahuman.com/download/MHVideoConverter.dmg"
install_from_url $URL

############################## SAT-SMART-Driver ###############################
# Kernel driver to allow access to S.M.A.R.T. data from external drives:
# https://github.com/kasbert/OS-X-SAT-SMART-Driver

# Install from original repository:
#URL="https://github.com/kasbert/OS-X-SAT-SMART-Driver/archive/refs/tags/\
#    REL_0_10.zip"
#install_from_url $URL

# Install from BinaryFruit (signed DMG):
# https://binaryfruit.com/drivedx/usb-drive-support#install-instructions
URL="https://binaryfruit.com/download/mac/satsmartdriver/\
    SATSMARTDriver-0.10.3.macOS11_and_AppleSilicon.zip"
install_from_url $URL

# If all fails, install SAT SMART Driver from DriveDx and uninstall DriveDx:
#brew install --cask drivedx

################################ TotalSpaces3 #################################
# https://discuss.binaryage.com/t/total-spaces-3-on-macos-13-ventura/8457/3

#URL="https://downloads.binaryage.com/TotalSpaces3-0.9.125.dmg"
#install_from_url $URL