### Мониторинг маркетинговых рассылок - Фиксируем и сравниваем данные отправленные с CRM и входящее письмо на почтовых аккаунтах Yandex, Gmail 
### Протестирован на 
    - Ubuntu 16.04.5 LTS 
    - Zabbix agent версии 3.4.15 (zabbix_agentd -V)
    - Suitecrm 7.7.4
    - Почтовый аккаунт Yandex (по протоколу imap)
    - Почтовый аккаунт Gmail (по протоколу imap)
### Файл 
    - search_mail_for_yandex.py - скрипт подключения к почтовому аккаунту Gmail и парсинг нужных данных (FROM, время последнего получения письма)
    - search_mail_for_gmail.py - скрипт подключения к почтовому аккаунту Gmail и парсинг нужных данных (FROM, время последнего получения письма)
    - search_mail_db.sh - скрипт выгрузки данных по запланированным рассылкам из БД (MySQL) Suitecrm за ближайшее время (15 минут вперед)  
    - marketing_newsletters.xml - готовый шаблон для zabbix сервера версии 4.0.4
    - marketing_newsletters.conf - конфиг. файл для zabbix agent
    - *.txt - лог файлы для записи данных 
    - cron_* - cron файлы
### Для того, чтобы мониторинг заработал нужно 
    - файл `marketing_newsletters.conf` скопировать `/etc/zabbix/zabbix_agentd.conf.d/`
    - перезагрузить zabbix agent 
    (можно проверить получение данные zabbix_agentd -t date_time_gmail)