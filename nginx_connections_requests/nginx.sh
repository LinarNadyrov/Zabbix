#!/bin/bash

##### PARAMETERS #####
METRIC="$1"
STATSURL="$2"

if [ "$METRIC" = "" ] ; then
 echo "Usage: $0 metric [statsurl]"
 exit 1
fi
if [ "$STATSUTL" = "" ] ; then
 STATSURL="http://127.0.0.1:81/nginx-status"
fi

#
CURL="/usr/bin/curl"
TTLCACHE="55"
FILECACHE="/tmp/zabbix.nginx.`echo $STATSURL | md5sum | cut -d" " -f1`.cache"
TIMENOW=`date '+%s'`
##### RUN #####
if [ -s "$FILECACHE" ]; then
 TIMECACHE=`stat -c"%Y" "$FILECACHE"`
else
 TIMECACHE=0
fi
if [ "$(($TIMENOW - $TIMECACHE))" -gt "$TTLCACHE" ]; then
# echo "" >> $FILECACHE # !!!
 DATACACHE=`$CURL --insecure -s "$STATSURL"` || exit 1
 flock -n $FILECACHE echo "$DATACACHE" > $FILECACHE
fi
if [ "$METRIC" = "active" ]; then
 cat $FILECACHE | grep "Active connections" | cut -d':' -f2
fi
if [ "$METRIC" = "accepts" ]; then
 cat $FILECACHE | sed -n '3p' | cut -d" " -f2
fi
if [ "$METRIC" = "handled" ]; then
 cat $FILECACHE | sed -n '3p' | cut -d" " -f3
fi
if [ "$METRIC" = "requests" ]; then
 cat $FILECACHE | sed -n '3p' | cut -d" " -f4
fi
if [ "$METRIC" = "reading" ]; then
 cat $FILECACHE | grep "Reading" | cut -d':' -f2 | cut -d' ' -f2
fi
if [ "$METRIC" = "writing" ]; then
 cat $FILECACHE | grep "Writing" | cut -d':' -f3 | cut -d' ' -f2
fi
if [ "$METRIC" = "waiting" ]; then
 cat $FILECACHE | grep "Waiting" | cut -d':' -f4 | cut -d' ' -f2
fi
#
exit 0

