# Create `config` group
sudo dseditgroup -o create config

# Add `root` to `config`
sudo dseditgroup -o edit -a root -t user config

# Add current user to `config`
USER=$(whoami)
sudo dseditgroup -o edit -a $USER -t user config