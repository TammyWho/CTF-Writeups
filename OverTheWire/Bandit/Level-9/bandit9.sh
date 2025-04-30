#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit9"
PASS="4CKMh1JI91bUIZZPXDqGanal4xvAg0JM"

#sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "strings data.txt | grep ==== | tail -1 | cut -d ' ' -f 2 "
sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "strings data.txt | grep -E '={2,}' | tail -1 | cut -d ' ' -f 2 "
