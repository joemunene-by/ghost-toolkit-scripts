#!/bin/bash

TARGET=""
DEPTH=3
CONCURRENCY=10
OUTPUT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -d|--depth) DEPTH="$2"; shift 2 ;;
        -c|--concurrency) CONCURRENCY="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>      Target URL"
            echo "  -d, --depth <num>        Crawl depth (default: 3)"
            echo "  -c, --concurrency <num> Concurrent threads (default: 10)"
            echo "  -o, --output <dir>       Output directory"
            echo "  -h, --help             Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/gospider_$(date +%Y%m%d_%H%M%S)}
mkdir -p "$OUTPUT"

echo "======================================"
echo "   GHOST GOSPIDER v1.0                 "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Depth: $DEPTH"
echo ""

if command -v gospider &> /dev/null; then
    gospider -s "$TARGET" \
        -d "$DEPTH" \
        -c "$CONCURRENCY" \
        -o "$OUTPUT" \
        --json
    
    echo "[+] Results saved to: $OUTPUT"
    echo "[*] Found $(find "$OUTPUT" -type f | wc -l) files"
else
    echo "[!] gospider not found"
    echo "[*] Installing gospider..."
    GO111MODULE=on go install github.com/jaeles-project/gospider@latest
    GOBIN=$(go env GOPATH)/bin
    export PATH=$PATH:$GOBIN
    gospider -s "$TARGET" -d "$DEPTH" -o "$OUTPUT" --json
fi
