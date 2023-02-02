#!/bin/bash

# HOSTNAME = сетевое имя
# TIMEZONE = временная зона в виде: America/New_York UTC -5 (временная зона, должна браться из системы и быть корректной для текущего местоположения)
# USER = текущий пользователь который запустил скрипт
# OS = тип и версия операционной системы
# DATE = текущее время в виде: 12 May 2020 12:24:36
# UPTIME = время работы системы
# UPTIME_SEC = время работы системы в секундах
# IP = ip-адрес машины в любом из сетевых интерфейсов
# MASK = сетевая маска любого из сетевых интерфейсов в виде: xxx.xxx.xxx.xxx
# GATEWAY = ip шлюза по умолчанию
# RAM_TOTAL = размер оперативной памяти в Гб c точностью три знака после запятой в виде: 3.125 GB
# RAM_USED = размер используемой памяти в Гб c точностью три знака после запятой
# RAM_FREE = размер свободной памяти в Гб c точностью три знака после запятой
# SPACE_ROOT = размер рутового раздела в Mб с точностью два знака после запятой в виде: 254.25 MB
# SPACE_ROOT_USED = размер занятого пространства рутового раздела в Mб с точностью два знака после запятой
# SPACE_ROOT_FREE = размер свободного пространства рутового раздела в Mб с точностью два знака после запятой

function system_status_print() {
str_1="HOSTNAME        = $(hostname)"
str_2="TIMEZONE        = $(cat /etc/timezone) $(date +"%Z" -u) $(date +"%:::z")"
str_3="USER            = $(whoami)"
str_4="OS              = $(hostnamectl | grep "Operating System" | awk '{print $3, $4, $5}')"
str_5="DATE            = $(date | awk '{print $2, $3, $4, $5}')"
str_6="UPTIME          = $(uptime -p | awk '{print $2, $3, $4, $5}')"
str_7="UPTIME_SEC      = $(cat /proc/uptime | awk '{$2="seconds"; print $1, $2}')"
str_8="IP              = $(hostname -i | awk '{print $1}')"
str_9="MASK            = $(ifconfig | grep -m1 "netmask" | awk '{print $4}')"
str_10="GATEWAY         = $(ip r | grep default | awk '{print $3}')"
str_11="RAM_TOTAL       = $(free -m | grep Mem | awk '{printf("%.3f\n",$2 / 1024)}') Gb"    
str_12="RAM_USED        = $(free -m | grep Mem | awk '{printf("%.3f\n",$3 / 1024)}') Gb"    
str_13="RAM_FREE        = $(free -m | grep Mem | awk '{printf("%.3f\n",$4 / 1024)}') Gb"    
str_14="SPACE_ROOT      = $(df -hk | grep "\/$" | awk '{printf("%.2f\n",$2 / 1024)}') Mb"
str_15="SPACE_ROOT_USED = $(df -hk | grep "\/$" | awk '{printf("%.2f\n",$3 / 1024)}') Mb"
str_16="SPACE_ROOT_FREE = $(df -hk | grep "\/$" | awk '{printf("%.2f\n",$4 / 1024)}') Mb"

for str in "$str_1" "$str_2" "$str_3" "$str_4" "$str_5" "$str_6" "$str_7"\
  "$str_8" "$str_9" "$str_10" "$str_11" "$str_12" "$str_13" "$str_14" "$str_15"\
  "$str_16"
    do
        echo $str
    done
}


