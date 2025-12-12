#!/usr/bin/env bash
WS="Spotify"
CLASS="Spotify"
clients=$(hyprctl -j clients)
addr=$(echo "$clients" | jq -r --arg c "$CLASS" '.[] | select(.class==$c) | .address' | head -n1)
if [ -n "$addr" ]; then
  hyprctl dispatch movetoworkspacesilent "special:$WS,address:$addr"
  hyprctl dispatch togglespecialworkspace "$WS"
else
  hyprctl dispatch exec "[workspace special:$WS]  spicetify watch -s"
  hyprctl dispatch togglespecialworkspace "$WS"
fi
