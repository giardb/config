#!/bin/sh
#take from https://github.com/thegnome/dotfiles
#color modified and make it in 7 line instead of col

SCREENWIDTH=$(xrandr -q | grep Screen | awk '{print $8}')
SCREENHEIGHT=$(xrandr -q | grep Screen | awk '{print $10}' | sed s/,//)

EDGEWIDTH=500
DMENUWIDTH=$(($SCREENWIDTH - $(($EDGEWIDTH + $EDGEWIDTH))))

XPOS=$EDGEWIDTH
YPOS=$(($(($SCREENHEIGHT / 2)) - 15))

FGSELECT="#613532"
BGSELECT="#1197ba"
FG="#9db4c4"
BG="#000000"
FONT="-*-terminus-*-*-*-*-*-*-*-*-*-*-*-*"

dmenu_run -l 7 -w $DMENUWIDTH -x $XPOS -y $YPOS -fn ${FONT} -nb $BG -nf $FG -sb $BGSELECT -p "%" -dim 0.75
