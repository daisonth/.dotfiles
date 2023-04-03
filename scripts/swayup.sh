#! /bin/sh

export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export GDK_BACKEND=wayland
export WLR_DRM_NO_MODIFIERS=1
sway $@
