#!/bin/bash

DISK_USAGE=$(df -ht | grep -v Filesystem)
DISK_THRESHOLD=2 # IN PROJECT WE KEEP ITS AS 75
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4 )


while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTITION=$(echo $line | awk '{print $7}')
   if [ $USAGE -ge $DISK_THRESHOLD ]; then
       MESSAGE+="High usage on $PARTITON: $USAGE % \n" # escaping

   fi
done <<< $DISK_USAGE

echo -e "Message Body: $MESSAGE"

sh mail.sh "krishnasai4208@gmail.com" "High Disk Alert" "High Disk usage" "$MESSAGE" "$IP_ADDRESS" "Devops team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5