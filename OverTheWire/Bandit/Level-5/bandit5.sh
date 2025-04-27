#!/bin/bash

HOST="bandit.labs.overthewire.org" 
PORT=2220
USER="bandit5"
PASS="4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw"

FILE=$(sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cd inhere/ && find . -type f -size 1033c")
sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cat ./inhere/$FILE"
