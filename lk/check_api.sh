#!/bin/bash
DOCKER_NAME=NAME_DOCKER_WEB
FILE=api.log
DIR=/opt/zabbix

touch $DIR/$FILE
docker exec -t $DOCKER_NAME telnet api 8081 > $DIR/$FILE
chmod 0666 $DIR/$FILE
chown user:group $DIR/$FILE
exit 0
