# Enable lid wakeup
sudo pmset -a lidwake 1

# Restart automatically on power loss
sudo pmset -a autorestart 1

# Restart automatically if the computer freezes
# Discard outputs to avoid error message: https://github.com/LnL7/nix-darwin/issues/359
sudo systemsetup -setrestartfreeze on 2>/dev/null 1>&2

# Set display & machine sleep, on battery (in minutes, 0=disabled)
sudo pmset -b displaysleep 2
sudo pmset -b sleep 5

# Set display & machine sleep, on charger (in minutes, 0=disabled)
sudo pmset -c displaysleep 2
sudo pmset -c sleep 0

# Set standby delay to 24 hours (default is 1 hour)
#sudo pmset -a standbydelay 86400

# Never go into computer sleep mode
#sudo systemsetup -setcomputersleep Off > /dev/null

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can still be restored in case of a
#    power failure.
#sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
#sudo rm /private/var/vm/sleepimage

# Create a zero-byte file instead…
#sudo touch /private/var/vm/sleepimage

# …and make sure it can’t be rewritten
#sudo chflags uchg /private/var/vm/sleepimage