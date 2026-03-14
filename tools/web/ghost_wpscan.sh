#!/bin/bash

TARGET=""
# shellcheck disable=SC2034
MODE="enumerate"
USER=""
PLUGINS=false
THEMES=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -u|--user) USER="$2"; shift 2 ;;
        -p|--plugins) PLUGINS=true; shift ;;
        -th|--themes) THEMES=true; shift ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>       Target WordPress site"
            echo "  -u, --user <username>   Username to enumerate/bruteforce"
            echo "  -p, --plugins           Enumerate plugins"
            echo "  -th, --themes           Enumerate themes"
            echo "  -h, --help             Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

mkdir -p ~/ghost_toolkit/scans
OUTPUT=~/ghost_toolkit/scans/wpscan_$(date +%Y%m%d_%H%M%S)

echo "======================================"
echo "   GHOST WPSCAN v1.0                  "
echo "======================================"
echo "[*] Target: $TARGET"
echo ""

if command -v wpscan &> /dev/null; then
    OPTS="--url $TARGET --format json --output $OUTPUT.json"
    
    [ "$PLUGINS" = true ] && OPTS="$OPTS --enumerate vp"
    [ "$THEMES" = true ] && OPTS="$OPTS --enumerate vt"
    
    wpscan $OPTS
else
    echo "[!] wpscan not found"
    echo "[*] Install from: https://github.com/wpscanteam/wpscan"
fi

echo ""
echo "[+] Scan complete!"
