#!/bin/bash

MEMFILE=""
PROFILE=""
COMMAND=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--memory) MEMFILE="$2"; shift 2 ;;
        -p|--profile) PROFILE="$2"; shift 2 ;;
        -c|--command) COMMAND="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -m <memory_dump> [options]"
            echo ""
            echo "Options:"
            echo "  -m, --memory <file>      Memory dump file"
            echo "  -p, --profile <profile>  Volatility profile (e.g., Win10x64_19041)"
            echo "  -c, --command <cmd>      volatility command"
            echo "  -h, --help              Show this help"
            echo ""
            echo "Examples:"
            echo "  $0 -m memory.raw -c pslist"
            echo "  $0 -m memory.raw -p Win10x64_19041 -c netscan"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$MEMFILE" ] && { echo "[!] Memory dump required"; exit 1; }
[ ! -f "$MEMFILE" ] && { echo "[!] File not found: $MEMFILE"; exit 1; }

echo "======================================"
echo "   GHOST VOLATILITY v1.0              "
echo "======================================"
echo "[*] Memory: $MEMFILE"
echo ""

if ! command -v vol3 &> /dev/null && ! command -v volatility &> /dev/null; then
    echo "[!] Volatility not found"
    echo "[*] Install: pip3 install volatility3"
    exit 1
fi

if [ -z "$PROFILE" ]; then
    echo "[*] Detecting profile..."
    if command -v vol3 &> /dev/null; then
        PROFILE=$(vol3 -f "$MEMFILE" windows.info 2>/dev/null | grep "Profile" | awk '{print $2}')
    fi
    [ -z "$PROFILE" ] && PROFILE="Win10x64_19041"
fi

echo "[*] Profile: $PROFILE"
echo ""

if [ -n "$COMMAND" ]; then
    if command -v vol3 &> /dev/null; then
        vol3 -f "$MEMFILE" -p "$PROFILE" "$COMMAND"
    else
        volatility -f "$MEMFILE" --profile="$PROFILE" "$COMMAND"
    fi
else
    echo "[*] Available commands:"
    echo "  pslist          - List processes"
    echo "  netscan         - Network connections"
    echo "  malfind         - Find malicious processes"
    echo "  hivelist        - Registry hives"
    echo "  cmdline         - Command line history"
    echo "  consoles        - Console history"
    echo "  filescan        - File scanner"
    echo ""
    echo "Usage: $0 -m memory.raw -c pslist"
fi
