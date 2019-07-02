#!/bin/bash
FreeIPA0=ipa0.domain.ru
FreeIPA1=ipa1.domain.ru
PATH_DIR=/opt/ldapsearch
access_file=root
access_dir=zabbix
access=440

ldapsearch -h $FreeIPA0 -p 389 -b "dc=domain,dc=ru" -x "(|(objectclass=inetOrgPerson))" > $PATH_DIR/ipa0.txt
ldapsearch -h $FreeIPA1 -p 389 -b "dc=domain,dc=ru" -x "(|(objectclass=inetOrgPerson))" > $PATH_DIR/ipa1.txt
chown $access_file:$access_dir $PATH_DIR/ipa0.txt
chmod $access $PATH_DIR/ipa0.txt
chown $access_file:$access_dir $PATH_DIR/ipa1.txt
chmod $access $PATH_DIR/ipa1.txt