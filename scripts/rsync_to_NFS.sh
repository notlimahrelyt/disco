#!/bin/bash

BACKUP_DIR=/mnt/backup/
IGNORE_LIST=/tmp/ignore.txt
DATE="$(date +"%Y-%m-%d") $(date +"%H:%M:%S")"
LOG_FILE=/tmp/RSYNC_LOG.log


if [ ! -d $BACKUP_DIR ]; then

echo "$DATE - BACKUP FAILED." >> $LOG_FILE

else

echo "$DATE - BACKUP STARTED." >> $LOG_FILE

rsync -avzp --info=progress2 /mnt/data1  /mnt/backup/data1/  --exclude-from="$IGNORE_LIST" | tee /mnt/backup/data1/sync.log & 
rsync -avzp --info=progress2 /mnt/data2  /mnt/backup/data2/  --exclude-from="$IGNORE_LIST" | tee /mnt/backup/data2/sync.log &
rsync -avzp --info=progress2 /mnt/data3  /mnt/backup/data3/  --exclude-from="$IGNORE_LIST" | tee /mnt/backup/data3/sync.log &

wait

DATE="$(date +"%Y-%m-%d") $(date +"%H:%M:%S")"
echo "$DATE - BACKUP COMPLETED." >> $LOG_FILE


fi;
