#!/bin/bash

CURSOR_OPTION="cursor:invisible"
CUR_STATUS=$(hyprctl getoption $CURSOR_OPTION | head -n1 | awk '{print $2}')

if [ "$CUR_STATUS" = "1" ]; then
  hyprctl keyword $CURSOR_OPTION false
else
  hyprctl keyword $CURSOR_OPTION true
fi

DEVICE="elan0790:00-04f3:315d-touchpad"
STATE_FILE="/tmp/touchpad_state"

if [ -f "$STATE_FILE" ]; then
  hyprctl keyword "device[$DEVICE]:enabled" true -r
  rm -f "$STATE_FILE"
  notify-send "Touchpad and Cursor enabled"
else
  hyprctl keyword "device[$DEVICE]:enabled" false -r
  touch "$STATE_FILE"
  notify-send "Touchpad and Cursor disabled"
fi
