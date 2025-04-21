#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit0"
PASS="bandit0"

sshpass -p "$PASS" ssh -o StrictHostKeyChecking=no -p 2220 ${USER}@${HOST} "cat readme" | grep -i 'password' | awk -F': ' '{print$2}' > flag.txt

echo "Flag has been saved to flag.txt"
cat flag.txt
