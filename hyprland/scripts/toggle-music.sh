#!/usr/bin/env bash

WS="Spotify"
CLASS="Spotify"

addr=$(hyprctl -j clients | jq -r \
  --arg c "$CLASS" \
  '.[] | select(.class==$c) | .address' | head -n1)

if [[ -n "$addr" ]]; then
  hyprctl dispatch 'hl.dsp.workspace.toggle_special("Spotify")'
else
  hyprctl dispatch 'hl.dsp.exec_cmd("spotify", { workspace = "special:Spotify silent" })'
  hyprctl dispatch 'hl.dsp.workspace.toggle_special("Spotify")'
fi
