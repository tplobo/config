# Source base script
source config_base.sh

# Apply dotfiles
apply_dotfiles $DOTFILES

# Re-source zsh configuration
source ~/.zshrc