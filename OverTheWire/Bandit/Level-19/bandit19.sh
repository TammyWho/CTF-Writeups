#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit19"
PASS="cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "./bandit20-do cat /etc/bandit_pass/bandit20"

