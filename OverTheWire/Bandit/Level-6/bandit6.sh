#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit6"
PASS="HWasnPhtq9AVKe0dmk45nxy20cvUa6EG"

FILE=$(sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "find / -user bandit7 -group bandit6 -size 33c 2>/dev/null")

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cat $FILE"

