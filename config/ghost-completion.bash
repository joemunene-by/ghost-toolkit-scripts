# Ghost Toolkit Shell Completion for Bash

_ghost_tools() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Main commands
    local main_cmds="ghost_setup ghost_launcher ghost_update ghost_monitor diskwarn diskwarn2"
    
    # Tool categories
    local network="nmap masscan arp dirb ssl subdomain dnsenum"
    local web="sqlmap nikto cms whatweb wpscan nuclei dalfox gospider"
    local password="hydra hashid wifi"
    local exploitation="shell encoder msf responder linpeas searchsploit pspy"
    local forensics="forensics strings volatility"
    local defense="procmon logwatch integrity"
    local utilities="passgen recon hasher portknock tor oneliners report"
    
    # Network tool options
    local nmap_opts="-t --target -p --port -s --scan-type"
    local masscan_opts="-t --target -p --ports -r --rate"
    local sqlmap_opts="-t --target -l --level -r --risk --dbs --tables --columns --dump"
    local shell_opts="-l --lhost -p --lport -s --shell -e --encoding"
    
    # Main options
    local global_opts="-h --help -v --version"
    
    case "${prev}" in
        ghost_setup|ghost_launcher|ghost_update|ghost_monitor)
            COMPREPLY=($(compgen -W "-h --help" -- ${cur}))
            return 0
            ;;
        ghost_nmap|./ghost_nmap)
            COMPREPLY=($(compgen -W "${nmap_opts}" -- ${cur}))
            return 0
            ;;
        ghost_masscan)
            COMPREPLY=($(compgen -W "${masscan_opts}" -- ${cur}))
            return 0
            ;;
        ghost_sqlmap|sqlmap)
            COMPREPLY=($(compgen -W "${sqlmap_opts}" -- ${cur}))
            return 0
            ;;
        ghost_shell)
            COMPREPLY=($(compgen -W "${shell_opts}" -- ${cur}))
            return 0
            ;;
        -t|--target|-p|--port|-l|--lhost)
            return 0
            ;;
        -s|--scan-type|-s|--shell)
            case "${prev}" in
                ghost_nmap|ghost_nmap.sh)
                    COMPREPLY=($(compgen -W "fast full stealth udp xmas service vuln" -- ${cur}))
                    ;;
                ghost_shell)
                    COMPREPLY=($(compgen -W "bash python perl ruby php nc powershell msfvenom" -- ${cur}))
                    ;;
            esac
            return 0
            ;;
        *)
            # Complete with tools
            COMPREPLY=($(compgen -W "${main_cmds} ${network} ${web} ${password} ${exploitation} ${forensics} ${defense} ${utilities}" -- ${cur}))
            ;;
    esac
    
    return 0
}

complete -F _ghost_tools ghost_nmap ghost_masscan ghost_sqlmap ghost_shell
complete -F _ghost_tools ./ghost_nmap.sh ./ghost_masscan.sh ./ghost_sqlmap.sh ./ghost_shell.sh
