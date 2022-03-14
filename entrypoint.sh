#!/bin/sh

# env >> /etc/environment
# env
#if [ $cron_auth_startup ]; then
# echo -e "$yellow-- cron startup !!! --$nc"
echo -e "$yellow-- cron startup !!! --$nc" > /proc/1/fd/1 2>/proc/1/fd/2
echo -e "$yellow-- cron startup !!! --$nc" > ~/test.txt
# sudo systemctl start cron
# sudo systemctl start cron
# which cron
# sudo /usr/sbin/cron -f
# /usr/sbin/crond -l=0 -d=8 -f
# загрузить таблицу задач из файла
# crontab crontab
#fi
# https://www.opennet.ru/docs/RUS/bash_scripting_guide/a14586.html
# https://sites.google.com/site/bashhackers/commands/set
