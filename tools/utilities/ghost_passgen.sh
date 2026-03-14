#!/bin/bash

LENGTH=16
COUNT=1
NUMBERS=true
SPECIAL=true

while [[ $# -gt 0 ]]; do
    case $1 in
        -l|--length) LENGTH="$2"; shift 2 ;;
        -c|--count) COUNT="$2"; shift 2 ;;
        -n|--no-numbers) NUMBERS=false; shift ;;
        -s|--no-special) SPECIAL=false; shift ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -l, --length <num>    Password length (default: 16)"
            echo "  -c, --count <num>     Number of passwords (default: 1)"
            echo "  -n, --no-numbers      Exclude numbers"
            echo "  -s, --no-special      Exclude special characters"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

echo "======================================"
echo "   GHOST PASSWORD GENERATOR v1.0     "
echo "======================================"

CHARS="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
[ "$NUMBERS" = true ] && CHARS="${CHARS}0123456789"
[ "$SPECIAL" = true ] && CHARS="${CHARS}!@#$%^&*()_+-=[]{}|;:,.<>?"

echo ""

for _i in $(seq 1 $COUNT); do
    PASSWORD=""
    for _j in $(seq 1 $LENGTH); do
        PASSWORD="${PASSWORD}${CHARS:$((RANDOM % ${#CHARS})):1}"
    done
    echo "$PASSWORD"
done

echo ""
echo "[*] Length: $LENGTH | Numbers: $NUMBERS | Special: $SPECIAL"
