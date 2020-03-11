#!/bin/bash
DOCKER_NAME=NAME_DOCKER_WEB
FILE=api.log
DIR=/opt/zabbix

touch $DIR/$FILE
chmod 0666 $DIR/$FILE
chown user:group $DIR/$FILE
docker exec -t $DOCKER_NAME bash -c "(sleep 1;echo -en "exit\r";sleep 1;)|telnet api 8081" > $DIR/$FILE 
exit 0
