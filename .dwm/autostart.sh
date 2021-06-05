#!/bin/bash

xset -dpms
xset s off
picom --experimental-backends --config .config/picom/picom.conf &
~/.fehbg &
unclutter -root &


while true; do

sleep 1
for i in "nature" "animals" "plants" "small town" "abstract"
    do
$HOME/misc/myde/styli.sh/styli.sh -b bg-scale -s "$i"
sleep 1m
done

done &


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
