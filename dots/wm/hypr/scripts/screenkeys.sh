#!/usr/bin/env bash

# Check if wshowkeys is running
if pgrep -x "wshowkeys" >/dev/null; then
	# wshowkeys is running, so kill it
	pkill -x "wshowkeys"
else

	wshowkeys -a bottom
fi
