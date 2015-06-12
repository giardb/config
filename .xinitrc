x#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

pulseaudio --start &
xscreensaver -no-splash &

#mv ~/.xlog ~/.xlog
#exec awesome &> ~/.xlog

compton -fbcCz -r 8 -o 1.0 -l -11 -t -11 -I 0.06 -O 0.06 -D 10 --focus-exclude "!class_g *?= 'sakura'" --inactive-opacity-override --shadow-exclude-reg 'x20+0+0' --opacity-rule "90:class_g *?= 'sakura'" -i 0.65 &


sxhkd &
exec bspwm

#exec gnome-session
