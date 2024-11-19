#!/usr/bin/env bash

export XAUTHORITY=/home/daison/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

bluetoothctl connect 98:47:44:29:43:DC
/usr/bin/notify-send '🎧 Device Connected'
