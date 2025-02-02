# Architecture-dependent Homebrew PATH
ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
    if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
        echo "Running on Rosetta 2"
    else
        echo "Running on native Intel"
    fi 
elif [ "${ARCH_NAME}" = "arm64" ]; then
    echo "Running on ARM"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Unknown architecture: ${ARCH_NAME}"
fi

# Setting PATH for Python 3.10 (original saved in .zprofile.pysave)
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"

# Export PATH
export PATH