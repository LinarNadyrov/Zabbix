#### Мониторинг запросов (requst) и обратбока их данных 
#### Протестирован на 
    - Ubuntu 16.04.5 LTS 
    - Zabbix agent версии 3.4.15 (zabbix_agentd -V)
    - glassfish-4.1.1
#### Файл 
    - requestGetInfo.conf - конфиг. файл 
    - requestGetInfo.sh - опрос с необходимыми параметрами 
    - MPIS.xml - готовый шаблон для zabbix сервера версии 4.0.4
#### Для того, чтобы мониторинг заработал нужно 
    - файл `equestGetInfo.conf` скопировать `/etc/zabbix/zabbix_agentd.conf.d/`
    - файл `requestGetInfo.sh` скопировать `/etc/zabbix/plugins/requestGetInfo.sh`
    - перезагрузить zabbix agent 
    (можно проверить получение данные zabbix_agentd -t requestGetInfo)