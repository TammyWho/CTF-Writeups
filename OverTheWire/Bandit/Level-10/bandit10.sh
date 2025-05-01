#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit10"
PASS="FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "base64 -d data.txt | cut -d ' ' -f 4" 
