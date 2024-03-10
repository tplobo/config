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
    PREFPATH="prefpaths/macos"
    #PREFPATH="prefpaths/third_party"
    ALL_FILES=($PREFPATH/*)
    #echo $ALL_FILES
    for FILE in $ALL_FILES; do
        #echo $FILE
        FILENAME=${FILE##*/}
        FOLDER=${FILENAME%%'.txt'*}
        for LINE in ${(f)"$(<$FILE)"}; do
            #echo $LINE
            PREFERENCES=${LINE%%#*}
            #echo "$PREFERENCES"
            SAVEPATH="~/Documents/VSCODE/CONFIG/$PREFPATH/$FOLDER"
            #echo $SAVEPATH
            rsync $PREFERENCES $SAVEPATH
        done

        #IFS=$'\n'
        #source $FILE
        
        #TYPE="${(t)SETTINGS}"
        #echo $TYPE; echo ' '

        #echo $SETTINGS
        #printf '%q' "$SETTINGS"
        #echo ' '

        #echo ${SETTINGS[@]}
        #printf '%q ' "${SETTINGS[@]}"
        #echo ' '


        #IFS=$'\n'
        #array=("${(@f)$(printf '%s/n' $SETTINGS)}")
        #echo $array
        #ARRAY=(${(f)SETTINGS})
        #printf '%s\n' $array
        #echo ' '
        #while read -r LINE; do
        #    echo "$LINE"
        #done < <(SETTINGS)

        #SETTINGS="$(SETTINGS)"
        
        
        #while IFS= read -r LINE; do
        #    echo "$LINE"
        #done <<< ${(f)SETTINGS}

        #OIFS="$IFS"
        #IFS="\n"
        #for LINE in ${(ps:\n:)SETTINGS}
        #do
        #    echo "LINE: $line"
        #done
        #IFS="$OIFS"

        #OIFS="$IFS"
        #IFS=$'\n\n'
        #printf %q "$IFS"; echo ''

        #printf '%s\n' "${(f)SETTINGS}"
        #printf '%s\n' $(${(ps:\n:)"$(SETTINGS)"})
        #while read -r line; do
        #    echo "LINE: $line"
        #done <<< "$SETTINGS"
        #done < <(printf '%s\n' ${SETTINGS[@]})

        #IFS="$OIFS"
        #printf %q "$IFS"; echo ''

        
        #while read -r line; do
        #    echo $line
        #done <<<
        
        #for PREF in "$SETTINGS[@]"; do
        #for PREF ($=SETTINGS) ; do
        #for PREF (${(f)SETTINGS}) ; do
        #    echo $PREF
        #done
        
        echo ' '
    done
    #DATA=cat preferences/macos/terminal.sh
    #echo $DATA
    #cp `cat list.txt` new-folder/
}
