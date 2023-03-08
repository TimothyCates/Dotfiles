#!/bin/sh
#################################
#           Default             #
#################################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

#################################
#           Settings            #
#################################

xset r rate 200 25
xset s off
xset -dpms
xset m 0 0

#################################
#          Autostart            #
#################################

numlockx &
exec bspwm
