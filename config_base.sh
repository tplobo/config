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
        if [[ "$SHORTCUT" == *"nwnode"* ]];
        then;
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