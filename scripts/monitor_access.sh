#!/bin/bash

LOG="../logs/auth.log"

echo "=== JUMLAH REQUEST PER IP ==="

awk '{print $1}' $LOG | sort | uniq -c