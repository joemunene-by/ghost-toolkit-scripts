#!/bin/bash

TARGET=""
WORDLIST=""
OUTPUT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--domain) TARGET="$2"; shift 2 ;;
        -w|--wordlist) WORDLIST="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -d <domain> [options]"
            echo ""
            echo "Options:"
            echo "  -d, --domain <domain>    Target domain"
            echo "  -w, --wordlist <file>    Subdomain wordlist"
            echo "  -o, --output <file>      Output file"
            echo "  -h, --help               Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Domain required"; exit 1; }

WORDLIST=${WORDLIST:-"/usr/share/wordlists/subdomains.txt"}
OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/subdomain_$(date +%Y%m%d_%H%M%S).txt}
mkdir -p ~/ghost_toolkit/scans

echo "======================================"
echo "   GHOST SUBDOMAIN ENUMERATOR v1.0   "
echo "======================================"
echo "[*] Target: $TARGET"
echo ""

if command -v subfinder &> /dev/null; then
    subfinder -d "$TARGET" -o "$OUTPUT"
elif command -v amass &> /dev/null; then
    amass enum -d "$TARGET" -o "$OUTPUT"
else
    echo "[*] Using DNS enumeration methods..."
    while read subdomain; do
        host "${subdomain}.${TARGET}" 2>/dev/null | grep "has address" && echo "${subdomain}.${TARGET}" >> "$OUTPUT"
    done < "$WORDLIST"
fi

echo ""
echo "[+] Enumeration complete! Results saved to $OUTPUT"
echo "[*] Found $(wc -l < "$OUTPUT") subdomains"
