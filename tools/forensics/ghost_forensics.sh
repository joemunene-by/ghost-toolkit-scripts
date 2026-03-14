#!/bin/bash

FILE=""
EXTRACT=false
# shellcheck disable=SC2034
BRUTE=false
OUTPUT=""

# shellcheck disable=SC2034
while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--file) FILE="$2"; shift 2 ;;
        -e|--extract) EXTRACT=true; shift ;;
        -b|--brute) BRUTE=true; shift ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -f <file> [options]"
            echo ""
            echo "Options:"
            echo "  -f, --file <file>     Image file to analyze"
            echo "  -e, --extract         Extract hidden data"
            echo "  -b, --brute          Brute force passphrases"
            echo "  -o, --output <dir>   Output directory"
            echo "  -h, --help           Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$FILE" ] && { echo "[!] File required"; exit 1; }
[ ! -f "$FILE" ] && { echo "[!] File not found: $FILE"; exit 1; }

OUTPUT=${OUTPUT:-./extracted}
mkdir -p "$OUTPUT"

echo "======================================"
echo "   GHOST IMAGE FORENSICS v1.0        "
echo "======================================"
echo "[*] File: $FILE"
echo ""

echo "[*] File signature analysis..."
file "$FILE"
echo ""

echo "[*] Checking for EXIF data..."
if command -v exiftool &> /dev/null; then
    exiftool "$FILE"
elif command -v identify &> /dev/null; then
    identify -verbose "$FILE"
else
    echo "[*] Installing imagemagick for EXIF..."
    sudo apt install -y imagemagick
    identify -verbose "$FILE"
fi
echo ""

echo "[*] Searching for hidden data..."
strings "$FILE" | grep -i "steg\|hidden\|secret\|password" | head -20
echo ""

if [ "$EXTRACT" = true ]; then
    echo "[*] Extracting hidden data..."
    
    if command -v steghide &> /dev/null; then
        steghide extract -sf "$FILE" -p "" -xf "$OUTPUT/extracted.txt" 2>/dev/null || \
        steghide extract -sf "$FILE" -xf "$OUTPUT/extracted.txt" 2>/dev/null
        [ -f "$OUTPUT/extracted.txt" ] && echo "[+] Extracted to: $OUTPUT/extracted.txt"
    fi
    
    if command -v binwalk &> /dev/null; then
        echo "[*] Running binwalk..."
        binwalk -e "$FILE" -C "$OUTPUT"
    fi
    
    if command -v foremost &> /dev/null; then
        echo "[*] Running foremost..."
        foremost -i "$FILE" -o "$OUTPUT/foremost"
    fi
fi

echo ""
echo "[+] Analysis complete!"
