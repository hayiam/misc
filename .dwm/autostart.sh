#!/bin/bash

xset -dpms
xset s off
picom --experimental-backends --config .config/picom/picom.conf &
~/.fehbg &
unclutter -root &
#google-chrome-stable --kiosk --no-startup-window &

while true; do

COMMAND=$(xset -q | grep LED | awk '{ print $10 }')
case "$COMMAND" in
 "00000000") LAYOUT="en" ;;
 "00001004") LAYOUT="ru" ;;
esac

TIME=$(date +%a\ %F\ %R)

    xsetroot -name " $LAYOUT $TIME "
    sleep 60

done &
