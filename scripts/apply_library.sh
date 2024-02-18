################################## Homebrew ###################################

# Install or update Homebrew
# See: https://gist.github.com/mrichman/f5c0c6f0c0873392c719265dfd209e12
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if hash brew &>/dev/null; then
	echo_ok "Homebrew already installed. Getting updates..."
	brew-up
	brew doctor
else
	echo_warn "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Add Third-Party Repositories (taps)
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

# Install Homebrew packages
zsh library/brew_packages.sh

# Install Homebrew casks
zsh library/brew_casks.sh

# Apply configurations based on Homebrew
# (change terminal default profile to "Homebrew (PowerLevel10k)")

# Remove unnecessary dependencies
brew-clean

################################## App Store ##################################

# Upgrade apps
mas upgrade

# Apply Mac App Store (depends on `mas` from Homebrew)
zsh library/mas_apps.sh