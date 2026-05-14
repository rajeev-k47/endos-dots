#!/bin/bash
WALLPAPER_DIR="${1:-$HOME/Pictures/Wallpapers}"
INTERVAL="${2:-60}"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Directory $WALLPAPER_DIR not found"
    exit 1
fi

while true; do
    img=$(find "$WALLPAPER_DIR" -maxdepth 2 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) 2>/dev/null | shuf -n1)
    if [ -n "$img" ]; then
        "$(dirname "$0")/switchwall.sh" "$img"
    fi
    sleep "$INTERVAL"
done
