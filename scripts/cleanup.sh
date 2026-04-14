#!/bin/bash

BACKUP_DIR="../backup"

# Hapus file backup lebih dari 7 hari
find $BACKUP_DIR -type f -mtime +7 -exec rm {} \;

echo "Cleanup selesai"