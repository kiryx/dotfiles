#!/bin/sh

# Laptop screen as first
FIRST="eDP1"
# External Screen on VGA port
SECOND="DP1"

xrandr --output $SECOND --off --output $FIRST --auto

i3-nagbar -m "SCREEN CONFIG UTILITY (run 'arandr' for config)" -t warning \
	-b "$SECOND" "xrandr --output $SECOND --auto --dpi 96 --output $FIRST --off; swapkeys; setxkbmap pl -option caps:swapescape" \
	-b "Scale $FIRST" "xrandr --output $FIRST --scale 0.5x0.5" \
	-b "$FIRST" "xrandr --output $FIRST --dpi 192"

# Original Script by ebrnd ( http://ebrnd.de/?p=501 )
##!/bin/sh
#
#xrandr --output VGA-0 --off --output DVI-0 --off --output LVDS --auto
#
#i3-nagbar -m "EBRND'S SUPER-COOL I3WM SCREEN CONFIG UTILITY" -t warning \
#	-b "LVDS + DVI"  "xrandr --output VGA-0 --off --output LVDS --auto --output DVI-0 --auto --right-of LVDS" \
#	-b "LVDS + VGA"  "xrandr --output DVI-0 --off --output LVDS --auto --output VGA-0 --auto --right-of LVDS" \
#	-b "CAPS OFF"    "python /home/$USER/.local/bin/caps_lock_off.py"
#
#sh ~/.fehbg 
