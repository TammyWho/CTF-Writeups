#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit7"
PASS="morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cat data.txt | grep -i 'millionth' | cut -f2"
