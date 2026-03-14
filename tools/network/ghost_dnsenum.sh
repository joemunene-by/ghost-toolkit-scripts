#!/bin/bash

TARGET=""
WORDLIST="/usr/share/wordlists/dns.txt"
BRUTE=false
TRANSFER=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--domain) TARGET="$2"; shift 2 ;;
        -w|--wordlist) WORDLIST="$2"; shift 2 ;;
        -b|--brute) BRUTE=true; shift ;;
        -t|--transfer) TRANSFER=true; shift ;;
        -h|--help)
            echo "Usage: $0 -d <domain> [options]"
            echo ""
            echo "Options:"
            echo "  -d, --domain <domain>    Target domain"
            echo "  -w, --wordlist <file>   Wordlist"
            echo "  -b, --brute             Brute force subdomains"
            echo "  -t, --transfer          Test zone transfer"
            echo "  -h, --help              Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Domain required"; exit 1; }

mkdir -p ~/ghost_toolkit/scans

echo "======================================"
echo "   GHOST DNS ENUMERATOR v1.0          "
echo "======================================"
echo "[*] Target: $TARGET"
echo ""

OUTPUT=~/ghost_toolkit/scans/dns_$(date +%Y%m%d_%H%M%S).txt

echo "[*] DNS records lookup..."
dig axfr "$TARGET" @$TARGET 2>/dev/null | tee "$OUTPUT" || echo "[*] Zone transfer failed"

echo ""
echo "[*] NS servers..."
dig ns "$TARGET" +short

echo ""
echo "[*] MX servers..."
dig mx "$TARGET" +short

echo ""
echo "[*] TXT records..."
dig txt "$TARGET" +short

if [ "$BRUTE" = true ]; then
    echo ""
    echo "[*] Brute forcing subdomains..."
    while read sub; do
        result=$(dig +short "${sub}.${TARGET}" A)
        [ -n "$result" ] && echo "${sub}.${TARGET}: $result" >> "$OUTPUT"
    done < "$WORDLIST"
fi

echo ""
echo "[+] Results saved to: $OUTPUT"
