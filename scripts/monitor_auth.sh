#!/bin/bash

LOG="../logs/auth.log"
echo "=== MONITORING LOGIN SUCCESS==="
grep  "Accepted password" $LOG

echo ""
echo "=== LOGIN GAGAL ==="
grep "Failed password" $LOG

echo ""
echo "Jumlah login gagal:"
grep "Failed password" $LOG | wc -l

echo ""
echo "=== DETEKSI BRUTE FORCE ==="

grep "Failed password" $LOG | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort | uniq -c | while read count ip
do
    if [ $count -ge 3 ]; then
        
        echo "WARNING: IP $ip melakukan $count percobaan login gagal"
    fi
done

LOG_OUT="../logs/security.log"
DATE=$(date)

echo "[$DATE] Monitoring dijalankan" >> $LOG_OUT
    