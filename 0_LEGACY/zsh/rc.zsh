#!/bin/zsh

# Autocompletion (using arrow keys, based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Aliases (custom terminal commands)
source ~/.zsh_aliases