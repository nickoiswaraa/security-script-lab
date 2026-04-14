#!/bin/bash

LOG="../logs/auth.log"

echo "=== ANALISIS IP ==="

awk '{print $1}' $LOG | sort | uniq -c | while read count ip
do
    if [ $count -ge 20 ]; then
        echo "WARNING: IP $ip melakukan $count request (mencurigakan)"
    else
        echo "Normal: $ip ($count request)"
    fi
done