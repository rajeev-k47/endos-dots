#!/usr/bin/env bash
WS="nchat"
CLASS="nchat"
clients=$(hyprctl -j clients)
addr=$(echo "$clients" | jq -r --arg c "$CLASS" '.[] | select(.class==$c) | .address' | head -n1)
if [ -n "$addr" ]; then
  hyprctl dispatch movetoworkspacesilent "special:$WS,address:$addr"
  hyprctl dispatch togglespecialworkspace "$WS"
else
  hyprctl dispatch exec "[workspace special:$WS] foot -e nchat"
  hyprctl dispatch togglespecialworkspace "$WS"
fi
