#!/bin/bash
OPACITY_FLOAT=0.3
OPACITY_TILED=1.0

ADDR=$(hyprctl activewindow -j | jq -r '.address')
FLOATING=$(hyprctl activewindow -j | jq -r '.floating')

if [ "$FLOATING" = "true" ]; then
  hyprctl dispatch "hl.dsp.window.float({action='toggle'})"
  hyprctl setprop "address:${ADDR}" opacity ${OPACITY_TILED}
else
  hyprctl dispatch "hl.dsp.window.float({action='toggle'})"
  hyprctl setprop "address:${ADDR}" opacity ${OPACITY_FLOAT}
fi
