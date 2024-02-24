################################## dotfiles ###################################

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

DOTFILES=(
    .zshrc_config
    .zshrc
    .zprofile
    .zsh_p10k
    .zsh_omz
    .zsh_aliases
	.zsh_syntax
)

################################## Structure ##################################

function apply_folders () {
    for FOLDER in $@; do
        mkdir -p $FOLDER
        echo $FOLDER" folder created!";
    done
    }

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