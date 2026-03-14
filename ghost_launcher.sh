#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLS_DIR="$SCRIPT_DIR/tools"

show_main_menu() {
    clear
    echo "=============================================="
    echo "       GHOST TOOLKIT LAUNCHER v2.0          "
    echo "=============================================="
    echo ""
    echo "  [N]  Network Tools"
    echo "  [W]  Web Security Tools"
    echo "  [P]  Password Attacks"
    echo "  [E]  Exploitation Tools"
    echo "  [F]  Forensics & OSINT"
    echo "  [U]  Utilities"
    echo "  [G]  Ghost Repos (joemunene-by)"
    echo "  [M]  System Monitor"
    echo "  [D]  Disk Usage"
    echo "  [UPD] Update All Tools"
    echo "  [0]  Exit"
    echo "=============================================="
    echo -n "  Select category: "
}

show_network_menu() {
    clear
    echo "=============================================="
    echo "         NETWORK TOOLS                      "
    echo "=============================================="
    echo "  [1]  Nmap Pro (Fast/Full/Stealth/Vuln)"
    echo "  [2]  Directory Scanner (dirb/gobuster)"
    echo "  [3]  SSL/TLS Analyzer"
    echo "  [4]  Subdomain Enumerator"
    echo "  [5]  Advanced Port Scanner"
    echo "  [6]  DNS Lookup & Domain Intelligence"
    echo "  [7]  Network Traffic Analyzer"
    echo "  [0]  Back to Main Menu"
    echo "=============================================="
    echo -n "  Select tool: "
}

show_web_menu() {
    clear
    echo "=============================================="
    echo "       WEB SECURITY TOOLS                   "
    echo "=============================================="
    echo "  [1]  SQL Injection (sqlmap)"
    echo "  [2]  Web Vulnerability Scanner (nikto)"
    echo "  [3]  Port Scanner (Web UI)"
    echo "  [4]  Vulnerability Scanner"
    echo "  [5]  Simple Vulnerabilities Scanner"
    echo "  [0]  Back to Main Menu"
    echo "=============================================="
    echo -n "  Select tool: "
}

show_password_menu() {
    clear
    echo "=============================================="
    echo "       PASSWORD ATTACKS                     "
    echo "=============================================="
    echo "  [1]  Hydra Bruteforce"
    echo "  [2]  Hash Identifier"
    echo "  [3]  Hash Cracker (Dictionary)"
    echo "  [4]  MAC Spoofer"
    echo "  [0]  Back to Main Menu"
    echo "=============================================="
    echo -n "  Select tool: "
}

show_exploit_menu() {
    clear
    echo "=============================================="
    echo "       EXPLOITATION TOOLS                   "
    echo "=============================================="
    echo "  [1]  Reverse Shell Generator"
    echo "  [2]  Payload Encoder"
    echo "  [3]  Keylogger"
    echo "  [4]  SentinelPulse Dashboard"
    echo "  [0]  Back to Main Menu"
    echo "=============================================="
    echo -n "  Select tool: "
}

show_forensics_menu() {
    clear
    echo "=============================================="
    echo "       FORENSICS & OSINT                     "
    echo "=============================================="
    echo "  [1]  Image Forensics"
    echo "  [2]  Steganography Tool"
    echo "  [3]  Metadata Scrubber"
    echo "  [4]  Caesar Cipher Tool"
    echo "  [0]  Back to Main Menu"
    echo "=============================================="
    echo -n "  Select tool: "
}

show_utilities_menu() {
    clear
    echo "=============================================="
    echo "           UTILITIES                          "
    echo "=============================================="
    echo "  [1]  Password Generator"
    echo "  [2]  Network Recon"
    echo "  [3]  Hash Calculator"
    echo "  [4]  Base64 Encoder/Decoder"
    echo "  [0]  Back to Main Menu"
    echo "=============================================="
    echo -n "  Select tool: "
}

show_ghost_menu() {
    clear
    echo "=============================================="
    echo "       GHOST REPOS (joemunene-by)            "
    echo "=============================================="
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
    echo "  [13] Ghost Dashboard v4"
    echo "  [14] Simple Vulnerabilities Scanner"
    echo "  [15] AI Coding Assistant"
    echo "  [0]  Back to Main Menu"
    echo "=============================================="
    echo -n "  Select tool: "
}

launch_network_tool() {
    case $1 in
        1) bash "$TOOLS_DIR/network/ghost_nmap.sh" ;;
        2) bash "$TOOLS_DIR/network/ghost_dirb.sh" ;;
        3) bash "$TOOLS_DIR/network/ghost_ssl.sh" ;;
        4) bash "$TOOLS_DIR/network/ghost_subdomain.sh" ;;
        5) cd ~/ghost_toolkit/advanced-port-scanner && python3 main.py ;;
        6) cd ~/ghost_toolkit/DNS-Lookup-and-Domain-Intelligence-Tool && python3 main.py ;;
        7) cd ~/ghost_toolkit/Network-Traffic-Analyzer && sudo python3 main.py ;;
    esac
}

launch_web_tool() {
    case $1 in
        1) bash "$TOOLS_DIR/web/ghost_sqlmap.sh" ;;
        2) bash "$TOOLS_DIR/web/ghost_nikto.sh" ;;
        3) cd ~/ghost_toolkit/Port-scanner && npm start ;;
        4) cd ~/ghost_toolkit/Vulnerabilities-Scanner && python3 main.py ;;
        5) cd ~/ghost_toolkit/Simple-Vulnerabilities-Scanner && python3 main.py ;;
    esac
}

launch_password_tool() {
    case $1 in
        1) bash "$TOOLS_DIR/password/ghost_hydra.sh" ;;
        2) bash "$TOOLS_DIR/password/ghost_hashid.sh" ;;
        3) cd ~/ghost_toolkit/Hash-Cracker-Dictionary-Brute- && python3 main.py ;;
        4) cd ~/ghost_toolkit/mac-spoofer && sudo python3 main.py ;;
    esac
}

launch_exploit_tool() {
    case $1 in
        1) bash "$TOOLS_DIR/exploitation/ghost_shell.sh" ;;
        2) bash "$TOOLS_DIR/exploitation/ghost_encoder.sh" ;;
        3) cd ~/ghost_toolkit/Key-logger && sudo python3 main.py ;;
        4) cd ~/ghost_toolkit/sentinelpulse && npm run dev ;;
    esac
}

launch_forensics_tool() {
    case $1 in
        1) bash "$TOOLS_DIR/forensics/ghost_forensics.sh" ;;
        2) cd ~/ghost_toolkit/Steganography-tool && python3 main.py ;;
        3) cd ~/ghost_toolkit/metadata-scrubber-tool && npm start ;;
        4) cd ~/ghost_toolkit/Caesa-Cipher-Tool && python3 main.py ;;
    esac
}

launch_utility_tool() {
    case $1 in
        1) bash "$TOOLS_DIR/utilities/ghost_passgen.sh" ;;
        2) bash "$TOOLS_DIR/utilities/ghost_recon.sh" menu ;;
    esac
}

launch_ghost_tool() {
    case $1 in
        1) cd ~/ghost_toolkit/Port-scanner && npm start ;;
        2) cd ~/ghost_toolkit/advanced-port-scanner && python3 main.py ;;
        3) cd ~/ghost_toolkit/Hash-Cracker-Dictionary-Brute- && python3 main.py ;;
        4) cd ~/ghost_toolkit/mac-spoofer && sudo python3 main.py ;;
        5) cd ~/ghost_toolkit/sentinelpulse && npm run dev ;;
        6) cd ~/ghost_toolkit/Steganography-tool && python3 main.py ;;
        7) cd ~/ghost_toolkit/Network-Traffic-Analyzer && sudo python3 main.py ;;
        8) cd ~/ghost_toolkit/metadata-scrubber-tool && npm start ;;
        9) cd ~/ghost_toolkit/Caesa-Cipher-Tool && python3 main.py ;;
        10) cd ~/ghost_toolkit/Vulnerabilities-Scanner && python3 main.py ;;
        11) cd ~/ghost_toolkit/DNS-Lookup-and-Domain-Intelligence-Tool && python3 main.py ;;
        12) cd ~/ghost_toolkit/Key-logger && sudo python3 main.py ;;
        13) cd ~/ghost_toolkit/ghost-dashboard-v4 && python3 main.py ;;
        14) cd ~/ghost_toolkit/Simple-Vulnerabilities-Scanner && python3 main.py ;;
        15) cd ~/ghost_toolkit/ai-coding-assistant && npm start ;;
    esac
}

while true; do
    show_main_menu
    read choice
    
    case $choice in
        N|n)
            while true; do
                show_network_menu
                read net_choice
                [ "$net_choice" = "0" ] && break
                launch_network_tool "$net_choice"
                echo ""; echo "Press Enter to continue..."; read
            done
            ;;
        W|w)
            while true; do
                show_web_menu
                read web_choice
                [ "$web_choice" = "0" ] && break
                launch_web_tool "$web_choice"
                echo ""; echo "Press Enter to continue..."; read
            done
            ;;
        P|p)
            while true; do
                show_password_menu
                read pass_choice
                [ "$pass_choice" = "0" ] && break
                launch_password_tool "$pass_choice"
                echo ""; echo "Press Enter to continue..."; read
            done
            ;;
        E|e)
            while true; do
                show_exploit_menu
                read exp_choice
                [ "$exp_choice" = "0" ] && break
                launch_exploit_tool "$exp_choice"
                echo ""; echo "Press Enter to continue..."; read
            done
            ;;
        F|f)
            while true; do
                show_forensics_menu
                read for_choice
                [ "$for_choice" = "0" ] && break
                launch_forensics_tool "$for_choice"
                echo ""; echo "Press Enter to continue..."; read
            done
            ;;
        U|u)
            while true; do
                show_utilities_menu
                read util_choice
                [ "$util_choice" = "0" ] && break
                launch_utility_tool "$util_choice"
                echo ""; echo "Press Enter to continue..."; read
            done
            ;;
        G|g)
            while true; do
                show_ghost_menu
                read ghost_choice
                [ "$ghost_choice" = "0" ] && break
                launch_ghost_tool "$ghost_choice"
                echo ""; echo "Press Enter to continue..."; read
            done
            ;;
        M|m)
            bash "$SCRIPT_DIR/ghost_monitor.sh"
            ;;
        D|d)
            bash "$SCRIPT_DIR/diskwarn2.sh"
            ;;
        UPD|upd|update)
            bash "$SCRIPT_DIR/ghost_update.sh"
            echo ""; echo "Press Enter to continue..."; read
            ;;
        0)
            echo "Goodbye, Ghost. 👻"
            exit 0
            ;;
        *)
            echo "[-] Invalid option"
            ;;
    esac
done
