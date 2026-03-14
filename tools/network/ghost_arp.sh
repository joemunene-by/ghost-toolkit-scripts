#!/bin/bash

INTERFACE=""
SUBNET=""
MODE="scan"

while [[ $# -gt 0 ]]; do
    case $1 in
        -i|--interface) INTERFACE="$2"; shift 2 ;;
        -s|--subnet) SUBNET="$2"; shift 2 ;;
        -m|--mode) MODE="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -i, --interface <iface>    Network interface"
            echo "  -s, --subnet <subnet>      Subnet (e.g., 192.168.1.0/24)"
            echo "  -m, --mode <mode>          scan|quick|aggressive"
            echo "  -h, --help                  Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$INTERFACE" ] && INTERFACE=$(ip route | grep default | awk '{print $5}' | head -1)
[ -z "$SUBNET" ] && SUBNET=$(ip route | grep default | awk '{print $3}' | head -1 | sed 's/\.[0-9]*$/.*/')

mkdir -p ~/ghost_toolkit/scans

echo "======================================"
echo "   GHOST ARP SCANNER v1.0            "
echo "======================================"
echo "[*] Interface: $INTERFACE"
echo "[*] Subnet: $SUBNET/24"
echo ""

case $MODE in
    quick)
        echo "[*] Quick scan..."
        arp-scan -I "$INTERFACE" -l 2>/dev/null | grep -v "^Starting\|^Interface\|^Ending\|^ packets" | tee ~/ghost_toolkit/scans/arp_quick_$(date +%Y%m%d_%H%M%S).txt
        ;;
    aggressive)
        echo "[*] Aggressive scan (including vendor lookup)..."
        arp-scan -I "$INTERFACE" -l --vendormacs 2>/dev/null | tee ~/ghost_toolkit/scans/arp_aggressive_$(date +%Y%m%d_%H%M%S).txt
        ;;
    scan|*)
        echo "[*] Standard scan..."
        sudo arp-scan -I "$INTERFACE" -g "$SUBNET/24" 2>/dev/null | tee ~/ghost_toolkit/scans/arp_$(date +%Y%m%d_%H%M%S).txt
        ;;
esac

echo ""
echo "[+] Scan complete!"
