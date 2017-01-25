#!/bin/bash
# script i3lock blur pixel no unlock indicator
# From https://github.com/savoca/dotfiles/blob/gray/home/.bin/scripts/lock.sh

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
