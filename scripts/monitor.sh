#!/bin/bash

LOG="../logs/monitor.log"
DATE=$(date)

echo "[$DATE] Monitoring sistem..." >> $LOG

# Cek penggunaan disk
df -h >> $LOG

# Cek user login
who >> $LOG

echo "------------------------" >> $LOG