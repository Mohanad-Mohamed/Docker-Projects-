#!/bin/bash

send_requests() {
    while true; do
        curl -sS http://34.229.104.172:30005 > /dev/null
        echo "Request sent"
        sleep 0.0667  
    done
}

for ((i=1; i<=15; i++)); do
    send_requests &
    pids[$i]=$!
done

trap 'echo "Exiting..."; kill ${pids[*]}; exit' INT

wait
