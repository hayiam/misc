#!/bin/bash

compton --config ~/.config/compton/compton.conf &
~/.fehbg &
unclutter -root &

# run xsetroot to show the date in the bar every 1 second
while true; do

    xsetroot -name " $(date +%a\ %F\ %R)"
    sleep 60

done &
