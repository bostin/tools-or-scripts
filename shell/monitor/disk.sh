#!/bin/bash

DISK_USAGE_LIMIT=90

DISK_USAGE=$(df -h | grep '/dev/vda1' | sed 's/  */ /g' | cut -d ' ' -f 5 | sed 's/%//g')

if [ "$DISK_USAGE" -gt "$DISK_USAGE_LIMIT" ]; then
	echo "磁盘空间不足警告" | mail -s "空间已超过${DISK_USAGE_LIMIT}%" -t wangbo78978@126.com
	echo 'Email Send';
else
	echo 'Everything is ok';
fi
