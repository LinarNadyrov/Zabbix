#!/bin/sh
path_dir=/opt/scripts/zabbix/mail_search/
path_log=log_of_db.txt
cd $path_dir
touch ./$path_log
mysql -N -u root pbcm -e "SELECT unix_timestamp(e.send_date_time+TIMEDIFF(NOW(), UTC_TIMESTAMP)) as send_date  from emailman e join email_addr_bean_rel ebr on ebr.bean_id = e.related_id  join email_addresses ea on ebr.email_address_id = ea.id  where ebr.primary_address  and ea.email_address in ('crmmonitoringvc@yandex.ru','crmmonitoringvc@gmail.com')  and e.send_date_time + interval 165 minute - now() < 0 order by e.send_date_time desc limit 1;"  > ./$path_log
chown zabbix:root ./$path_log
exit 0
