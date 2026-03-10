#!/bin/bash

check_disk() {
    usage=$(df /mnt/c | awk 'NR==2 {print $5}' | tr -d '%')
    
    echo "C: Drive usage is at ${usage}%"

    if [ $usage -gt 90 ]; then
        echo "WARNING: Disk critically full! Clean up your files!"
    elif [ $usage -gt 70 ]; then
        echo "NOTICE: Disk getting full. Keep an eye on it."
    else
        echo "Disk space is healthy."
    fi
}

check_disk
