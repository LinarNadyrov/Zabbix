#!/bin/bash
DOCKER_NAME=NAME_DOCKER_DB
DB_NAME=DB
FILE=session.log
DIR=/opt/zabbix

touch $DIR/$FILE
docker exec -t $DOCKER_NAME psql -P pager=off -Upostgres -a $DB_NAME -q -c "select count(*) from http_sessions;" > $DIR/$FILE
chmod 0666 $DIR/$FILE
chown user:group $DIR/$FILE
exit 0
