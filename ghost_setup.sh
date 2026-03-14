#!/bin/bash

echo "======================================"
echo "   GHOST TOOLKIT - AUTO SETUP v2.0   "
echo "======================================"
echo "Setting up your environment..."
echo ""

check_dependencies() {
    echo "[*] Checking dependencies..."

    tools=("git" "nodejs" "npm" "python3" "pip3" "curl" "wget" "nmap" "sqlmap" "nikto" "hydra" "john" "steghide" "binwalk" "exiftool" "foremost")

    missing=()
    for tool in "${tools[@]}"; do
        if command -v $tool &> /dev/null; then
            echo "[+] $tool is installed"
        else
            echo "[-] $tool is MISSING — adding to install list..."
            missing+=("$tool")
        fi
    done

    if [ ${#missing[@]} -gt 0 ]; then
        echo "[*] Installing missing tools..."
        sudo apt update && sudo apt install -y "${missing[@]}"
    fi
    echo ""
}

clone_repos() {
    echo "[*] Cloning Ghost Toolkit repositories..."
    mkdir -p ~/ghost_toolkit
    cd ~/ghost_toolkit || exit

    repos=(
        "https://github.com/joemunene-by/Port-scanner"
        "https://github.com/joemunene-by/Hash-Cracker-Dictionary-Brute-"
        "https://github.com/joemunene-by/mac-spoofer"
        "https://github.com/joemunene-by/sentinelpulse"
        "https://github.com/joemunene-by/Steganography-tool"
        "https://github.com/joemunene-by/Network-Traffic-Analyzer"
        "https://github.com/joemunene-by/metadata-scrubber-tool"
        "https://github.com/joemunene-by/Caesa-Cipher-Tool"
        "https://github.com/joemunene-by/Vulnerabilities-Scanner"
        "https://github.com/joemunene-by/DNS-Lookup-and-Domain-Intelligence-Tool"
        "https://github.com/joemunene-by/Key-logger"
        "https://github.com/joemunene-by/advanced-port-scanner"
        "https://github.com/joemunene-by/ghost-dashboard-v4"
        "https://github.com/joemunene-by/Simple-Vulnerabilities-Scanner"
        "https://github.com/joemunene-by/ai-coding-assistant"
    )

    for repo in "${repos[@]}"; do
        repo_name=$(basename $repo)
        if [ -d "$repo_name" ]; then
            echo "[~] $repo_name already exists, pulling latest..."
            git -C "$repo_name" pull 2>/dev/null || echo "[!] $repo_name pull failed, skipping..."
        else
            echo "[+] Cloning $repo_name..."
            git clone --quiet "$repo" 2>/dev/null || echo "[!] Failed to clone $repo_name"
        fi
    done
    echo ""
}

install_dependencies() {
    echo "[*] Auto-installing dependencies for all tools..."

    for dir in ~/ghost_toolkit/*/; do
        tool=$(basename $dir)
        echo "[*] Checking $tool..."

        if [ -f "$dir/requirements.txt" ]; then
            echo "[+] Python project detected — installing pip deps..."
            pip3 install -r $dir/requirements.txt --break-system-packages
        fi

        if [ -f "$dir/package.json" ]; then
            echo "[+] Node project detected — running npm install..."
            cd "$dir" && npm install && cd ~/ghost_toolkit || exit
        fi
    done
    echo ""
}

finish() {
    echo "======================================"
    echo "   GHOST TOOLKIT SETUP COMPLETE!     "
    echo "======================================"
    echo ""
    echo "Your tools are ready at: ~/ghost_toolkit"
    echo ""
    echo "Run ./ghost_launcher.sh to start (coming soon)"
}

check_dependencies
clone_repos
install_dependencies
finish
