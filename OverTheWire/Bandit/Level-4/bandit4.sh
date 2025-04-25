#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit4"
PASS="2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ"

#sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cd inhere/ && file ./* | grep -i 'ASCII'"
sshpass -p "$PASS" ssh "${USER}@${HOST}" -p "$PORT" 'cd inhere && file ./* | grep "ASCII" | cut -d: -f1 | xargs cat'

