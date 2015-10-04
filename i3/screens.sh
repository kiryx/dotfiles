#!/bin/sh

# Laptop screen as first
FIRST="LVDS1"
# External Screen on VGA port
SECOND="VGA1"

xrandr --output $SECOND --off --output $FIRST --auto
xmodmap ~/.xmodmaprc

i3-nagbar -m "DUAL SCREEN CONFIG UTILITY (run 'arandr' for config)" -t warning \
	-b "LVDS + VGA" "xrandr --output $SECOND --auto  --left-of $FIRST --output $FIRST --auto  --primary" \
	-b "LVDS ONLY" "xrandr --output $SECOND --off --output $FIRST --auto  --primary" \
	-b "CAPS LOCK OFF"    "sh /home/alice/.caps_lock_off"

# Original Script by ebrnd ( http://ebrnd.de/?p=501 )
##!/bin/sh
#
#xrandr --output VGA-0 --off --output DVI-0 --off --output LVDS --auto
#
#i3-nagbar -m "EBRND'S SUPER-COOL I3WM SCREEN CONFIG UTILITY" -t warning \
#	-b "LVDS + DVI"  "xrandr --output VGA-0 --off --output LVDS --auto --output DVI-0 --auto --right-of LVDS" \
#	-b "LVDS + VGA"  "xrandr --output DVI-0 --off --output LVDS --auto --output VGA-0 --auto --right-of LVDS" \
#	-b "CAPS OFF"    "sh /home/alice/.caps_lock_off"
#
#sh ~/.fehbg 
