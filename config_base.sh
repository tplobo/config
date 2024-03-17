
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

sync_files() {
    local FILE="$1"
    local PATH_REPORT="$2"
    local PATH_CONTAINERS="$3"
    local ACTION="$4"

    local NAME_FILE="${FILE##*/}"
    local NAME_FOLDER="${NAME_FILE%%'.txt'*}"
    local PATH_SAVE="$PATH_CONTAINERS/$NAME_FOLDER/"
    if [ ! -d "$PATH_SAVE" ]; then
        mkdir -p "$PATH_SAVE"
    fi

    while IFS= read -r LINE; do
        local PREFERENCES=${LINE//"~"/$HOME} # Substitute '~' by HOME
        if [ ! -e "$PREFERENCES" ]; then
            MSG="File not found: $PREFERENCES"
            echo_header2 "$MSG" >> "$PATH_REPORT"; echo_yellow "$MSG"
        else
            if [[ "$ACTION" == "apply" ]]; then
                local DESTINATION="${PREFERENCES%/*}/"
                local SAVED_ITEM="${PREFERENCES##*/}"
                local PATH_ITEM="$PATH_SAVE$SAVED_ITEM"
                local SOURCE="$PATH_ITEM"
            elif [[ "$ACTION" == "save" ]]; then
                local SOURCE="$PREFERENCES"
                local DESTINATION="$PATH_SAVE"
                
            else
                echo_red "Invalid action specified: $ACTION"
                return 1
            fi
            MSG="Syncing: $PREFERENCES"
            echo_header2 $MSG >> $PATH_REPORT; echo $MSG
            echo "-------- from $PREFERENCES"
            echo "-------- to $DESTINATION"
            rsync -ahdq --log-file="$PATH_REPORT" --exclude ".DS_Store"\
                "$SOURCE" "$DESTINATION" 2>/dev/null\
                || echo_red "Sync failed: $PREFERENCES"
        fi
    done < "$FILE"
}

process_files() {
    local DIR="$1"
    local ACTION="$2"
    local PATH_REPORT="$3"
    local PATH_CONTAINERS="$4"
    local ACTION_TYPE="$5"

    for FILE in "$DIR"/*(.); do
        echo_header2 "$ACTION_TYPE preferences for: ${FILE:t:r}"
        while IFS= read -r LINE; do
            sync_files "$FILE" "$PATH_REPORT" "$PATH_CONTAINERS" "$ACTION_TYPE"
        done < "$FILE"
    done
}

function save_preferences() {
    local PATH_PREFERENCES="$@"
    validate_directory "$PATH_PREFERENCES" "lists of preferences" || return 1
    
    local ALL_PATHS=($(paths_to_containers_and_report "$PATH_PREFERENCES" "save"))
    local PATH_CONTAINERS="${ALL_PATHS[0]}"
    local PATH_REPORT="${ALL_PATHS[1]}"
    
    mkdir -p "$PATH_CONTAINERS"
    
    local DATE="$(date +%y-%m-%d.%H:%M:%S)"
    local MSG="$DATE SAVING PREFERENCES LISTED IN: $PATH_PREFERENCES"
    echo_header1 "$MSG" >> "$PATH_REPORT"; echo_header1 "$MSG"
    
    process_files "$PATH_PREFERENCES" 'sync_files' "$PATH_REPORT" "$PATH_CONTAINERS" "save"
    echo ' '
}

function apply_preferences() {
    local PATH_PREFERENCES="$@"
    validate_directory "$PATH_PREFERENCES" "lists of preferences" || return 1

    local ALL_PATHS=($(paths_to_containers_and_report "$PATH_PREFERENCES" "apply"))
    local PATH_CONTAINERS="${ALL_PATHS[0]}"
    local PATH_REPORT="${ALL_PATHS[1]}"

    validate_directory "$PATH_CONTAINERS" "preferences containers" || return 1
    
    local DATE="$(date +%y-%m-%d.%H:%M:%S)"
    local MSG="$DATE APPLYING PREFERENCES LISTED IN: $PATH_PREFERENCES"
    echo_header1 "$MSG" >> "$PATH_REPORT"; echo_header1 "$MSG"
    
    process_files "$PATH_PREFERENCES" 'sync_files' "$PATH_REPORT" "$PATH_CONTAINERS" "apply"
    echo ' '
}