#!/bin/zsh

# Flush DNS Cache
function flush-dns {
		    sudo dscacheutil -flushcache;
		    sudo killall -HUP mDNSResponder;
  		    echo 'DNS Cache successfully flushed!'
		   }