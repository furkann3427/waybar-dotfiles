#!/bin/sh

if pgrep -f "plasmawindowed $1" >/dev/null; then
    pkill -x plasmawindowed
else
    pkill -x plasmawindowed
    plasmawindowed "$1" &
fi
