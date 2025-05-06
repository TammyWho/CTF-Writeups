#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit14"
PASS="MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "echo 'MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS' | ncat localhost 30000"
