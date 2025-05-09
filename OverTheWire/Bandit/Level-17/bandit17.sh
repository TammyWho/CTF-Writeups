#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit17"
PASS="kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "diff passwords.old passwords.new | tail -1 | cut -f 2"
