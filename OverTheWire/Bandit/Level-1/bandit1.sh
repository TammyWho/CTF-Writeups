#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit1"
PASS="ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If"

sshpass -p "$PASS" ssh -p $PORT ${USER}@${HOST} "cat ./-" > flag.txt

echo "Flag has been saved to flag.txt"
cat flag.txt
