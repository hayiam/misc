#!/bin/bash

xset -dpms
xset s off
#compton --config .config/compton/compton.conf &
~/.fehbg &
picom --experimental-backends --config .config/picom/picom.conf &
unclutter -root &
firefox-bin --headless &

# setting up dinamic wallpapers which will change every 60 seconds by using styli.sh script (sourse code of it: https://github.com/thevinter/styli.sh)
#while true; do
#
#feh --bg-fill pictures/wallpapers/wallpaper18.jpeg
#for i in "nature" "animals" "plants" "small town" "abstract" "fantasy" "paintings"
#    do
#styli.sh -b bg-scale -s "$i"
#sleep 10m
#done
#
#done &

# setting up panel
while true; do

COMMAND=$(xset -q | grep LED | awk '{ print $10 }')
case "$COMMAND" in
 "00000000" | "00000001" | "00000002" | "00000003" ) LAYOUT="en" ;;
 "00001004" | "00001005" | "00001006" | "00001007" ) LAYOUT="ru" ;;
esac

TIME=$(date +%a\ %F\ %R)

    xsetroot -name " $LAYOUT $TIME "
    sleep 60

done &
