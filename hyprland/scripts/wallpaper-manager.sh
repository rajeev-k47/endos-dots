#!/bin/bash
STATE_FILE="$HOME/.switch_state"
INTERVAL=120
PID_FILE="/tmp/wallpaper-manager.pid"
II_SCRIPT_DIR="$HOME/.config/quickshell/ii/scripts/colors"

kill_existing() {
    if [ -f "$PID_FILE" ]; then
        kill "$(cat "$PID_FILE")" 2>/dev/null || true
        rm -f "$PID_FILE"
    fi
}

get_flavour() {
    if [ -f "$STATE_FILE" ]; then
        cat "$STATE_FILE"
    else
        echo "ii"
    fi
}

set_wallpaper() {
    local flavour="$1"
    local img
    case "$flavour" in
        ii)
            img=$(find "$HOME/Pictures/Wallpapers" -maxdepth 2 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) 2>/dev/null | shuf -n1)
            [ -n "$img" ] && "$II_SCRIPT_DIR/switchwall.sh" "$img"
            ;;
        caelestia|ambxst|xenon|dms)
            caelestia wallpaper --random "$HOME/Pictures/Wallpapers" -n 2>/dev/null
            ;;
    esac
}

case "${1:-}" in
    --interval)
        kill_existing
        INTERVAL="${2:-300}"
        (
            echo $BASHPID > "$PID_FILE"
            flavour=$(get_flavour)
            set_wallpaper "$flavour"
            while true; do
                sleep "$INTERVAL"
                flavour=$(get_flavour)
                set_wallpaper "$flavour"
            done
        ) &
        disown
        ;;
    --stop)
        kill_existing
        ;;
    --status)
        if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
            echo "Running. PID $(cat "$PID_FILE")"
        else
            echo "Not running"
            rm -f "$PID_FILE"
        fi
        ;;
    *)
        echo "Usage: $0 [--interval N] [--stop] [--status]"
        exit 1
        ;;
esac
