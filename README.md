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

- **60+ Security Tools** across 8 categories
- **Automated Setup** - Installs dependencies and clones all repos
- **Interactive Launcher** - Categorized menu for easy access
- **One-Click Updates** - Update all tools with one command

## Scripts

| Script | Description |
|--------|-------------|
| `ghost_setup.sh` | Auto-installs dependencies and clones all Ghost toolkit repos |
| `ghost_launcher.sh` | Interactive menu to launch any tool (60+ tools) |
| `ghost_update.sh` | Updates all tools to latest version |
| `ghost_monitor.sh` | Live system diagnostics |
| `diskwarn.sh` | Single drive disk usage monitor |
| `diskwarn2.sh` | Multi-drive disk usage monitor with alerts |

## Tool Categories

### Network Tools (9)
| Tool | Description |
|------|-------------|
| Nmap Pro | Fast/Full/Stealth/Vuln scanning |
| Masscan | Ultra-fast port scanner |
| ARP Scanner | Local network discovery |
| Directory Scanner | dirb/gobuster wrapper |
| SSL/TLS Analyzer | Certificate analysis |
| Subdomain Enumerator | Brute force subdomains |
| DNS Enumerator | Zone transfer & enumeration |
| Advanced Port Scanner | joemunene-by repo |
| DNS Lookup & Domain Intelligence | joemunene-by repo |

### Web Security Tools (7)
| Tool | Description |
|------|-------------|
| SQL Injection | sqlmap wrapper |
| Web Vulnerability Scanner | nikto wrapper |
| CMS Scanner | droopescan for Drupal/Joomla |
| WhatWeb | CMS fingerprinting |
| WPScan | WordPress scanner |
| Port Scanner (Web UI) | joemunene-by repo |
| Vulnerability Scanner | joemunene-by repo |

### Password Attacks (5)
| Tool | Description |
|------|-------------|
| Hydra Bruteforce | Multi-service brute force |
| Hash Identifier | Identify hash types |
| Hash Cracker | Dictionary attack |
| MAC Spoofer | Randomize MAC address |
| WiFi Tool | Handshake capture & monitoring |

### Exploitation Tools (6)
| Tool | Description |
|------|-------------|
| Reverse Shell Generator | Multiple shell types |
| Payload Encoder | Base64/XOR/URL encoding |
| Metasploit Helper | msfconsole & msfvenom |
| Responder | LLMNR/NBT-NS spoofing |
| LinPEAS | Linux privilege escalation |
| Keylogger | joemunene-by repo |

### Forensics & OSINT (6)
| Tool | Description |
|------|-------------|
| Image Forensics | EXIF, stego detection |
| Strings Analyzer | Binary analysis |
| Volatility | Memory forensics |
| Steganography Tool | joemunene-by repo |
| Metadata Scrubber | joemunene-by repo |
| Caesar Cipher Tool | joemunene-by repo |

### Defense & Monitoring (3)
| Tool | Description |
|------|-------------|
| Process Monitor | Live process/network monitoring |
| Log Watcher | Real-time log alerting |
| File Integrity | Tripwire-style checker |

### Utilities (7)
| Tool | Description |
|------|-------------|
| Password Generator | Secure passwords |
| Network Recon | DNS/GeoIP/Whois |
| File Hasher | MD5/SHA256/ALL |
| Port Knocker | Port knocking daemon |
| Tor Setup | Install & configure Tor |
| Pentest Oneliners | 50+ ready-to-use commands |
| Base64 Converter | Encode/decode |

## Ghost Repositories (15)

This toolkit automatically clones:
- Port-scanner, Advanced Port Scanner, Hash Cracker
- MAC Spoofer, SentinelPulse, Steganography-tool
- Network-Traffic-Analyzer, Metadata Scrubber
- Caesar Cipher Tool, Vulnerabilities-Scanner
- DNS-Lookup-and-Domain-Intelligence-Tool
- Key-logger, ghost-dashboard-v4
- Simple-Vulnerabilities-Scanner, ai-coding-assistant

## Usage

### Launcher
```bash
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

# Generate payload
./tools/exploitation/ghost_msf.sh payload linux/x64/shell_reverse_tcp lhost 10.10.10.10 lport 4445

# Password generator
./tools/utilities/ghost_passgen.sh -l 20 -c 5

# Hash identification
./tools/password/ghost_hashid.sh -h 5d41402abc4b2a76b9719d911017c592

# Pentest oneliners
./tools/utilities/ghost_oneliners.sh -c nmap_fast

# Process monitor
./tools/defense/ghost_procmon.sh -i 2 -l 100
```

## Requirements

### Install All Dependencies
```bash
sudo apt update && sudo apt install -y \
    git nodejs npm python3 pip3 curl wget \
    nmap masscan sqlmap nikto hydra john \
    steghide binwalk exiftool foremost \
    imagemagick sslscan gobuster responder \
    aircrack-ng reaver cowpatty \
    tor proxychains
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
│   │   ├── ghost_masscan.sh
│   │   ├── ghost_arp.sh
│   │   ├── ghost_dirb.sh
│   │   ├── ghost_ssl.sh
│   │   ├── ghost_subdomain.sh
│   │   └── ghost_dnsenum.sh
│   ├── web/
│   │   ├── ghost_sqlmap.sh
│   │   ├── ghost_nikto.sh
│   │   ├── ghost_cms.sh
│   │   ├── ghost_whatweb.sh
│   │   └── ghost_wpscan.sh
│   ├── password/
│   │   ├── ghost_hydra.sh
│   │   ├── ghost_hashid.sh
│   │   └── ghost_wifi.sh
│   ├── exploitation/
│   │   ├── ghost_shell.sh
│   │   ├── ghost_encoder.sh
│   │   ├── ghost_msf.sh
│   │   ├── ghost_responder.sh
│   │   └── ghost_linpeas.sh
│   ├── forensics/
│   │   ├── ghost_forensics.sh
│   │   ├── ghost_strings.sh
│   │   └── ghost_volatility.sh
│   ├── defense/
│   │   ├── ghost_procmon.sh
│   │   ├── ghost_logwatch.sh
│   │   └── ghost_integrity.sh
│   └── utilities/
│       ├── ghost_passgen.sh
│       ├── ghost_recon.sh
│       ├── ghost_hasher.sh
│       ├── ghost_portknock.sh
│       ├── ghost_tor.sh
│       └── ghost_oneliners.sh
└── README.md
```

## Warning

⚠️ **For authorized security testing only!** Always obtain proper permission before scanning or testing any system you do not own.

## License

MIT License

## Author

Joe Munene (@joemunene-by)
