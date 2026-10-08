#!/bin/bash

DESKTOP="$1"
CURRENT=$(qdbus6 org.kde.KWin /KWin currentDesktop)

if [ "$CURRENT" -eq "$DESKTOP" ]; then
    echo "{\"text\":\"$DESKTOP\",\"class\":\"active\"}"
else
    echo "{\"text\":\"$DESKTOP\",\"class\":\"inactive\"}"
fi
