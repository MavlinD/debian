#!/bin/bash

echo -e $blue"[$(date)] Docker clean starting."$nc
# echo $PWD

images=$(docker images -q --filter "dangling=true")
for image in $images; do
    if [[ -n $DRY_RUN ]]; then
        echo $image
    else
        docker image rm $image
    fi
done

echo -e $green"[$(date)] Docker clean has completed."$nc

eval "docker system df"
