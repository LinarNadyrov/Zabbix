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
