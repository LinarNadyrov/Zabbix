#!/bin/sh
method=GetInfoForFailedRequests
startdate=`date +"%Y-%m-%d 00:00:00"`
curdate=`date +"%Y-%m-%d %H:%M:%S"`
wget -q -O - "http://localhost:8080/gdsProxy/Monitoring/$method?startPeriodTime=$startdate&endPeriodTime=$curdate"
#wget -o /root/test_file http://localhost:8080/gdsProxy/Monitoring/$method?startPeriodTime=$startdate&endPeriodTime=$curdate
echo ""
