#!/bin/sh
# If remontoire is running, kill it.  Otherwise start it.

remontoire_pid=$(pidof remontoire)

if [ -z "$remontoire_pid" ]; then
    cat ~/.config/sway/shortcuts/* | /usr/bin/remontoire -i &
else
    kill $remontoire_pid
fi
