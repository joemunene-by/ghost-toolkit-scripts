#!/bin/bash

TARGET=""
MODE="scan"
DEEP=false
BAV=false
OUTPUT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -m|--mode) MODE="$2"; shift 2 ;;
        -d|--deep) DEEP=true; shift ;;
        -b|--bas) BAV=true; shift ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>      Target URL"
            echo "  -m, --mode <mode>      scan|grep|payload"
            echo "  -d, --deep             Deep scanning"
            echo "  -b, --bav              Check BAV (Browser Audit)"
            echo "  -o, --output <file>    Output file"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/dalfox_$(date +%Y%m%d_%H%M%S).txt}

echo "======================================"
echo "   GHOST DALFOX (XSS) v1.0            "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Mode: $MODE"
echo ""

if command -v dalfox &> /dev/null; then
    OPTS="--format json --output $OUTPUT.json"
    [ "$DEEP" = true ] && OPTS="$OPTS --deep"
    [ "$BAV" = true ] && OPTS="$OPTS --bav"
    
    dalfox url "$TARGET" $OPTS
    
    cat "$OUTPUT.json" | jq -r '.data[] | "\(.param) -> \(.matched)"' > "$OUTPUT.txt" 2>/dev/null
    
    echo "[+] Results saved to: $OUTPUT"
else
    echo "[!] dalfox not found"
    echo "[*] Installing dalfox..."
    GO111MODULE=on go install github.com/hahwul/dalfox/v2@latest
    export PATH=$PATH:$(go env GOPATH)/bin
    dalfox url "$TARGET" --format json --output "$OUTPUT.json"
fi
