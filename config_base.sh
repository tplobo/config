
################################## dotfiles ###################################

DOTFILES=(
    .zshrc_config
    .zshrc
    .zprofile
    .zsh_p10k
    .zsh_omz
    .zsh_aliases
	.zsh_syntax
)
function apply_dotfiles () {
    for FILE in $@; do
        yes | cp -rf "dotfiles/"$FILE "$HOME/"$FILE
        echo $FILE" applied!";
    done
    }
function save_dotfiles () {
    for FILE in $@; do
        yes | cp -rf "$HOME/"$FILE "dotfiles/"$FILE
        echo $FILE" saved!";
    done
    }

################################## Structure ##################################

# Apply folder structure
function apply_folders () {
    for FOLDER in $@; do
        mkdir -p $FOLDER
        echo $FOLDER" folder created!";
    done
    }

# Fill/clear all Finder Sidebar shortcuts (depends on `mysides` brew cask)
function mysides-fill {
	while IFS= read -r LINE; do
        NAME=${LINE%%' file://'*};
        SHORTCUT="file:"$(echo $LINE | cut -d ':' -f 2);
        mysides add "$NAME" $SHORTCUT;
    done <<< $@ # Feed array of "name path" entries
}
function mysides-nuke {
	while IFS= read -r LINE; do
        NAME=${LINE%%' ->'*}
        SHORTCUT=$(echo $LINE | cut -d ">" -f 2)
        if [[ "$SHORTCUT" == *"nwnode"* ]]; then; 
            # ignore AirDrop
        else
            mysides remove "$NAME";
            echo "that led to:"$SHORTCUT;
        fi
    done <<< "$(mysides list)"
}

# Apply/save launchpad organization
# See: https://github.com/blacktop/lporg
LAUNCHPAD_DB=$TMPDIR"../0/com.apple.dock.launchpad/db"
function apply_launchpad () {
    yes | cp -rf "settings/launchpad/db/" $LAUNCHPAD_DB"/"
    echo "Launchpad settings applied!";
    killall Dock
}
function save_launchpad () {
    yes | cp -rf $LAUNCHPAD_DB "settings/launchpad"
    #echo $LAUNCHPAD_DB
    echo "Launchpad settings saved!";
}

################################# Preferences #################################

# Call `apply_preferences` or `save_preferences` and give as argument
# a path to a folder in which TXT files specify lists of preference
# files/directories to be copied into/from the `containers` folder.

validate_directory() {
    local DIRECTORY="$1"
    local CONTENTS="$2"
    if [ ! -d "$DIRECTORY" ]; then
        echo "Path to $CONTENTS not found: $DIRECTORY"
        return 1
    fi
}

paths_to_containers_and_report() {
    local PATH_PREFERENCES="$1"
    local REPORT_TYPE="$2"
    local CONFIG_DIR="$HOME/Documents/VSCODE/CONFIG"
    local PATH_CONTAINERS="$CONFIG_DIR/$PATH_PREFERENCES/containers"
    local PATH_REPORT="$PATH_CONTAINERS/${REPORT_TYPE}_preferences_rsyncLOG.txt"
    echo "$PATH_CONTAINERS" "$PATH_REPORT"
}

sync_preference() {
    sudo -v
    local ACTION_TYPE="$1"
    local LINE="$2"
    local PATH_FOLDER="$3"
    local PATH_REPORT="$4"

    local ABS_LINE=${LINE//"~"/$HOME} # Substitute '~' by HOME
    local MATCHES=(${~ABS_LINE})

    for PREFERENCE in ${MATCHES[@]}; do

        if [[ "$ACTION_TYPE" == "apply" ]]; then
            local DESTINATION="${PREFERENCE%/*}/"
            local SAVED_ITEM="${PREFERENCE##*/}"
            local PATH_ITEM="$PATH_FOLDER$SAVED_ITEM"
            local SOURCE="$PATH_ITEM"
        elif [[ "$ACTION_TYPE" == "save" ]]; then
            local DESTINATION="$PATH_FOLDER"
            local SOURCE="$PREFERENCE"
        else
            echo_red "Invalid action specified: $ACTION_TYPE"
            return 1
        fi

        if [ ! -e "$SOURCE" ]; then
            MSG="File not found: $SOURCE"
            echo_header2 "$MSG" >> "$PATH_REPORT"; echo_yellow "$MSG"
        else
            MSG="Syncing: $PREFERENCE"
            echo_header2 $MSG >> $PATH_REPORT; echo $MSG
            echo "-- from: $SOURCE"
            echo "---- to: $DESTINATION"
            sudo rsync -ahdq --log-file="$PATH_REPORT" --exclude ".DS_Store"\
                "$SOURCE" "$DESTINATION" 2>>$PATH_REPORT\
                || echo_red "Sync partially or completely failed: $PREFERENCE"
        fi
    done
}

process_files() {
    local ACTION="$1"
    local ACTION_TYPE="$2"
    local DIR="$3"
    local PATH_REPORT="$4"
    local PATH_CONTAINERS="$5"

    for FILE in "$DIR"/*(.); do
        NAME_FOLDER="${FILE:t:r}"
        echo_header2 "$ACTION_TYPE preferences for: $NAME_FOLDER"
        local PATH_FOLDER="$PATH_CONTAINERS/$NAME_FOLDER/"
        if [ ! -d "$PATH_FOLDER" ]; then
            mkdir -p "$PATH_FOLDER"
        fi

        for LINE in ${(f)"$(<$FILE)"}; do
            $ACTION "$ACTION_TYPE" \
                "$LINE" "$PATH_FOLDER" "$PATH_REPORT"
        done < "$FILE"
    done
}

function save_preferences() {
    local PATH_PREFERENCES="$@"
    validate_directory "$PATH_PREFERENCES" "lists of preferences" || return 1
    
    local ALL_PATHS=($(paths_to_containers_and_report "$PATH_PREFERENCES" "save"))
    local PATH_CONTAINERS="${ALL_PATHS[1]}"
    local PATH_REPORT="${ALL_PATHS[2]}"

    mkdir -p "$PATH_CONTAINERS"
    
    local DATE="$(date +%y-%m-%d.%H:%M:%S)"
    local MSG="$DATE SAVING PREFERENCES LISTED IN: $PATH_PREFERENCES"
    echo_header1 "$MSG" >> "$PATH_REPORT"; echo_header1 "$MSG"
    
    process_files 'sync_preference' "save" \
        "$PATH_PREFERENCES" "$PATH_REPORT" "$PATH_CONTAINERS"
    echo ' '
}

function apply_preferences() {
    local PATH_PREFERENCES="$@"
    validate_directory "$PATH_PREFERENCES" "lists of preferences" || return 1

    local ALL_PATHS=($(paths_to_containers_and_report "$PATH_PREFERENCES" "apply"))
    local PATH_CONTAINERS="${ALL_PATHS[1]}"
    local PATH_REPORT="${ALL_PATHS[2]}"

    validate_directory "$PATH_CONTAINERS" "preferences containers" || return 1
    
    local DATE="$(date +%y-%m-%d.%H:%M:%S)"
    local MSG="$DATE APPLYING PREFERENCES LISTED IN: $PATH_PREFERENCES"
    echo_header1 "$MSG" >> "$PATH_REPORT"; echo_header1 "$MSG"
    
    process_files 'sync_preference' "apply" \
        "$PATH_PREFERENCES" "$PATH_REPORT" "$PATH_CONTAINERS"
    echo ' '
}