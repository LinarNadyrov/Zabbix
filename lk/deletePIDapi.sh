#!/bin/bash
PID=`ps -eaf | grep 'NAME_PID' | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID"
  kill $PID
fi
