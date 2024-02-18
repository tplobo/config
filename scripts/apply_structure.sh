# Create folders
FOLDERS=(
    '$HOME/☁️ Clouds ☁️'
    '$HOME/⛰️ Mounts ⛰️'
    '$HOME/Applications/MATLAB'
)
apply_folders $FOLDERS

# Create sym-link to default mac icons
ICONS='/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources'
ln -s $ICONS ~/Pictures/'Default MacOS Icons'

