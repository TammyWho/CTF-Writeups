#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit11"
PASS="dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m' | cut -d ' ' -f 4"
