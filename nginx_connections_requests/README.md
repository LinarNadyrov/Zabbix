#### Мониторинг 
    - число принятых коннектов в секунду
    - число обработанных коннектов в секунду.
    - сколько коннектов в состоянии чтения от клиента
    - сколько в ожидании (т.е. с клиентом подключены, но не пишем и не читаем, например, скрипт работает)
    - сколько в состоянии отдачи клиенту
    - сколько активных коннектов
    - сколько процессов nginx запущено
    - запросов в секунду.
#### Протестирован на 
    - Ubuntu 16.04.5 LTS 
    - Zabbix agent версии 3.2.11 (zabbix_agentd -V)
    - nginx 1.10.3
#### Файл 
    - nginx.conf - конфиг. файл 
    - nginx.sh - опрос с необходимыми параметрами 
    - nginx_templates.xml - готовый шаблон для zabbix сервера версии 4.0.4
#### Для того, чтобы мониторинг заработал нужно 
    - файл `nginx.conf` скопировать `/etc/zabbix/zabbix_agentd.d/nginx.conf`
    - файл `nginx.sh` скопировать `/etc/zabbix/scripts/nginx.sh`
    - перезагрузить zabbix agent 
    (можно проверить получение данные zabbix_agentd -t 'key items')