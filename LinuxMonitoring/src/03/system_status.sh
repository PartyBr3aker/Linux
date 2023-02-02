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
str_1="${bgr1}${font1}HOSTNAME${deffault}        = ${bgr2}${font2}$(hostname)${deffault}"
str_2="${bgr1}${font1}TIMEZONE${deffault}        = ${bgr2}${font2}$(cat /etc/timezone) $(date +"%Z" -u) $(date +"%:::z")${deffault}"
str_3="${bgr1}${font1}USER${deffault}            = ${bgr2}${font2}$(whoami)${deffault}"
str_4="${bgr1}${font1}OS${deffault}              = ${bgr2}${font2}$(hostnamectl | grep "Operating System" | awk '{print $3, $4, $5}')${deffault}"
str_5="${bgr1}${font1}DATE${deffault}            = ${bgr2}${font2}$(date | awk '{print $2, $3, $4, $5}')${deffault}"
str_6="${bgr1}${font1}UPTIME${deffault}          = ${bgr2}${font2}$(uptime -p | awk '{print $2, $3, $4, $5}')${deffault}"
str_7="${bgr1}${font1}UPTIME_SEC${deffault}      = ${bgr2}${font2}$(cat /proc/uptime | awk '{$2="seconds"; print $1, $2}')${deffault}"
str_8="${bgr1}${font1}IP${deffault}              = ${bgr2}${font2}$(hostname -i | awk '{print $1}')${deffault}"
str_9="${bgr1}${font1}MASK${deffault}            = ${bgr2}${font2}$(ifconfig | grep -m1 "netmask" | awk '{print $4}')${deffault}"
str_10="${bgr1}${font1}GATEWAY${deffault}         = ${bgr2}${font2}$(ip r | grep default | awk '{print $3}')${deffault}"
str_11="${bgr1}${font1}RAM_TOTAL${deffault}       = ${bgr2}${font2}$(free -m | grep Mem | awk '{printf("%.3f\n",$2 / 1024)}') Gb${deffault}"    
str_12="${bgr1}${font1}RAM_USED${deffault}        = ${bgr2}${font2}$(free -m | grep Mem | awk '{printf("%.3f\n",$3 / 1024)}') Gb${deffault}"    
str_13="${bgr1}${font1}RAM_FREE${deffault}        = ${bgr2}${font2}$(free -m | grep Mem | awk '{printf("%.3f\n",$4 / 1024)}') Gb${deffault}"    
str_14="${bgr1}${font1}SPACE_ROOT${deffault}      = ${bgr2}${font2}$(df -hk | grep "\/$" | awk '{printf("%.2f\n",$2 / 1024)}') Mb${deffault}"
str_15="${bgr1}${font1}SPACE_ROOT_USED${deffault} = ${bgr2}${font2}$(df -hk | grep "\/$" | awk '{printf("%.2f\n",$3 / 1024)}') Mb${deffault}"
str_16="${bgr1}${font1}SPACE_ROOT_FREE${deffault} = ${bgr2}${font2}$(df -hk | grep "\/$" | awk '{printf("%.2f\n",$4 / 1024)}') Mb${deffault}"

for str in "$str_1" "$str_2" "$str_3" "$str_4" "$str_5" "$str_6" "$str_7"\
  "$str_8" "$str_9" "$str_10" "$str_11" "$str_12" "$str_13" "$str_14" "$str_15"\
  "$str_16"
    do
        echo -e $str
    done
}
