#!/bin/bash

TARGET=""
AGGRESSION=1
OUTPUT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -a|--aggression) AGGRESSION="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>       Target URL"
            echo "  -a, --aggression <1-4>  Aggression level (1-4)"
            echo "  -o, --output <file>     Output file"
            echo "  -h, --help             Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/whatweb_$(date +%Y%m%d_%H%M%S).txt}

echo "======================================"
echo "   GHOST WHATWEB v1.0                 "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Aggression: $AGGRESSION"
echo ""

if command -v whatweb &> /dev/null; then
    whatweb -a "$AGGRESSION" "$TARGET" --log-xml="$OUTPUT.xml" --log-html="$OUTPUT.html" --log-json="$OUTPUT.json"
else
    echo "[!] whatweb not found"
    echo "[*] Installing whatweb..."
    sudo apt install -y whatweb
    whatweb -a "$AGGRESSION" "$TARGET" --log-xml="$OUTPUT.xml" --log-html="$OUTPUT.html" --log-json="$OUTPUT.json"
fi

echo ""
echo "[+] Scan complete!"
