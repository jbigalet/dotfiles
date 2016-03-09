#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# environment dependent files
[[ -f ~/.Xresources.$HOST ]] && xrdb -merge -I$HOME ~/.Xresources.$HOST


pulseaudio --start

xset r rate 250 50
xset b off
xset -dpms

setxkbmap fr
setxkbmap -option caps:escape


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec i3
