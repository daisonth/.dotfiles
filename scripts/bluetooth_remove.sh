#!/usr/bin/env bash

export XAUTHORITY=/home/daison/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

/usr/bin/notify-send '🎧 Device Disconnected'
