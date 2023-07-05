#!/bin/bash
sleep 1
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal
systemctl --user stop pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr

systemctl --user start wireplumber

/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
