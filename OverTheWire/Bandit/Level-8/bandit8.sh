#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit8"
PASS="dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cat data.txt | sort | uniq -u "
