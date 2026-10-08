#!/bin/bash

# Watch KWin virtual-desktop changes and refresh Waybar workspace indicators.
dbus-monitor --session \
  "type='signal',interface='org.kde.KWin.VirtualDesktopManager',member='currentChanged'" | \
while read -r line; do
    case "$line" in
        *"member=currentChanged"*)
            pkill -RTMIN+8 waybar
            ;;
    esac
done
