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

gsettings set org.gnome.desktop.interface cursor-theme 'Qogir-cursors'
gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Dark-BL'
gsettings set org.gnome.desktop.interface icon-theme 'Tokyonight'
gsettings set org.gnome.desktop.interface font-name "Source Sans Pro 12"
gsettings set org.gnome.desktop.interface document-font-name "Source Sans Pro 12"
gsettings set org.gnome.desktop.interface monospace-font-name "JetBrainsMono Nerd Font Regular 10"
gsettings set org.gnome.desktop.interface font-antialiasing "rgba"

#################################
#          Autostart            #
#################################

numlockx &
exec bspwm
