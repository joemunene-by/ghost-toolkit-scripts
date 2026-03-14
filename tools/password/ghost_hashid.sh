#!/bin/bash

HASH=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--hash) HASH="$2"; shift 2 ;;
        -f|--file) 
            while IFS= read -r line; do
                hashes+=("$line")
            done < "$2"
            shift 2
            ;;
        -H|--help)
            echo "Usage: $0 -h <hash> [options]"
            echo ""
            echo "Options:"
            echo "  -h, --hash <hash>     Hash to identify"
            echo "  -f, --file <file>     File with hashes (one per line)"
            echo "  -h, --help            Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

echo "======================================"
echo "   GHOST HASH IDENTIFIER v1.0        "
echo "======================================"

identify_hash() {
    local h="$1"
    local len=${#h}
    
    echo ""
    echo "[*] Analyzing: $h"
    echo "[*] Length: $len"
    
    case $len in
        32)
            if [[ $h =~ ^[a-fA-F0-9]{32}$ ]]; then
                echo "[+] Possible: MD5, MD4, NTML, MD2"
            fi
            ;;
        40)
            if [[ $h =~ ^[a-fA-F0-9]{40}$ ]]; then
                echo "[+] Possible: SHA1, RIPEMD160"
            fi
            ;;
        56)
            if [[ $h =~ ^[a-fA-F0-9]{56}$ ]]; then
                echo "[+] Possible: SHA224, SHA3-224"
            fi
            ;;
        64)
            if [[ $h =~ ^[a-fA-F0-9]{64}$ ]]; then
                echo "[+] Possible: SHA256, SHA3-256, GOST"
            fi
            ;;
        96)
            if [[ $h =~ ^[a-fA-F0-9]{96}$ ]]; then
                echo "[+] Possible: SHA384, SHA3-384"
            fi
            ;;
        128)
            if [[ $h =~ ^[a-fA-F0-9]{128}$ ]]; then
                echo "[+] Possible: SHA512, SHA3-512, WHIRLPOOL"
            fi
            ;;
        60)
            if [[ $h =~ ^\$[a-z]\$\$ ]]; then
                echo "[+] Possible: bcrypt"
            fi
            ;;
        *)
            echo "[-] Unknown hash format"
            ;;
    esac
    
    if [[ $h =~ ^\$1\$ ]]; then
        echo "[+] Identified: MD5crypt"
    elif [[ $h =~ ^\$2[ay]\$\ ]]; then
        echo "[+] Identified: bcrypt"
    elif [[ $h =~ ^\$5\$ ]]; then
        echo "[+] Identified: SHA256crypt"
    elif [[ $h =~ ^\$6\$ ]]; then
        echo "[+] Identified: SHA512crypt"
    fi
}

if [ -n "$HASH" ]; then
    identify_hash "$HASH"
elif [ ${#hashes[@]} -gt 0 ]; then
    for h in "${hashes[@]}"; do
        identify_hash "$h"
    done
else
    echo "[!] No hash provided"
    echo "Usage: $0 -h <hash>"
fi

echo ""
echo "[*] Use hashcat or john for cracking"
echo "    hashcat -m <mode> hash.txt wordlist.txt"
echo "    john --format=<format> hash.txt --wordlist=wordlist.txt"
