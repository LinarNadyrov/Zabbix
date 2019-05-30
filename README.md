# Zabbix
Config files for zabbix
---
**catalog lxc_template**

    # Протестирован на 
        - Proxmox 5.3
        - Ubuntu 16.04.5 LTS 
        - Zabbix server версии 4.0.0 (веб панель)
        - Zabbix agent версии > 3.4.15 (zabbix_agentd -V)
        - отключенный IPv6
        - версия = free from procps-ng 3.3.10 (free -V)

    # Шаблон мониторинга LXC в Proxmox
    Название шаблона PROD_Infrastrucrute (файл PROD_Infrastrucrute.xml)
    Шаблон включает в себя мониторинг
        - CPU по 8 параметрам и рисует 3 графика
        - Memory по 4 параметрам и рисует 2 график
        - Swap по 3 параметрам и рисует 2 график
        - Ping fail по 2 параметрам и рисует 2 графика
        - Mounted filesystem discovery и рисуется график (зависит от монтированных сущностей)
        - Network interface discovery и рисуется график (зависит от количества сетевых интерфейсов)

    # Для того, чтобы мониторинг заработал нужно 
        - файл `zabbix_container.conf` скопировать `/etc/zabbix/zabbix_agentd.d/`
        - перезагрузить zabbix agent 
**catalog windows_template**
    # Протестирован на 
        - Zabbix server версии 4.0.0 (веб панель)
        - Windows 7 Pro x64
    # Шаблон мониторинга Windows
    Название шаблона Template_OS_Windows (файл Template_OS_Windows.xml)
    Шаблон включает в себя мониторинг
        - Стандартный шаблон
        - Доработанный CPU Utilization 
        - Доработанный Memory 