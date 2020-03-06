#!/bin/bash
DOCKER_NAME=NAME_DOCKER_WEB
DB_NAME=DB
IPA_SRV=LDAP_SRV
IPA_PORT=PORT
FILE=check_ldap.log
DIR=/opt/zabbix

touch $DIR/$FILE
docker exec -t $DOCKER_NAME ldapsearch -h $IPA_SRV -p $IPA_PORT -b "dc=domain,dc=ru" -x "(|(objectclass=inetOrgPerson))" | grep "numResponses:" > $DIR/$FILE
chmod 0666 $DIR/$FILE
chown user:group $DIR/$FILE
exit 0
