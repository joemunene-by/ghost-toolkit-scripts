#!/bin/bash

echo "======================================"
echo "   GHOST NETWORK RECON v1.0           "
echo "======================================"
echo ""

discover_hosts() {
    local subnet="$1"
    echo "[*] Scanning subnet: $subnet"
    arp-scan -l --interface=$(ip route | grep default | awk '{print $5}' | head -1) 2>/dev/null || \
    nmap -sn "$subnet/24" -oG - | grep "Host:" | awk '{print $2,$3}'
}

case "${1:-menu}" in
    scan)
        discover_hosts "${2:-192.168.1}"
        ;;
    ports)
        echo "[*] Quick port scan..."
        nmap -F "${2:-localhost}"
        ;;
    dns)
        echo "[*] DNS lookup..."
        dig +short "${2:-google.com}" ANY
        ;;
    geoip)
        echo "[*] GeoIP lookup..."
        curl -s "http://ip-api.com/json/${2:-$(curl -s ifconfig.me)}"
        ;;
    headers)
        echo "[*] HTTP headers..."
        curl -I "${2:-http://localhost}"
        ;;
    whois)
        echo "[*] Whois lookup..."
        whois "${2:-google.com}"
        ;;
    *)
        echo "Usage: $0 <command> [args]"
        echo ""
        echo "Commands:"
        echo "  scan <subnet>    Discover live hosts"
        echo "  ports <host>    Quick port scan"
        echo "  dns <domain>    DNS lookup"
        echo "  geoip [ip]       GeoIP lookup"
        echo "  headers <url>   HTTP headers"
        echo "  whois <domain>  Whois lookup"
        ;;
esac
