#!/bin/bash

echo "======================================"
echo "   GHOST SYNC - Auto Git Push v1.0   "
echo "======================================"
echo ""

SUCCESS=0
FAILED=0
SKIPPED=0

sync_repo() {
    local repo_path=$1
    local repo_name=$(basename $repo_path)

    echo "[*] Checking $repo_name..."

    # Check if it's actually a git repo
    if [ ! -d "$repo_path/.git" ]; then
        echo "[~] Skipping $repo_name — not a git repo"
        ((SKIPPED++))
        return
    fi

    cd $repo_path

    # Check if there's anything to commit
    if git diff --quiet && git diff --cached --quiet; then
        echo "[=] $repo_name — nothing to commit, checking for unpushed commits..."

        # Check for unpushed commits
        LOCAL=$(git rev-parse HEAD)
        REMOTE=$(git rev-parse @{u} 2>/dev/null)

        if [ "$LOCAL" = "$REMOTE" ]; then
            echo "[✓] $repo_name — already up to date"
            ((SKIPPED++))
            return
        fi
    fi

    # Stage all changes
    git add -A

    # Commit with timestamp
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "ghost_sync: auto-update [$TIMESTAMP]" 2>/dev/null

    # Push
    if git push 2>/dev/null; then
        echo "[+] $repo_name — pushed successfully ✓"
        ((SUCCESS++))
    else
        echo "[-] $repo_name — push FAILED (check auth or remote)"
        ((FAILED++))
    fi

    cd ~
}

# Sync all ghost toolkit repos
for repo in ~/ghost_toolkit/*/; do
    sync_repo $repo
done

# Also sync the scripts repo itself
sync_repo ~/ghost-toolkit-scripts

echo ""
echo "======================================"
echo "   SYNC COMPLETE"
echo "======================================"
echo "  ✓ Pushed:  $SUCCESS repos"
echo "  = Skipped: $SKIPPED repos (no changes)"
echo "  ✗ Failed:  $FAILED repos"
echo "======================================"
