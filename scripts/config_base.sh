
# Define apply function
function apply_items () {
    for FILE in $@; do
        yes | cp -rf $FILE "$HOME/"$FILE
        echo $FILE" applied!";
    done
    }

# Define save function
function save_items () {
    for FILE in $@; do
        yes | cp -rf "$HOME/"$FILE $FILE
        echo $FILE" saved!";
    done
    }

DOTFILES=(
    .zshrc_config
    .zshrc
    #.zsh_p10k
    #.zsh_omz
    .zsh_aliases
	#.zsh_syntax
)

