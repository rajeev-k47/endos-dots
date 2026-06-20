#!/bin/bash
WALLPAPER="$1"
[[ -z "$WALLPAPER" ]] && { echo "Usage: $0 <image>"; exit 1; }

wal -i "$WALLPAPER"

source "${HOME}/.cache/wal/colors.sh"

cat > "${HOME}/.config/hypr/pywal-colors.conf" << EOF
# Pywal colors for Hyprland
\$background = $background
\$foreground = $foreground
\$color0 = $color0
\$color1 = $color1
\$color2 = $color2
\$color3 = $color3
\$color4 = $color4
\$color5 = $color5
\$color6 = $color6
\$color7 = $color7
\$color8 = $color8
EOF

echo "Generated ~/.config/hypr/pywal-colors.conf"
