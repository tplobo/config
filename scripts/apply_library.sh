################################## Homebrew ###################################

# Notify user
echo "Installing Homebrew packages and casks..."

# Install or update Homebrew
# See: https://gist.github.com/mrichman/f5c0c6f0c0873392c719265dfd209e12
export LIBRARY_PATH="/Applications"
export HOMEBREW_CASK_OPTS="--appdir=$LIBRARY_PATH"
if hash brew &>/dev/null; then
	echo "Homebrew already installed. Getting updates..."
	brew update; brew upgrade; brew cleanup; brew doctor
else
	echo "Installing homebrew..."
	NONINTERACTIVE=1
	URL=https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    /bin/bash -c "$(curl -fsSL $URL)"
	#(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/tiago/.zprofile
    #eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Turn off cleanup after every install
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Add Third-Party Repositories (taps)
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

# Install Homebrew packages & casks
zsh library/brew_packages.sh
zsh library/brew_casks.sh

# Apply configurations based on Homebrew
# (change terminal default profile to "Homebrew (PowerLevel10k)")

# Turn on cleanup after every install
export HOMEBREW_NO_INSTALL_CLEANUP=0

# Remove unnecessary dependencies
brew autoremove; brew cleanup

################################## App Store ##################################

# Notify user
echo "Installing Mac App Store apps..."

# Upgrade apps
mas upgrade

# Apply Mac App Store (depends on `mas` from Homebrew)
zsh library/mas_apps.sh

################################## Direct URLs ################################

# Notify user
echo "Installing apps from direct URLs..."

# Install apps directly from URLs
zsh library/url_dmg.sh

############################# Manual Installation #############################

#TODO: find package to make .ICNS files
#TODO: message about 'MATLAB', 'WOLFRAM MATHEMATICA', ...