#!/bin/bash

echo -e $blue"[$(date)] Docker clean starting."$nc
# echo $PWD
source ./scripts/protected_containers.sh
# docker container ls -q | grep -v -e 'rpt_*' -e 'mb_*'
# docker container ls -q | grep -vE 'rpt_*|mb_*'
# cat var/spool/cron/crontabs/root
container_args=""
for container in ${protected_containers[@]}; do
      container_args="$container_args|$container"
done
container_args="${container_args:1}"
# echo $container_args
containers=$(docker ps -a --format "{{.Names}}")
for container in $containers; do
        if [[ ! $container =~ $container_args ]]; then
            if [[ -n $DRY_RUN ]]; then
                echo $container
            else
                docker container rm $container
            fi
        fi
done

echo -e $green"[$(date)] Docker clean has completed."$nc
