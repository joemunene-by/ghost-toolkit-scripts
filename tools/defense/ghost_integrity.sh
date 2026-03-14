#!/bin/bash

MODE="check"
BASELINE=""
DIRECTORY=""
# shellcheck disable=SC2034
ALERT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--mode) MODE="$2"; shift 2 ;;
        -d|--directory) DIRECTORY="$2"; shift 2 ;;
        -b|--baseline) BASELINE="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -m, --mode <mode>       init|check|update"
            echo "  -d, --directory <dir>   Directory to monitor"
            echo "  -b, --baseline <file>  Baseline file"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$DIRECTORY" ] && DIRECTORY=$HOME
BASELINE=${BASELINE:-$HOME/.ghost_integrity_baseline.txt}

echo "======================================"
echo "   GHOST FILE INTEGRITY v1.0          "
echo "======================================"
echo "[*] Mode: $MODE"
echo "[*] Directory: $DIRECTORY"
echo ""

case $MODE in
    init)
        echo "[*] Creating baseline..."
        find "$DIRECTORY" -type f -exec md5sum {} \; 2>/dev/null | grep -v "Permission denied" > "$BASELINE"
        echo "[+] Baseline created: $BASELINE"
        ;;
    check)
        echo "[*] Checking integrity..."
        if [ ! -f "$BASELINE" ]; then
            echo "[!] No baseline found. Run: $0 -m init -d <dir>"
            exit 1
        fi
        
        TEMP=$(mktemp)
        find "$DIRECTORY" -type f -exec md5sum {} \; 2>/dev/null | grep -v "Permission denied" > "$TEMP"
        
        echo "[*] Comparing..."
        diff "$BASELINE" "$TEMP" | grep "^[<>]" | while read line; do
            echo "[ALERT] $line"
        done
        
        rm -f "$TEMP"
        echo "[+] Check complete"
        ;;
    update)
        echo "[*] Updating baseline..."
        find "$DIRECTORY" -type f -exec md5sum {} \; 2>/dev/null | grep -v "Permission denied" > "$BASELINE"
        echo "[+] Baseline updated"
        ;;
esac
