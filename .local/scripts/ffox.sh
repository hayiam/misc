#!/bin/bash

HFFOX=$(ps -aux | grep 'firefox-bin --headless' | awk 'NR==1{print $2}'); [ ! -z $HFFOX ] && [ $(ps -aux | grep 'firefox-bin --headless' | awk 'NR==1{print $11}') != 'grep' ] && kill $HFFOX; firefox-bin &
