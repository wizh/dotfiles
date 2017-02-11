# boilerplate
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

xrdb -merge ~/.Xresources

# monitors
xrandr --output VGA1 --mode 1920x1080 --left-of LVDS1 --primary
xrandr --output LVDS1 --mode 1366x768 --right-of VGA1

# key repeat
xset r rate 200 25

# wallpaper
xsetroot -solid "gray5"

# keybindings
xbindkeys &

# start clipboard manager
parcellite &

# start utility for hiding mouse
hhpc & 

# start flux
/usr/local/bin/xflux -l 55.6761 -g 12.5683 -k 2500 -nofork -r &

# rice
FG='grey70' 
BG='#2c2c32' 
FONT='-*-profont-*-*-*-*-12-*-*-*-*-*-*'

# window manager
xmonad-acpi
xmonad &

wait $!
pkill -HUP -f xmonad-acpi
