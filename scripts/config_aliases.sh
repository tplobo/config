#!/bin/zsh

# Flush DNS Cache
function flush {
		    sudo dscacheutil -flushcache;
		    sudo killall -HUP mDNSResponder;
  		    echo 'DNS Cache successfully flushed!'
		   }


# Enable / Disable Crash Reporter (none|basic|developer|server)
function crashreporter_off {
    defaults write com.apple.CrashReporter DialogType -string "none"
}
function crashreporter_on {
    defaults write com.apple.CrashReporter DialogType -string "developer"
}

# Config messages
red='\033[31;1m'
green='\033[32;1m'
yellow='\033[33;1m'
reset='\033[0m'
function echo_red() { echo $red"$1"$reset; }
function echo_green() { echo $green"$1"$reset; }
function echo_yellow() { echo $yellow"$1"$reset; }

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Volume control (http://xkcd.com/530/)
alias shutup="osascript -e 'set volume output muted true'"
alias shoutout="osascript -e 'set volume output volume 100'"