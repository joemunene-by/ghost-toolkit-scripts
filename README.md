# Ghost Toolkit Scripts 👻

A comprehensive, world-class cybersecurity toolkit for penetration testers, security researchers, and system administrators.

## Quick Install

```bash
git clone https://github.com/joemunene-by/ghost-toolkit-scripts.git
cd ghost-toolkit-scripts
chmod +x ghost_setup.sh
./ghost_setup.sh
```

## Features

- **40+ Security Tools** across 7 categories
- **Automated Setup** - Installs dependencies and clones all repos
- **Interactive Launcher** - Categorized menu for easy access
- **One-Click Updates** - Update all tools with one command

## Scripts

| Script | Description |
|--------|-------------|
| `ghost_setup.sh` | Auto-installs dependencies and clones all Ghost toolkit repos |
| `ghost_launcher.sh` | Interactive menu to launch any tool |
| `ghost_update.sh` | Updates all tools to latest version |
| `ghost_monitor.sh` | Live system diagnostics |
| `diskwarn.sh` | Single drive disk usage monitor |
| `diskwarn2.sh` | Multi-drive disk usage monitor with alerts |

## Tool Categories

### Network Tools
- Nmap Pro - Fast/Full/Stealth/Vuln scanning
- Directory Scanner (dirb/gobuster)
- SSL/TLS Analyzer
- Subdomain Enumerator
- Advanced Port Scanner
- DNS Lookup & Domain Intelligence
- Network Traffic Analyzer

### Web Security Tools
- SQL Injection Scanner (sqlmap)
- Web Vulnerability Scanner (nikto)
- Port Scanner (Web UI)
- Vulnerability Scanner

### Password Attacks
- Hydra Bruteforce
- Hash Identifier
- Hash Cracker (Dictionary)
- MAC Spoofer

### Exploitation Tools
- Reverse Shell Generator
- Payload Encoder
- Keylogger
- SentinelPulse Dashboard

### Forensics & OSINT
- Image Forensics
- Steganography Tool
- Metadata Scrubber
- Caesar Cipher Tool

### Utilities
- Password Generator
- Network Recon
- Hash Calculator
- Base64 Encoder/Decoder

## Usage

### Basic Usage
```bash
chmod +x ghost_setup.sh
./ghost_setup.sh
./ghost_launcher.sh
```

### Individual Tools
```bash
# Network scan
./tools/network/ghost_nmap.sh -t 192.168.1.1 -s fast

# SQL injection
./tools/web/ghost_sqlmap.sh -t "http://target.com/page.php?id=1" --dbs

# Reverse shell
./tools/exploitation/ghost_shell.sh -l 10.10.10.10 -p 4444 -s python

# Password generator
./tools/utilities/ghost_passgen.sh -l 20 -c 5

# Hash identification
./tools/password/ghost_hashid.sh -h 5d41402abc4b2a76b9719d911017c592
```

## Tool Options

### ghost_nmap.sh
```bash
-t, --target <ip/host>    Target to scan
-p, --port <ports>        Port range
-s, --scan-type           fast|full|stealth|udp|xmas|service|vuln
```

### ghost_sqlmap.sh
```bash
-t, --target <url>        Target URL
-l, --level <1-5>        Scan level
-r, --risk <1-3>         Risk level
--dbs                    Enumerate databases
--tables                 Enumerate tables
--dump                   Dump data
```

### ghost_hydra.sh
```bash
-t, --target <host>       Target host
-u, --user <username>    Single username
-U, --userlist <file>    Username wordlist
-p, --password <pass>    Single password
-P, --passlist <file>    Password wordlist
-s, --service <svc>      ssh|ftp|http|mysql|rdp
```

### ghost_shell.sh
```bash
-l, --lhost <ip>         Listener IP
-p, --lport <port>       Listener port
-s, --shell <type>       bash|python|perl|ruby|php|nc|powershell
-e, --encoding           none|base64|url
```

### ghost_passgen.sh
```bash
-l, --length <num>       Password length (default: 16)
-c, --count <num>        Number of passwords
-n, --no-numbers         Exclude numbers
-s, --no-special         Exclude special characters
```

## Ghost Repositories

This toolkit automatically clones and manages these repositories:

- Port-scanner (Web UI)
- Advanced Port Scanner
- Hash Cracker
- MAC Spoofer
- SentinelPulse
- Steganography-tool
- Network-Traffic-Analyzer
- metadata-scrubber-tool
- Caesa-Cipher-Tool
- Vulnerabilities-Scanner
- DNS-Lookup-and-Domain-Intelligence-Tool
- Key-logger
- ghost-dashboard-v4
- Simple-Vulnerabilities-Scanner
- ai-coding-assistant

## Requirements

### System Packages
- git, nodejs, npm, python3, pip3
- nmap, sqlmap, nikto, hydra
- steghide, binwalk, exiftool

### Install All Dependencies
```bash
sudo apt update && sudo apt install -y \
    git nodejs npm python3 pip3 curl wget \
    nmap sqlmap nikto hydra john \
    steghide binwalk exiftool foremost \
    imagemagick sslscan gobuster
```

## Directory Structure

```
ghost-toolkit-scripts/
├── ghost_setup.sh
├── ghost_launcher.sh
├── ghost_update.sh
├── ghost_monitor.sh
├── diskwarn.sh
├── diskwarn2.sh
├── tools/
│   ├── network/
│   │   ├── ghost_nmap.sh
│   │   ├── ghost_dirb.sh
│   │   ├── ghost_ssl.sh
│   │   └── ghost_subdomain.sh
│   ├── web/
│   │   ├── ghost_sqlmap.sh
│   │   └── ghost_nikto.sh
│   ├── password/
│   │   ├── ghost_hydra.sh
│   │   └── ghost_hashid.sh
│   ├── exploitation/
│   │   ├── ghost_shell.sh
│   │   └── ghost_encoder.sh
│   ├── forensics/
│   │   └── ghost_forensics.sh
│   └── utilities/
│       ├── ghost_passgen.sh
│       └── ghost_recon.sh
└── README.md
```

## Warning

⚠️ **For authorized security testing only!** Always obtain proper permission before scanning or testing any system you do not own.

## License

MIT License

## Author

Joe Munene (@joemunene-by)
