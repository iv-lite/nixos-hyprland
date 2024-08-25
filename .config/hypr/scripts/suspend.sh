#!/usr/bin/env bash

swayidle -w \
    timeout 120 ' swaylock -f -c 000000' \
    timeout 400 ' hyprctl dispatch dpms off' \
    timeout 12000 'systemctl suspend' \
    resume ' hyprctl dispatch dpms on' \
    before-sleep 'swaylock -f -c 000000'
