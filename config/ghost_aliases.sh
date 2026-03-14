#!/bin/bash
# Ghost Toolkit Shell Aliases
# Add to ~/.bashrc or ~/.zshrc: source /path/to/ghost_aliases.sh

# ===== Quick Commands =====

# Network scanning
alias gnmap='~/ghost_toolkit_scripts/tools/network/ghost_nmap.sh'
alias gmasscan='~/ghost_toolkit_scripts/tools/network/ghost_masscan.sh'
alias garp='~/ghost_toolkit_scripts/tools/network/ghost_arp.sh'
alias gdirb='~/ghost_toolkit_scripts/tools/network/ghost_dirb.sh'
alias gssl='~/ghost_toolkit_scripts/tools/network/ghost_ssl.sh'
alias gsub='~/ghost_toolkit_scripts/tools/network/ghost_subdomain.sh'
alias gdns='~/ghost_toolkit_scripts/tools/network/ghost_dnsenum.sh'

# Web security
alias gsql='~/ghost_toolkit_scripts/tools/web/ghost_sqlmap.sh'
alias gnikto='~/ghost_toolkit_scripts/tools/web/ghost_nikto.sh'
alias gwhatweb='~/ghost_toolkit_scripts/tools/web/ghost_whatweb.sh'
alias gwpscan='~/ghost_toolkit_scripts/tools/web/ghost_wpscan.sh'
alias gcms='~/ghost_toolkit_scripts/tools/web/ghost_cms.sh'
alias gnuclei='~/ghost_toolkit_scripts/tools/web/ghost_nuclei.sh'
alias gdalfox='~/ghost_toolkit_scripts/tools/web/ghost_dalfox.sh'
alias ggospider='~/ghost_toolkit_scripts/tools/web/ghost_gospider.sh'

# Password attacks
alias ghydra='~/ghost_toolkit_scripts/tools/password/ghost_hydra.sh'
alias ghashid='~/ghost_toolkit_scripts/tools/password/ghost_hashid.sh'
alias gwifi='~/ghost_toolkit_scripts/tools/password/ghost_wifi.sh'

# Exploitation
alias gshell='~/ghost_toolkit_scripts/tools/exploitation/ghost_shell.sh'
alias gencode='~/ghost_toolkit_scripts/tools/exploitation/ghost_encoder.sh'
alias gmsf='~/ghost_toolkit_scripts/tools/exploitation/ghost_msf.sh'
alias gresponder='~/ghost_toolkit_scripts/tools/exploitation/ghost_responder.sh'
alias glinpeas='~/ghost_toolkit_scripts/tools/exploitation/ghost_linpeas.sh'
alias gsearch='~/ghost_toolkit_scripts/tools/exploitation/ghost_searchsploit.sh'
alias gpspy='~/ghost_toolkit_scripts/tools/exploitation/ghost_pspy.sh'

# Forensics
alias gforensics='~/ghost_toolkit_scripts/tools/forensics/ghost_forensics.sh'
alias gstrings='~/ghost_toolkit_scripts/tools/forensics/ghost_strings.sh'
alias gvol='~/ghost_toolkit_scripts/tools/forensics/ghost_volatility.sh'

# Defense
alias gprocmon='~/ghost_toolkit_scripts/tools/defense/ghost_procmon.sh'
alias glogwatch='~/ghost_toolkit_scripts/tools/defense/ghost_logwatch.sh'
alias gintegrity='~/ghost_toolkit_scripts/tools/defense/ghost_integrity.sh'

# Utilities
alias gpassgen='~/ghost_toolkit_scripts/tools/utilities/ghost_passgen.sh'
alias grecon='~/ghost_toolkit_scripts/tools/utilities/ghost_recon.sh'
alias ghasher='~/ghost_toolkit_scripts/tools/utilities/ghost_hasher.sh'
alias gportknock='~/ghost_toolkit_scripts/tools/utilities/ghost_portknock.sh'
alias gtor='~/ghost_toolkit_scripts/tools/utilities/ghost_tor.sh'
alias gones='~/ghost_toolkit_scripts/tools/utilities/ghost_oneliners.sh'
alias greport='~/ghost_toolkit_scripts/tools/utilities/ghost_report.sh'

# ===== Main Scripts =====
alias ghost='~/ghost_toolkit_scripts/ghost_launcher.sh'
alias ghost-setup='~/ghost_toolkit_scripts/ghost_setup.sh'
alias ghost-update='~/ghost_toolkit_scripts/ghost_update.sh'
alias ghost-monitor='~/ghost_toolkit_scripts/ghost_monitor.sh'

# ===== Quick Nmap Scans =====
alias nmap-fast='nmap -T4 -F'
alias nmap-full='nmap -p-'
alias nmap-stealth='sudo nmap -sS -T2'
alias nmap-vuln='nmap --script vuln'
alias nmap-service='nmap -sV -sC'

# ===== Common Pentest Commands =====
alias msfconsole='msfconsole -q'
alias msfvenom-payload='msfvenom -p'
alias searchsploit-update='sudo searchsploit --update'

# ===== Wordlists =====
export GHOST_WORDLISTS=/usr/share/wordlists/SecLists
alias wl-subdomains='$GHOST_WORDLISTS/Discovery/DNS/subdomains-top1million-5000.txt'
alias wl-passwords='$GHOST_WORDLISTS/Passwords/Leaked-Databases/rockyou.txt'
alias wl-directory='$GHOST_WORDLISTS/Discovery/Web-Content/common.txt'

# ===== Directories =====
export GHOST_HOME=~/ghost_toolkit
export GHOST_SCANS=$GHOST_HOME/scans
export GHOST_PAYLOADS=$GHOST_HOME/payloads
export GHOST_REPORTS=$GHOST_HOME/reports

# ===== Functions =====
ghost-quick-scan() {
    nmap -T4 -F "$1" -oN "$GHOST_SCANS/nmap_quick_$(date +%Y%m%d).txt"
}

ghost-full-scan() {
    nmap -p- -sV -sC -oN "$GHOST_SCANS/nmap_full_$(date +%Y%m%d).txt" "$1"
}

ghost-web-scan() {
    echo "[*] Running nikto..."
    nikto -h "$1" -o "$GHOST_SCANS/nikto_$(date +%Y%m%d).txt"
    echo "[*] Running nuclei..."
    nuclei -u "$1" -severity critical,high,medium -json -o "$GHOST_SCANS/nuclei_$(date +%Y%m%d).json"
}

ghost-shell() {
    local lhost="${1:-$(curl -s ifconfig.me)}"
    local lport="${2:-4444}"
    ~/ghost_toolkit_scripts/tools/exploitation/ghost_shell.sh -l "$lhost" -p "$lport" -s bash
}

# ===== Git Shortcuts =====
alias gstatus='git status'
alias gadd='git add'
alias gcommit='git commit -m'
alias gpush='git push'
alias gpull='git pull'

# ===== Docker =====
alias ghost-docker='~/ghost_toolkit_scripts/docker-ghost.sh'
alias ghost-docker-build='~/ghost_toolkit_scripts/docker-ghost.sh build'
alias ghost-docker-run='~/ghost_toolkit_scripts/docker-ghost.sh run'
