#!/bin/bash

DISK_USAGE=$(df -ht | grep -v Filesystem)
DISK_THRESHOLD=2 # IN PROJECT WE KEEP ITS AS 75

while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTITION=$(echo $line | awk '{print $7}')
   if [ $USAGE -ge $DISK_THRESHOLD ]; then
   echo "High usage on $PARTITON: $USAGE"
   fi
done <<< $DISK_USAGE