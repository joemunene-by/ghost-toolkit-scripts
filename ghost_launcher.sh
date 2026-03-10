#!/bin/bash

show_menu() {
    clear
    echo "======================================"
    echo "      GHOST TOOLKIT LAUNCHER v1.0    "
    echo "======================================"
    echo "  [1]  Port Scanner (Web UI)"
    echo "  [2]  Advanced Port Scanner"
    echo "  [3]  Hash Cracker"
    echo "  [4]  MAC Spoofer"
    echo "  [5]  SentinelPulse Dashboard"
    echo "  [6]  Steganography Tool"
    echo "  [7]  Network Traffic Analyzer"
    echo "  [8]  Metadata Scrubber"
    echo "  [9]  Caesar Cipher Tool"
    echo "  [10] Vulnerability Scanner"
    echo "  [11] DNS & Domain Intelligence"
    echo "  [12] Keylogger"
    echo "  [0]  Exit"
    echo "======================================"
    echo -n "  Select a tool: "
}

launch_tool() {
    case $1 in
        1)
            echo "[*] Launching Port Scanner..."
            cd ~/ghost_toolkit/Port-scanner && npm start
            ;;
        2)
            echo "[*] Launching Advanced Port Scanner..."
            cd ~/ghost_toolkit/advanced-port-scanner && python3 main.py
            ;;
        3)
            echo "[*] Launching Hash Cracker..."
            cd ~/ghost_toolkit/Hash-Cracker-Dictionary-Brute- && python3 main.py
            ;;
        4)
            echo "[*] Launching MAC Spoofer..."
            cd ~/ghost_toolkit/mac-spoofer && sudo python3 main.py
            ;;
        5)
            echo "[*] Launching SentinelPulse..."
            cd ~/ghost_toolkit/sentinelpulse && npm run dev
            ;;
        6)
            echo "[*] Launching Steganography Tool..."
            cd ~/ghost_toolkit/Steganography-tool && python3 main.py
            ;;
        7)
            echo "[*] Launching Network Traffic Analyzer..."
            cd ~/ghost_toolkit/Network-Traffic-Analyzer && sudo python3 main.py
            ;;
        8)
            echo "[*] Launching Metadata Scrubber..."
            cd ~/ghost_toolkit/metadata-scrubber-tool && npm start
            ;;
        9)
            echo "[*] Launching Caesar Cipher Tool..."
            cd ~/ghost_toolkit/Caesa-Cipher-Tool && python3 main.py
            ;;
        10)
            echo "[*] Launching Vulnerability Scanner..."
            cd ~/ghost_toolkit/Vulnerabilities-Scanner && python3 main.py
            ;;
        11)
            echo "[*] Launching DNS Intelligence Tool..."
            cd ~/ghost_toolkit/DNS-Lookup-and-Domain-Intelligence-Tool && python3 main.py
            ;;
        12)
            echo "[*] Launching Keylogger..."
            cd ~/ghost_toolkit/Key-logger && sudo python3 main.py
            ;;
        0)
            echo "Goodbye, Ghost. 👻"
            exit 0
            ;;
        *)
            echo "[-] Invalid option. Try again."
            ;;
    esac
}

while true; do
    show_menu
    read choice
    launch_tool $choice
    echo ""
    echo "Press Enter to return to menu..."
    read
done
