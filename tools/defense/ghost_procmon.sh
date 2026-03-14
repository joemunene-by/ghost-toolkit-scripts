#!/bin/bash

INTERVAL=2
LIMIT=50

while [[ $# -gt 0 ]]; do
    case $1 in
        -i|--interval) INTERVAL="$2"; shift 2 ;;
        -l|--limit) LIMIT="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -i, --interval <sec>   Update interval (default: 2)"
            echo "  -l, --limit <num>      Number of updates (default: 50)"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

echo "======================================"
echo "   GHOST PROCESS MONITOR v1.0         "
echo "======================================"
echo "[*] Monitoring every ${INTERVAL}s (Ctrl+C to stop)"
echo ""

count=0
while [ $count -lt $LIMIT ]; do
    clear
    echo "======================================"
    echo "   GHOST PROCESS MONITOR - $(date)"
    echo "======================================"
    echo ""
    echo "Top 15 CPU Processes:"
    ps aux --sort=-%cpu | head -16
    echo ""
    echo "Top 15 Memory Processes:"
    ps aux --sort=-%mem | head -16
    echo ""
    echo "Network Connections:"
    ss -tunap 2>/dev/null | head -10 || netstat -tunap 2>/dev/null | head -10
    echo ""
    echo "Recent Logins:"
    last -5 2>/dev/null
    
    sleep $INTERVAL
    ((count++))
done
