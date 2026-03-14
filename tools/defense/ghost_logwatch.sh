#!/bin/bash

LOGFILE=""
PATTERN=""
ALERT=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -l|--log) LOGFILE="$2"; shift 2 ;;
        -p|--pattern) PATTERN="$2"; shift 2 ;;
        -a|--alert) ALERT=true; shift ;;
        -h|--help)
            echo "Usage: $0 -l <logfile> -p <pattern> [options]"
            echo ""
            echo "Options:"
            echo "  -l, --log <file>       Log file to watch"
            echo "  -p, --pattern <regex>  Pattern to alert on"
            echo "  -a, --alert            Enable desktop notifications"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$LOGFILE" ] && LOGFILE="/var/log/syslog"
[ -z "$PATTERN" ] && PATTERN="error|fail|denied|attack"

echo "======================================"
echo "   GHOST LOG WATCHER v1.0             "
echo "======================================"
echo "[*] Log: $LOGFILE"
echo "[*] Pattern: $PATTERN"
echo "[*] Watching... (Ctrl+C to stop)"
echo ""

if command -v tail &> /dev/null; then
    tail -f "$LOGFILE" | grep --line-buffered -E "$PATTERN" | while read line; do
        echo "[ALERT] $(date) - $line"
        if [ "$ALERT" = true ]; then
            notify-send "Ghost Alert" "$line" 2>/dev/null || echo "[*] Install libnotify for alerts"
        fi
    done
else
    echo "[!] tail not found"
fi
