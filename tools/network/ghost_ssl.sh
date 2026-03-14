#!/bin/bash

TARGET=""
OUTPUT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <host>     Target host"
            echo "  -o, --output <file>    Output file"
            echo "  -h, --help              Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/ssl_$(date +%Y%m%d_%H%M%S).txt}
mkdir -p ~/ghost_toolkit/scans

echo "======================================"
echo "    GHOST SSL/TLS ANALYZER v1.0      "
echo "======================================"
echo "[*] Target: $TARGET"
echo ""

if command -v testssl &> /dev/null; then
    testssl --quiet --jsonfile "$OUTPUT.json" --htmlfile "$OUTPUT.html" "$TARGET"
elif command -v sslscan &> /dev/null; then
    sslscan --xml="$OUTPUT.xml" "$TARGET"
else
    echo "[*] Installing sslscan..."
    sudo apt install -y sslscan
    sslscan --xml="$OUTPUT.xml" "$TARGET"
fi

echo ""
echo "[+] Scan complete! Results saved to $OUTPUT"
