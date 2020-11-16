#!/bin/bash

compton --config ~/.config/compton/compton.conf &
~/.fehbg &
unclutter -root &

while true; do

    xsetroot -name " $(curl -s 'wttr.in/Orenburg?format=%t+%w\n') $(date +%a\ %F\ %R)"
    sleep 60

done &
