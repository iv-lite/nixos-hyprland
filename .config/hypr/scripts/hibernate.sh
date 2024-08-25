#!/usr/bin/env bash

swayidle -w \
    'swaylock -f -c 000000' \
    'systemctl suspend' \
    before-sleep 'swaylock -f -c 000000'
