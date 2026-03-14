#!/bin/bash

echo "======================================"
echo "   GHOST TOOLKIT - UPDATE v1.0       "
echo "======================================"
echo ""

TOOLKIT_DIR=~/ghost_toolkit

if [ ! -d "$TOOLKIT_DIR" ]; then
    echo "[!] Toolkit not found at $TOOLKIT_DIR"
    exit 1
fi

echo "[*] Updating Ghost Toolkit..."
echo ""

echo "[*] Pulling latest from repos..."
for dir in "$TOOLKIT_DIR"/*/; do
    tool=$(basename "$dir")
    if [ -d "$dir/.git" ]; then
        echo "[*] Updating $tool..."
        git -C "$dir" pull 2>/dev/null || echo "[!] $tool: update failed"
    fi
done

echo ""
echo "[*] Updating toolkit scripts..."
cd ~/ghost_toolkit_scripts 2>/dev/null || cd "$(dirname "$0")/.."
git pull 2>/dev/null || echo "[!] Scripts: update failed"

echo ""
echo "======================================"
echo "   GHOST TOOLKIT UPDATE COMPLETE!    "
echo "======================================"
