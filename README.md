# Zabbix
Config files for zabbix
---
**folder - lxc_template**
- Протестирован на 
    - Proxmox 5.3
    - Ubuntu 16.04.5 LTS 
    - Zabbix server версии 4.0.0 (веб панель)
    - Zabbix agent версии > 3.4.15 (zabbix_agentd -V)
    - отключенный IPv6
    - версия = free from procps-ng 3.3.10 (free -V)
- Шаблон мониторинга LXC в Proxmox включает в себя мониторинг (шаблон PROD_Infrastrucrute.xml)
    - CPU по 8 параметрам и рисует 3 графика
    - Memory по 4 параметрам и рисует 2 график
    - Swap по 3 параметрам и рисует 2 график
    - Ping fail по 2 параметрам и рисует 2 графика
    - Mounted filesystem discovery и рисуется график (зависит от монтированных сущностей)
    - Network interface discovery и рисуется график (зависит от количества сетевых интерфейсов)
- Для того, чтобы мониторинг заработал нужно 
    - файл `zabbix_container.conf` скопировать `/etc/zabbix/zabbix_agentd.d/`
    - перезагрузить zabbix agent 
---
**folder - windows_template**
- Протестирован на 
    - Zabbix server версии 4.0.0 (веб панель)
    - Windows 7 Pro x64
- Шаблон мониторинга Windows включает в себя мониторинг (шаблон Template_OS_Windows.xml)
    - Стандартный шаблон
    - Доработанный CPU Utilization 
    - Доработанный Memory 
---
**folder - monitoring_SSL_https_smtp**
- Протестирован на 
    - Zabbix server версии 4.0.0 (веб панель)
- Мониторинг HTTPS/SMTP вычисляет (шаблон SSL Cert Expiration.xml)
    - через сколько дней "протухнет" сертификат
    - оповещает
---
**folder - monitoring_proxmox**
- Мониторим
    - "Изменился размер кластера!"
    - скорость подключения меньше 1gbit/s!
---
**folder - ldapsearch**
- Мониторинг количества и идентичность УЗ в FreeIPA
- Протестирован на 
    - Ubuntu 16.04.5 LTS 
    - Zabbix agent версии 3.4.15 (zabbix_agentd -V)
    - FreeIPA версии 4.4.4
- Файл
#####
    - ldapsearch_sum.sh - опрашивает необходимый ldap / формирует файл с данными на основе опроса
    - ldapsearch.conf   - опрашивает необходимый ldap / забирает нужные данные с помощью grep, awk / подсчитывает контрольные суммы и количества блоков в нужном файле
- Для того, чтобы мониторинг заработал нужно 
    - файл `ldapsearch.conf.conf` скопировать `/etc/zabbix/zabbix_agentd.d/`
    - перезагрузить zabbix agent 
---
**folder - MPIS**
- Мониторинг запросов (requst) и обработка (JSON Path) их данных 
- Протестирован на 
    - Ubuntu 16.04.5 LTS 
    - Zabbix agent версии 3.4.15 (zabbix_agentd -V)
    - glassfish-4.1.1
- Файл 
    - requestGetInfo.conf - конфиг. файл 
    - requestGetInfo.sh - опрос с необходимыми параметрами 
    - MPIS.xml - готовый шаблон для zabbix сервера версии 4.0.4
- Для того, чтобы мониторинг заработал нужно 
    - файл `equestGetInfo.conf` скопировать `/etc/zabbix/zabbix_agentd.conf.d/`
    - файл `requestGetInfo.sh` скопировать `/etc/zabbix/plugins/requestGetInfo.sh`
    - перезагрузить zabbix agent 
    (можно проверить получение данные zabbix_agentd -t requestGetInfo)
---
**folder - mail_search (Marketing Newsletter Monitoring)**
- Мониторинг маркетинговых рассылок - Фиксируем и сравниваем данные отправленные с CRM и входящее письмо на почтовых аккаунтах Yandex, Gmail 
- Протестирован на 
    - Ubuntu 16.04.5 LTS 
    - Zabbix agent версии 3.4.15 (zabbix_agentd -V)
    - Suitecrm 7.7.4
    - Почтовый аккаунт Yandex (по протоколу imap)
    - Почтовый аккаунт Gmail (по протоколу imap)
- Файл 
    - search_mail_for_yandex.py - скрипт подключения к почтовому аккаунту Gmail и парсинг нужных данных (FROM, время последнего получения письма)
    - search_mail_for_gmail.py - скрипт подключения к почтовому аккаунту Gmail и парсинг нужных данных (FROM, время последнего получения письма)
    - search_mail_db.sh - скрипт выгрузки данных по запланированным рассылкам из БД (MySQL) Suitecrm за ближайшее время (15 минут вперед)  
    - marketing_newsletters.xml - готовый шаблон для zabbix сервера версии 4.0.4
    - marketing_newsletters.conf - конфиг. файл для zabbix agent
    - *.txt - лог файлы для записи данных 
    - cron_* - cron файлы
- Для того, чтобы мониторинг заработал нужно 
    - файл `marketing_newsletters.conf` скопировать `/etc/zabbix/zabbix_agentd.conf.d/`
    - перезагрузить zabbix agent 
    (можно проверить получение данные zabbix_agentd -t date_time_gmail)
---
**folder - nginx_connections_requests**
- Мониторинг 
    - число принятых коннектов в секунду
    - число обработанных коннектов в секунду.
    - сколько коннектов в состоянии чтения от клиента
    - сколько в ожидании (т.е. с клиентом подключены, но не пишем и не читаем, например, скрипт работает)
    - сколько в состоянии отдачи клиенту
    - сколько активных коннектов
    - сколько процессов nginx запущено
    - запросов в секунду.
- Протестирован на 
    - Ubuntu 16.04.5 LTS 
    - Zabbix agent версии 3.2.11 (zabbix_agentd -V)
    - nginx 1.10.3
- Файл 
    - nginx.conf - конфиг. файл 
    - nginx.sh - опрос с необходимыми параметрами 
    - nginx_templates.xml - готовый шаблон для zabbix сервера версии 4.0.4
- Для того, чтобы мониторинг заработал нужно 
    - файл `nginx.conf` скопировать `/etc/zabbix/zabbix_agentd.d/nginx.conf`
    - файл `nginx.sh` скопировать `/etc/zabbix/scripts/nginx.sh`
    - перезагрузить zabbix agent 
    (можно проверить получение данные zabbix_agentd -t 'key items')
---

