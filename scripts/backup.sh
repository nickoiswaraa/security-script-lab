#!/bin/bash

SOURCE="../data"
BACKUP_DIR="../backup"
LOG="../logs/backup.log"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p $BACKUP_DIR

echo "[$DATE] Mulai backup" >> $LOG

tar -czf $BACKUP_DIR/backup_$DATE.tar.gz $SOURCE 2>> $LOG

if [ $? -eq 0 ]; then
  echo "[$DATE] Backup berhasil" >> $LOG
else
  echo "[$DATE] Backup gagal" >> $LOG
fi