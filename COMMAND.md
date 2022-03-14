systemctl show docker | grep -i 'limit'
/etc/sysconfig/docker

Поддерживаются интуитивные альтернативы обычному синтаксису (reboot, yearly, annually, monthly, weekly, daily, midnight, hourly):

https://documentation.sisense.com/docs/increasing-docker-ulimits
https://habr.com/ru/company/acribia/blog/448704/  
https://medium.com/@geekidea_81313/running-cron-jobs-as-non-root-on-alpine-linux-e5fa94827c34

0.470 
#0 0.470 Usage: crontab [-c DIR] [-u USER] [-ler]|[FILE]
#0 0.470 
#0 0.470 	-c	Crontab directory
#0 0.470 	-u	User
#0 0.470 	-l	List crontab
#0 0.470 	-e	Edit crontab
#0 0.470 	-r	Delete crontab
#0 0.470 	FILE	Replace crontab by FILE ('-': stdin)

BusyBox v1.34.1 (2021-11-23 00:57:35 UTC) multi-call binary.

Usage: crond [-fbS] [-l N] [-d N] [-L LOGFILE] [-c DIR]

	-f	Foreground
	-b	Background (default)
	-S	Log to syslog (default)
	-l N	Set log level. Most verbose 0, default 8
	-d N	Set log level, log to stderr
	-L FILE	Log to FILE
	-c DIR	Cron dir. Default:/var/spool/cron/crontabs


/ $ cat home/jobberuser/.jobber 
[jobs]
- name: ExampleJob
  cmd: echo "Jobber is running!"
  time: '*'

