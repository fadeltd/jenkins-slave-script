#!/bin/bash

while read -r line; do declare "${line//[[:space:]]}"; done < config.properties

until java -jar agent.jar \
    -jnlpUrl $url \
    -secret $secret \
    -workDir $workDir; \
do
    echo "Slave crashed with exit code $?.  Respawning.." >&2;
    sleep 1;
done