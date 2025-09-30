#!/bin/bash

DISK_USAGE=$(df -ht | grep -v Filesystem)

while IFS= read -r line
do
   echo "Line: $line"
done <<< $DISK_USAGE