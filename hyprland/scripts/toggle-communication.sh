#!/usr/bin/env bash

WS="nchat"
CLASS="foot"

clients=$(hyprctl -j clients)

addr=$(echo "$clients" | jq -r \
  --arg c "$CLASS" \
  '.[] | select(.class==$c and (.title | test("nchat"; "i"))) | .address' |
  head -n1)

if [[ -n "$addr" ]]; then
  hyprctl dispatch \
    "hl.dsp.window.movetoworkspace(\"address:$addr\", \"special:$WS\")"

  hyprctl dispatch \
    "hl.dsp.workspace.toggle_special(\"$WS\")"
else
  hyprctl dispatch \
    "hl.dsp.exec_cmd(\"foot -e nchat\", { workspace = \"special:$WS silent\" })"

  hyprctl dispatch \
    "hl.dsp.workspace.toggle_special(\"$WS\")"
fi
