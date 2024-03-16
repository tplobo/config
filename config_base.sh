
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

function save_preferences () {
    # Argument: folder with .TXT files with lists of files
    #PATH_PREFERENCES="preferences/macos" #PREFPATH="preferences/third_party"
    PATH_PREFERENCES=$@
    # Check if PREF_PATH exists
    if [ ! -d $PATH_PREFERENCES ]; then
        echo "Path to lists of preferences not found: $PATH_PREFERENCES"
        return
    fi
    PATH_CONTAINERS="$HOME/Documents/VSCODE/CONFIG/$PATH_PREFERENCES/containers"
    PATH_REPORT="$PATH_CONTAINERS/save_preferences_rsyncLOG.txt"
    mkdir -p $PATH_CONTAINERS
    DATE="$(date +%y-%m-%d.%H:%M:%S)"
    MSG="$DATE SAVING PREFERENCES LISTED IN: $PATH_PREFERENCES"
    echo_header1 $MSG
    echo_header1 $MSG >> $PATH_REPORT

    ALL_FILES=($PATH_PREFERENCES/*(.)) # Glob qualifier (.) takes only plain files
    #echo $ALL_FILES
    for FILE in $ALL_FILES; do
        #echo $FILE
        NAME_FILE=${FILE##*/}
        NAME_FOLDER=${NAME_FILE%%'.txt'*}
        echo_header2 "Saving preferences for: $NAME_FOLDER"

        PATH_SAVE="$PATH_CONTAINERS/$NAME_FOLDER/"
        #echo $PATH_SAVE
        mkdir -p $PATH_SAVE

        for LINE in ${(f)"$(<$FILE)"}; do
            #echo $LINE
            SUBLINE="${LINE%%#*}"   # Remove comments from LINE
            #echo $SUBLINE
            PREFERENCES=${SUBLINE//"~"/$HOME} # Substitute '~' by HOME
            #echo $PREFERENCES

            if [ ! -e $PREFERENCES ]; then
                MSG="File not found: $PREFERENCES"
                echo_header2 $MSG >> $PATH_REPORT
                echo_yellow $MSG
            else
                MSG="Syncing: $PREFERENCES"
                echo_header2 $MSG >> $PATH_REPORT
                echo $MSG
                rsync -ahdq --log-file=$PATH_REPORT --exclude ".DS_Store" \
                    $PREFERENCES $PATH_SAVE 2>/dev/null \
                    || echo_red "Sync failed: $PREFERENCES"
            fi

        done
        echo ' '
    done
}

function apply_preferences () {
    
}
