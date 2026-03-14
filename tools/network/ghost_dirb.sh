#!/bin/bash

TARGET=""
WORDLIST="/usr/share/wordlists/dirb/common.txt"
THREADS=10
EXTENSIONS=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -w|--wordlist) WORDLIST="$2"; shift 2 ;;
        -e|--extensions) EXTENSIONS="$2"; shift 2 ;;
        -th|--threads) THREADS="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>      Target URL (e.g., http://example.com)"
            echo "  -w, --wordlist <file>   Wordlist to use"
            echo "  -e, --extensions        Extensions (e.g., php,html,asp)"
            echo "  -th, --threads          Number of threads (default: 10)"
            echo "  -h, --help              Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

if [ -z "$TARGET" ]; then
    echo "[!] Target is required"
    exit 1
fi

echo "======================================"
echo "     GHOST DIRECTORY SCANNER v1.0    "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Wordlist: $WORDLIST"
echo ""

mkdir -p ~/ghost_toolkit/scans

EXTRA_OPTS="-t $THREADS"
[ -n "$EXTENSIONS" ] && EXTRA_OPTS="$EXTRA_OPTS -x $EXTENSIONS"

if command -v dirb &> /dev/null; then
    echo "[*] Running dirb..."
    dirb "$TARGET" "$WORDLIST" -o "$HOME/ghost_toolkit/scans/dirb_$(date +%Y%m%d_%H%M%S).txt"
elif command -v gobuster &> /dev/null; then
    echo "[*] Running gobuster..."
    gobuster dir -u "$TARGET" -w "$WORDLIST" -t $THREADS ${EXTENSIONS:+-x $EXTENSIONS} -o "$HOME/ghost_toolkit/scans/gobuster_$(date +%Y%m%d_%H%M%S).txt"
else
    echo "[!] Neither dirb nor gobuster found!"
    echo "[*] Installing gobuster..."
    sudo apt install -y gobuster
    gobuster dir -u "$TARGET" -w "$WORDLIST" -t $THREADS ${EXTENSIONS:+-x $EXTENSIONS} -o "$HOME/ghost_toolkit/scans/gobuster_$(date +%Y%m%d_%H%M%S).txt"
fi

echo ""
echo "[+] Scan complete!"
