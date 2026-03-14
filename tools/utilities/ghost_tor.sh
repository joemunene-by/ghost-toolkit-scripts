#!/bin/bash

ACTION=""
PORT=9050
# shellcheck disable=SC2034
IP=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -a|--action) ACTION="$2"; shift 2 ;;
        -p|--port) PORT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -a, --action <action>   install|start|stop|status|ip"
            echo "  -p, --port <port>       SOCKS port (default: 9050)"
            echo "  -h, --help             Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$ACTION" ] && ACTION="status"

echo "======================================"
echo "   GHOST TOR SETUP v1.0               "
echo "======================================"
echo ""

case $ACTION in
    install)
        echo "[*] Installing Tor..."
        sudo apt update && sudo apt install -y tor
        echo "[*] Configuring Tor..."
        sudo sed -i 's/#SocksPort/SocksPort/g' /etc/tor/torrc
        sudo sed -i "s/SocksPort 9050/SocksPort $PORT/g" /etc/tor/torrc
        echo "[+] Tor installed and configured on port $PORT"
        ;;
    start)
        echo "[*] Starting Tor..."
        sudo service tor start
        sleep 2
        sudo service tor status
        ;;
    stop)
        echo "[*] Stopping Tor..."
        sudo service tor stop
        ;;
    status)
        if pgrep -x "tor" > /dev/null; then
            echo "[+] Tor is running"
            ss -tlnp | grep "$PORT"
        else
            echo "[-] Tor is not running"
        fi
        ;;
    ip)
        echo "[*] Checking IP via Tor..."
        if pgrep -x "tor" > /dev/null; then
            curl --socks5 localhost:$PORT -s https://api.ipify.org
            echo ""
        else
            echo "[-] Tor is not running. Start with: $0 -a start"
        fi
        ;;
    *)
        echo "[!] Unknown action: $ACTION"
        ;;
esac
