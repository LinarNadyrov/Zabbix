1) Мониторинг производится со стороннего сервера (например monitoring.mydomain.ru)
2) Загружаем шаблон "SSL Cert Expiration.xml" и применяем к этому серверу
3) key for zabbix agent:
   /etc/zabbix/zabbix_agentd.d/ssl.conf
4) content file ssl.conf:
UserParameter=ssl.check[*],/etc/zabbix/scripts/check_ssl.sh $1 $2
Timeout=20
5) scripts file:
   check_ssl.sh
6) название серверов добавляется в file
/etc/zabbix/scripts/ssl_https.txt 
/etc/zabbix/scripts/ssl_smtp.txt
