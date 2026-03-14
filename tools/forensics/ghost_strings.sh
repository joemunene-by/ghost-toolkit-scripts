#!/bin/bash

TARGET=""
MODE="strings"
OUTPUT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--file) TARGET="$2"; shift 2 ;;
        -m|--mode) MODE="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -f <file> [options]"
            echo ""
            echo "Options:"
            echo "  -f, --file <file>       Target file"
            echo "  -m, --mode <mode>       strings|bin|all|entropy"
            echo "  -o, --output <file>    Output file"
            echo "  -h, --help             Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] File required"; exit 1; }
[ ! -f "$TARGET" ] && { echo "[!] File not found: $TARGET"; exit 1; }

OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/strings_$(date +%Y%m%d_%H%M%S).txt}

echo "======================================"
echo "   GHOST STRINGS ANALYZER v1.0        "
echo "======================================"
echo "[*] File: $TARGET"
echo "[*] Mode: $MODE"
echo ""

case $MODE in
    strings)
        strings "$TARGET" | tee "$OUTPUT"
        echo "[+] Found $(wc -l < "$OUTPUT") strings"
        ;;
    bin)
        strings -e l "$TARGET" | tee "$OUTPUT"
        strings -e b "$TARGET" >> "$OUTPUT"
        ;;
    all)
        strings -a "$TARGET" | tee "$OUTPUT"
        ;;
    entropy)
        echo "[*] Calculating entropy..."
        python3 -c "
import math
with open('$TARGET', 'rb') as f:
    data = f.read()
    freq = [0] * 256
    for b in data:
        freq[b] += 1
    entropy = 0
    for c in freq:
        if c:
            p = c / len(data)
            entropy -= p * math.log2(p)
    print(f'Entropy: {entropy:.4f}')
"
        ;;
esac

echo ""
echo "[+] Results saved to: $OUTPUT"
