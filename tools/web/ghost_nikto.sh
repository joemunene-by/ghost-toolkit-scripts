#!/bin/bash

TARGET=""
OUTPUT=""
TIMEOUT=5

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>    Target URL"
            echo "  -o, --output <file>   Output file"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/nikto_$(date +%Y%m%d_%H%M%S).txt}
mkdir -p ~/ghost_toolkit/scans

echo "======================================"
echo "    GHOST WEB VULNERABILITY SCANNER  "
echo "======================================"
echo "[*] Target: $TARGET"
echo ""

if command -v nikto &> /dev/null; then
    nikto -h "$TARGET" -o "$OUTPUT"
else
    echo "[!] nikto not found!"
    echo "[*] Installing nikto..."
    sudo apt install -y nikto
    nikto -h "$TARGET" -o "$OUTPUT"
fi

echo ""
echo "[+] Scan complete! Results saved to $OUTPUT"
