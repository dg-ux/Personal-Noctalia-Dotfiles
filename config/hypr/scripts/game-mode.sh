#!/bin/zsh

STATE=/tmp/hypr-gamemode

if [ -f "$STATE" ]; then
    rm "$STATE"

    hyprctl eval '
        hl.config({
            decoration = {
                rounding = 12,
                active_opacity = 0.8,
                inactive_opacity = 0.8,
                shadow = {
                    enabled = true,
                },
                blur = {
                    enabled = true,
                },
            },
        })
    '
else
    touch "$STATE"

    hyprctl eval '
        hl.config({
            decoration = {
                rounding = 0,
                active_opacity = 1.0,
                inactive_opacity = 1.0,
                fullscreen_opacity = 1.0,
                shadow = {
                    enabled = false,
                },
                blur = {
                    enabled = false,
                },
            },
        })
    '
fi