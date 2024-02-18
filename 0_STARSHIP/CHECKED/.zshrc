################################ Configuration ################################

source "$HOME/.zshrc_config";

source_configs $CONFIGS_FULL

############################# Environment Manager #############################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tiago/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tiago/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/tiago/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tiago/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<