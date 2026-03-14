#!/bin/bash

TITLE="Penetration Test Report"
CLIENT=""
TARGET=""
DATE=$(date +"%Y-%m-%d")
AUTHOR=""
OUTPUT=""
SCAN_DIR=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--title) TITLE="$2"; shift 2 ;;
        -c|--client) CLIENT="$2"; shift 2 ;;
        -a|--target) TARGET="$2"; shift 2 ;;
        -o|--output) OUTPUT="$2"; shift 2 ;;
        -s|--scans) SCAN_DIR="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [options]"
            echo ""
            echo "Options:"
            echo "  -t, --title <title>    Report title"
            echo "  -c, --client <name>   Client name"
            echo "  -a, --target <target> Target scope"
            echo "  -o, --output <file>   Output file"
            echo "  -s, --scans <dir>     Scans directory"
            echo "  -h, --help           Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

OUTPUT=${OUTPUT:-~/ghost_toolkit/reports/report_$(date +%Y%m%d).html}
SCAN_DIR=${SCAN_DIR:-~/ghost_toolkit/scans}

mkdir -p "$(dirname "$OUTPUT")"

echo "======================================"
echo "   GHOST REPORT GENERATOR v1.0        "
echo "======================================"
echo "[*] Generating report..."
echo ""

# Extract findings from scan files
FINDINGS=""
if [ -d "$SCAN_DIR" ]; then
    # Count vulnerabilities by severity
    CRITICAL=$(grep -r "critical\|CRITICAL\|Critical" "$SCAN_DIR" 2>/dev/null | wc -l)
    HIGH=$(grep -r "high\|HIGH\|High" "$SCAN_DIR" 2>/dev/null | wc -l)
    MEDIUM=$(grep -r "medium\|MEDIUM\|Medium" "$SCAN_DIR" 2>/dev/null | wc -l)
    LOW=$(grep -r "low\|LOW\|Low" "$SCAN_DIR" 2>/dev/null | wc -l)
    
    FINDINGS="<h2>Automated Scan Results</h2>
    <table>
    <tr><th>Severity</th><th>Count</th></tr>
    <tr><td><span style='color:red'>Critical</span></td><td>$CRITICAL</td></tr>
    <tr><td><span style='color:orange'>High</span></td><td>$HIGH</td></tr>
    <tr><td><span style='color:gold'>Medium</span></td><td>$MEDIUM</td></tr>
    <tr><td><span style='color:blue'>Low</span></td><td>$LOW</td></tr>
    </table>"
fi

# Generate HTML report
cat > "$OUTPUT" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$TITLE</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; line-height: 1.6; color: #333; background: #f4f4f4; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .header { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%); color: white; padding: 40px; text-align: center; }
        .header h1 { font-size: 2.5em; margin-bottom: 10px; }
        .header .meta { opacity: 0.8; margin-top: 10px; }
        .content { background: white; padding: 40px; margin-top: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { color: #1a1a2e; border-bottom: 2px solid #e74c3c; padding-bottom: 10px; margin: 30px 0 20px; }
        h3 { color: #16213e; margin: 20px 0 10px; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #1a1a2e; color: white; }
        tr:hover { background: #f5f5f5; }
        .critical { color: #e74c3c; font-weight: bold; }
        .high { color: #e67e22; font-weight: bold; }
        .medium { color: #f39c12; font-weight: bold; }
        .low { color: #3498db; }
        .info { color: #95a5a6; }
        .code { background: #2c3e50; color: #ecf0f1; padding: 15px; border-radius: 5px; overflow-x: auto; font-family: 'Courier New', monospace; }
        .footer { text-align: center; padding: 20px; color: #7f8c8d; margin-top: 40px; }
        .severity-critical { background: #e74c3c; color: white; padding: 2px 8px; border-radius: 3px; }
        .severity-high { background: #e67e22; color: white; padding: 2px 8px; border-radius: 3px; }
        .severity-medium { background: #f39c12; color: white; padding: 2px 8px; border-radius: 3px; }
        .severity-low { background: #3498db; color: white; padding: 2px 8px; border-radius: 3px; }
    </style>
</head>
<body>
    <div class="header">
        <h1>👻 $TITLE</h1>
        <div class="meta">
            <p><strong>Client:</strong> $CLIENT</p>
            <p><strong>Target:</strong> $TARGET</p>
            <p><strong>Date:</strong> $DATE</p>
            <p><strong>Author:</strong> $AUTHOR</p>
        </div>
    </div>
    
    <div class="container">
        <div class="content">
            <h2>Executive Summary</h2>
            <p>This report documents the findings of a security assessment conducted on $TARGET. The assessment was performed using a combination of automated scanning tools and manual testing techniques.</p>
            
            $FINDINGS
            
            <h2>Methodology</h2>
            <h3>Information Gathering</h3>
            <p>Passive reconnaissance was performed to gather publicly available information about the target infrastructure.</p>
            
            <h3>Scanning & Enumeration</h3>
            <p>Network scans were conducted to identify open ports, running services, and potential attack vectors.</p>
            
            <h3>Vulnerability Assessment</h3>
            <p>Automated vulnerability scanners were used to identify known vulnerabilities in exposed services.</p>
            
            <h3>Exploitation</h3>
            <p>Where authorized, exploitation attempts were made to validate the severity of identified vulnerabilities.</p>
            
            <h2>Recommendations</h2>
            <ol>
                <li>Implement critical security patches immediately</li>
                <li>Review and harden network configurations</li>
                <li>Enable logging and monitoring for all critical systems</li>
                <li>Conduct regular security assessments</li>
                <li>Implement security awareness training</li>
            </ol>
            
            <h2>Scope Limitations</h2>
            <p>This assessment was limited to the scope defined in the engagement agreement. Results should not be extrapolated to systems outside the defined scope.</p>
            
            <h2>Appendix A: Tools Used</h2>
            <ul>
                <li>Nmap - Network scanning</li>
                <li>SQLMap - SQL injection testing</li>
                <li>Nikto - Web vulnerability scanning</li>
                <li>Hydra - Password brute-forcing</li>
                <li>Metasploit - Exploitation framework</li>
                <li>Ghost Toolkit - Custom security tools</li>
            </ul>
        </div>
        
        <div class="footer">
            <p>Generated by Ghost Toolkit | $DATE</p>
            <p>© 2024 Joe Munene - For Authorized Testing Only</p>
        </div>
    </div>
</body>
</html>
EOF

echo "[+] Report generated: $OUTPUT"
echo ""
echo "[*] To view the report:"
echo "    firefox $OUTPUT"
echo "    # or"
echo "    google-chrome $OUTPUT"
