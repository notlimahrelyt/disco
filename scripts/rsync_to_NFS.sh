#!/bin/bash

LOG_DIR=/tmp/SYNC_ERROR.log
BACKUP_DIR=/mnt/backup/
IGNORE_LIST=/tmp/ignore.txt
DATE=$(date +"%Y%m%d")_$(date +"%H%M%S")



if [ ! -d $BACKUP_DIR ]; then

echo "$DATE - Backup Directory was not found." >> $LOG_DIR

else

rsync -avzp --info=progress2 /mnt/data1  /mnt/backup/data1/  --exclude-from="$IGNORE_LIST" | tee /mnt/backup/data1/sync.log & 
rsync -avzp --info=progress2 /mnt/data2  /mnt/backup/data2/  --exclude-from="$IGNORE_LIST" | tee /mnt/backup/data2/sync.log &
rsync -avzp --info=progress2 /mnt/data3  /mnt/backup/data3/  --exclude-from="$IGNORE_LIST" | tee /mnt/backup/data3/sync.log &

fi;
