#!/bin/bash

HOST=""
PORTS=""
METHOD="tcp"

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--host) HOST="$2"; shift 2 ;;
        -p|--ports) PORTS="$2"; shift 2 ;;
        -m|--method) METHOD="$2"; shift 2 ;;
        --help)
            echo "Usage: $0 -h <host> -p <ports> [options]"
            echo ""
            echo "Options:"
            echo "  -h, --host <ip>         Target host"
            echo "  -p, --ports <ports>     Ports (comma or range: 7000,8000,9000)"
            echo "  -m, --method <method>   tcp|udp"
            echo "  --help                 Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$HOST" ] && { echo "[!] Host required"; exit 1; }
[ -z "$PORTS" ] && { echo "[!] Ports required"; exit 1; }

echo "======================================"
echo "   GHOST PORT KNOCKER v1.0            "
echo "======================================"
echo "[*] Host: $HOST"
echo "[*] Ports: $PORTS"
echo "[*] Method: $METHOD"
echo ""

if command -v nc &> /dev/null; then
    for port in $(echo "$PORTS" | tr ',' ' '); do
        echo "[*] Knocking port $port..."
        if [ "$METHOD" = "udp" ]; then
            nc -uz "$HOST" "$port" 2>/dev/null
        else
            nc -zw 1 "$HOST" "$port" 2>/dev/null
        fi
        sleep 0.5
    done
    echo "[+] Done!"
elif command -v knock &> /dev/null; then
    knock "$HOST" "$PORTS" -"$METHOD"
else
    echo "[!] nc or knock not found"
    echo "[*] Trying nmap..."
    for port in $(echo "$PORTS" | tr ',' ' '); do
        nmap -p "$port" -host-timeout 1s "$HOST" 2>/dev/null | grep -q "open" && echo "[*] Port $port is open"
    done
fi
