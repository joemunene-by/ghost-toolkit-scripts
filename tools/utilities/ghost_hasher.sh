#!/bin/bash

FILE=""
ALGO="sha256"

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--file) FILE="$2"; shift 2 ;;
        -a|--algo) ALGO="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -f <file> [options]"
            echo ""
            echo "Options:"
            echo "  -f, --file <file>       File to hash"
            echo "  -a, --algo <algo>       md5|sha1|sha256|sha512|all"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$FILE" ] && { echo "[!] File required"; exit 1; }
[ ! -f "$FILE" ] && { echo "[!] File not found: $FILE"; exit 1; }

echo "======================================"
echo "   GHOST FILE HASHER v1.0             "
echo "======================================"
echo "[*] File: $FILE"
echo ""

case $ALGO in
    md5)
        echo "MD5:    $(md5sum "$FILE" | awk '{print $1}')"
        ;;
    sha1)
        echo "SHA1:   $(sha1sum "$FILE" | awk '{print $1}')"
        ;;
    sha256)
        echo "SHA256: $(sha256sum "$FILE" | awk '{print $1}')"
        ;;
    sha512)
        echo "SHA512: $(sha512sum "$FILE" | awk '{print $1}')"
        ;;
    all)
        echo "MD5:    $(md5sum "$FILE" | awk '{print $1}')"
        echo "SHA1:   $(sha1sum "$FILE" | awk '{print $1}')"
        echo "SHA256: $(sha256sum "$FILE" | awk '{print $1}')"
        echo "SHA512: $(sha512sum "$FILE" | awk '{print $1}')"
        ;;
esac
