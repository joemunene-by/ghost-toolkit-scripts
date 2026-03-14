#!/bin/bash

TARGET=""
TEMPLATES="latest"
SEVERITY="critical,high,medium"
RATE=150
OUTPUT=""
NEW_TEMPLATES=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -s|--severity) SEVERITY="$2"; shift 2 ;;
        -r|--rate) RATE="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -u|--update) NEW_TEMPLATES=true; shift ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>       Target URL"
            echo "  -s, --severity <level>   critical|high|medium|low (default: critical,high,medium)"
            echo "  -r, --rate <num>         Request rate (default: 150)"
            echo "  -o, --output <file>      Output file"
            echo "  -u, --update            Update nuclei templates"
            echo "  -h, --help              Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

OUTPUT=${OUTPUT:-~/ghost_toolkit/scans/nuclei_$(date +%Y%m%d_%H%M%S).txt}

echo "======================================"
echo "   GHOST NUCLEI SCANNER v1.0          "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Severity: $SEVERITY"
echo ""

if [ "$NEW_TEMPLATES" = true ]; then
    echo "[*] Updating nuclei templates..."
    nuclei -ut
fi

mkdir -p ~/ghost_toolkit/scans

if command -v nuclei &> /dev/null; then
    nuclei -u "$TARGET" \
        -severity "$SEVERITY" \
        -rate-limit "$RATE" \
        -json \
        -o "$OUTPUT.json" \
        -silent
    
    # Also save as text
    cat "$OUTPUT.json" | jq -r '"\(.info.name) [\(.severity)] \(.matched-at)"' > "$OUTPUT.txt"
    
    echo "[+] Results saved to: $OUTPUT"
    echo "[*] Found $(wc -l < "$OUTPUT.txt") vulnerabilities"
else
    echo "[!] nuclei not found"
    echo "[*] Installing nuclei..."
    pip3 install nuclei
    nuclei -u "$TARGET" -severity "$SEVERITY" -json -o "$OUTPUT.json"
fi
