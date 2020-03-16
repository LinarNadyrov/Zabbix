#!/bin/sh
path_dir=/opt/scripts/zabbix/mail_search/
path_log=log_of_gmail.txt
cd $path_dir
touch $path_log
python3 ./search_mail_for_gmail.py > ./$path_log
chown zabbix:root ./$path_log
exit 0
