#!/bin/bash

TARGET=""
# shellcheck disable=SC2034
PORT=""
SCAN_TYPE="fast"

# shellcheck disable=SC2034
while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -p|--port) PORT="$2"; shift 2 ;;
        -s|--scan-type)
            case $2 in
                fast|full|stealth|udp|xmas|service| vuln) SCAN_TYPE="$2" ;;
                *) echo "[!] Unknown scan type: $2"; exit 1 ;;
            esac
            shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <ip/host>    Target to scan"
            echo "  -p, --port <ports>        Port range (e.g., 1-1000, 80,443)"
            echo "  -s, --scan-type <type>    Scan type:"
            echo "       fast        - Quick scan (top 100 ports)"
            echo "       full        - Full port scan (1-65535)"
            echo "       stealth     - SYN stealth scan"
            echo "       udp         - UDP scan"
            echo "       xmas        - Xmas scan"
            echo "       service     - Service version detection"
            echo "       vuln        - Vulnerability scan"
            echo "  -h, --help               Show this help"
            exit 0 ;;
        *) echo "[!] Unknown option: $1"; exit 1 ;;
    esac
done

if [ -z "$TARGET" ]; then
    echo "[!] Target is required"
    echo "Usage: $0 -t <target> [-s scan-type] [-p ports]"
    exit 1
fi

echo "======================================"
echo "       GHOST NMAP PRO v1.0           "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Scan type: $SCAN_TYPE"
echo ""

case $SCAN_TYPE in
    fast)
        echo "[*] Running fast scan..."
        nmap -T4 -F -oN "$HOME/ghost_toolkit/scans/nmap_fast_$(date +%Y%m%d_%H%M%S).txt" "$TARGET"
        ;;
    full)
        echo "[*] Running full port scan..."
        nmap -p- -oN "$HOME/ghost_toolkit/scans/nmap_full_$(date +%Y%m%d_%H%M%S).txt" "$TARGET"
        ;;
    stealth)
        echo "[*] Running stealth SYN scan..."
        sudo nmap -sS -T2 -oN "$HOME/ghost_toolkit/scans/nmap_stealth_$(date +%Y%m%d_%H%M%S).txt" "$TARGET"
        ;;
    udp)
        echo "[*] Running UDP scan..."
        sudo nmap -sU -oN "$HOME/ghost_toolkit/scans/nmap_udp_$(date +%Y%m%d_%H%M%S).txt" "$TARGET"
        ;;
    xmas)
        echo "[*] Running Xmas scan..."
        sudo nmap -sX -oN "$HOME/ghost_toolkit/scans/nmap_xmas_$(date +%Y%m%d_%H%M%S).txt" "$TARGET"
        ;;
    service)
        echo "[*] Running service detection scan..."
        nmap -sV -sC -oN "$HOME/ghost_toolkit/scans/nmap_service_$(date +%Y%m%d_%H%M%S).txt" "$TARGET"
        ;;
    vuln)
        echo "[*] Running vulnerability scan..."
        nmap --script vuln -oN "$HOME/ghost_toolkit/scans/nmap_vuln_$(date +%Y%m%d_%H%M%S).txt" "$TARGET"
        ;;
esac

echo ""
echo "[+] Scan complete! Results saved to ~/ghost_toolkit/scans/"
