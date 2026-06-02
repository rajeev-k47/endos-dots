#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PID_FILE="/tmp/rotate-wallpaper.pid"

kill_existing() {
    if [ -f "$PID_FILE" ]; then
        kill "$(cat "$PID_FILE")" 2>/dev/null || true
        rm -f "$PID_FILE"
    fi
}

usage() {
    echo "Usage: $0 [--interval N] [--stop] [--status]"
    exit 1
}

case "${1:-}" in
    --interval)
        kill_existing
        INTERVAL="${2:-300}"
        (
            cd "$SCRIPT_DIR" || exit 1
            echo $BASHPID > "$PID_FILE"
            while true; do
                img=$(find "$HOME/Pictures/Wallpapers" -maxdepth 2 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) 2>/dev/null | shuf -n1)
                [ -n "$img" ] && ./switchwall.sh "$img"
                sleep "$INTERVAL"
            done
        ) &
        disown
        ;;
    --stop)
        kill_existing
        ;;
    --status)
        if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
            echo "Rotating. PID $(cat "$PID_FILE") running for $(ps -o etime= -p "$(cat "$PID_FILE")" 2>/dev/null || echo "?")"
        else
            echo "Not running"
            rm -f "$PID_FILE"
        fi
        ;;
    *)
        usage
        ;;
esac
