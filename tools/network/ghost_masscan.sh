#!/bin/bash

TARGET=""
PORTS=""
RATE=1000
OUTPUT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -p|--ports) PORTS="$2"; shift 2 ;;
        -r|--rate) RATE="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <ip/range>   Target IP or range"
            echo "  -p, --ports <ports>        Ports (default: top 100)"
            echo "  -r, --rate <num>          Packet rate (default: 1000)"
            echo "  -o, --output <file>       Output file"
            echo "  -h, --help                Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/masscan_$(date +%Y%m%d_%H%M%S).txt}

echo "======================================"
echo "   GHOST MASSCAN v1.0                 "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Rate: $RATE"
echo ""

if command -v masscan &> /dev/null; then
    sudo masscan "$TARGET" -p${PORTS:-"80,443,22,21,25,3389,8080,8443"} --rate=$RATE -oJ "$OUTPUT"
    echo "[+] Results saved to: $OUTPUT"
else
    echo "[!] masscan not found"
    echo "[*] Installing masscan..."
    sudo apt install -y masscan
    sudo masscan "$TARGET" -p${PORTS:-"80,443,22,21,25,3389,8080,8443"} --rate=$RATE -oJ "$OUTPUT"
fi
