# Function for direct download and installation of .dmg file
install_from_url () {
    local URL=$(echo $1 | tr -d ' ')
    local TEMP_DMG=$(mktemp -t download.dmg)

    echo ' '
    echo "Direct download from: $URL"
    curl -Lo $TEMP_DMG $URL

    echo "Mount: $TEMP_DMG"
    local TEMP_MOUNT=$(hdiutil attach -nobrowse -noautoopen $TEMP_DMG | awk -F '\t' 'END {print $NF}')

    local FOUND=false
    for FILE in "$TEMP_MOUNT"/*; do
        if [[ $FILE == *.pkg ]]; then
            echo "Installing $FILE in: $LIBRARY_PATH"
            sudo installer -pkg "$FILE" -target $LIBRARY_PATH
            FOUND=true
            break
        elif [[ $FILE == *.app ]]; then
            echo "Installing $FILE in: $LIBRARY_PATH"
            cp -R "$FILE" $LIBRARY_PATH
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

URL="https://worldographer.com/releases/Worldographer-1.74.57.dmg"
install_from_url $URL

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