#!/bin/bash

echo "======================================"
echo "   GHOST AUTO-UPDATER v1.0           "
echo "======================================"
echo ""

GHOST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UPDATE_AVAILABLE=false

echo "[*] Checking for updates..."
echo ""

# Check GitHub for updates
cd "$GHOST_DIR" || exit 1

# Fetch latest
git fetch origin 2>/dev/null

# Compare versions
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    UPDATE_AVAILABLE=true
    echo "[!] Update available!"
    echo "    Local:   $LOCAL"
    echo "    Remote:  $REMOTE"
else
    echo "[+] You have the latest version"
fi

echo ""

# Check for tool updates
echo "[*] Checking installed tools..."

# Check git repos
if [ -d "$HOME/ghost_toolkit" ]; then
    echo ""
    echo "[*] Checking Ghost repos for updates..."
    cd "$HOME/ghost_toolkit" || exit 1
    
    for repo in */; do
        if [ -d "$repo/.git" ]; then
            repo_name="${repo%/}"
            git -C "$repo" fetch origin 2>/dev/null
            
            LOCAL_REPO=$(git -C "$repo" rev-parse HEAD)
            REMOTE_REPO=$(git -C "$repo" rev-parse origin/main 2>/dev/null)
            
            if [ "$LOCAL_REPO" != "$REMOTE_REPO" ] && [ -n "$REMOTE_REPO" ]; then
                echo "    [!] $repo_name has updates"
            fi
        fi
    done
fi

echo ""

# Check for tool installations
echo "[*] Checking for security tools..."

REQUIRED_TOOLS=(
    "nmap"
    "sqlmap"
    "nikto"
    "hydra"
    "masscan"
    "john"
    "steghide"
    "binwalk"
)

MISSING=()
for tool in "${REQUIRED_TOOLS[@]}"; do
    if ! command -v "$tool" &> /dev/null; then
        MISSING+=("$tool")
    fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
    echo "[!] Missing tools: ${MISSING[*]}"
    echo "    Run: sudo apt install ${MISSING[*]}"
else
    echo "[+] All required tools installed"
fi

echo ""

# Check for Go tools
echo "[*] Checking Go-based tools..."

GO_TOOLS=(
    "nuclei"
    "dalfox"
    "gospider"
)

for tool in "${GO_TOOLS[@]}"; do
    if ! command -v "$tool" &> /dev/null; then
        echo "    [!] $tool not installed"
    fi
done

echo ""

# Summary
echo "======================================"
if [ "$UPDATE_AVAILABLE" = true ]; then
    echo "[!] Updates available!"
    echo ""
    echo "To update, run:"
    echo "    cd $GHOST_DIR"
    echo "    git pull origin main"
else
    echo "[+] Everything is up to date!"
fi
echo "======================================"
