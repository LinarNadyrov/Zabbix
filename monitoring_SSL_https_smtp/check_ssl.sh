#!/bin/bash

case "$1" in 
 https)
  case "$2" in
   discovery)
    JSON=$(for i in `cat /etc/zabbix/scripts/ssl_https.txt`; do printf "{\"{#DOMAIN_HTTPS}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
    printf "{\"data\":["
    printf "$JSON"
    printf "]}"
    ;;
   *)
    SERVER="$2"
    TIMEOUT=25
    RETVAL=0
    TIMESTAMP=`echo | date`
    CONNECTTO="$SERVER"
    echo "$SERVER" | grep -q : || CONNECTTO="$SERVER:443"
    SERVER=$(echo $SERVER | sed -e's/:.*//')
    EXPIRE_DATE=`echo | openssl s_client -connect "$CONNECTTO" -servername "$SERVER" -tlsextdebug 2>/dev/null | openssl x509 -noout -dates 2>/dev/null | grep notAfter | cut -d'=' -f2`
    if [ "$EXPIRE_DATE" = "" ] ; then
     echo "-1"
    fi
    EXPIRE_SECS=`date -d "${EXPIRE_DATE}" +%s`
    EXPIRE_TIME=$(( ${EXPIRE_SECS} - `date +%s` ))
    if test $EXPIRE_TIME -lt 0 ; then
     RETVAL=0
    else
     RETVAL=$(( ${EXPIRE_TIME} / 24 / 3600 ))
    fi
    echo ${RETVAL}
    ;;
  esac
  ;;
 smtp)
  case "$2" in
   discovery)
    JSON=$(for i in `cat /etc/zabbix/scripts/ssl_smtp.txt`; do printf "{\"{#DOMAIN_SMTP}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
    printf "{\"data\":["
    printf "$JSON"
    printf "]}"
    ;;
   *)
    SERVER="$2"
    TIMEOUT=25
    RETVAL=0
    TIMESTAMP=`echo | date`
    EXPIRE_DATE=`echo | openssl s_client -starttls smtp -connect "$SERVER":25 2>/dev/null | openssl x509 -noout -dates 2>/dev/null | grep notAfter | cut -d'=' -f2`
    EXPIRE_SECS=`date -d "${EXPIRE_DATE}" +%s`
    EXPIRE_TIME=$(( ${EXPIRE_SECS} - `date +%s` ))
    if test $EXPIRE_TIME -lt 0 ; then
     RETVAL=0
    else
     RETVAL=$(( ${EXPIRE_TIME} / 24 / 3600 ))
    fi
    echo ${RETVAL}
    ;;
  esac
  ;;
 *)
  echo "Usage: %0 https|smtp discovery|domain_name"
  ;;
esac

