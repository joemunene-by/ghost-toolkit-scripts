#!/bin/bash

check_disk() {
    filesystem=$1
    usage=$(df $filesystem | awk 'NR==2 {print $5}' | tr -d '%')

    if [ $usage -gt 90 ]; then
        echo "CRITICAL [$filesystem]: ${usage}% used — Clean up now!"
    elif [ $usage -gt 70 ]; then
        echo "WARNING [$filesystem]: ${usage}% used — Getting full."
    else
        echo "OK [$filesystem]: ${usage}% used — Healthy."
    fi
}

filesystems=("/mnt/c" "/" "/mnt/wsl")

for fs in "${filesystems[@]}"; do
    check_disk $fs
done
