#!/bin/bash

TARGET=""
CMS="all"

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--target) TARGET="$2"; shift 2 ;;
        -c|--cms) CMS="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 -t <target> [options]"
            echo ""
            echo "Options:"
            echo "  -t, --target <url>       Target URL"
            echo "  -c, --cms <cms>          cms: drupal, joomla, moodle, wordpress, silverstripe"
            echo "  -h, --help              Show this help"
            exit 0 ;;
        *) shift ;;
    esac
done

[ -z "$TARGET" ] && { echo "[!] Target required"; exit 1; }

echo "======================================"
echo "   GHOST CMS SCANNER v1.0             "
echo "======================================"
echo "[*] Target: $TARGET"
echo ""

if command -v droopescan &> /dev/null; then
    droopescan scan "$CMS" -u "$TARGET" -o json
elif [ "$CMS" = "drupal" ] || [ "$CMS" = "joomla" ]; then
    echo "[*] Droopescan not found. Testing common paths..."
    
    case $CMS in
        drupal)
            curl -s "${TARGET}/CHANGELOG.txt" | head -5
            curl -s "${TARGET}/sites/default/settings.php" | head -3
            ;;
        joomla)
            curl -s "${TARGET}/administrator/manifests/files/joomla.xml" | head -5
            ;;
    esac
else
    echo "[!] Install droopescan: pip3 install droopescan"
fi

echo ""
echo "[+] Scan complete!"
