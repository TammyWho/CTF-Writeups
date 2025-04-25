#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit2"
PASS="263JGJPfgU6LtdEvgfWU1XP5yac29mFx"

FILE=$(sshpass -p "$PASS" ssh "$USER@$HOST" -p "$PORT" 'ls')
sshpass -p "$PASS" ssh "$USER@$HOST" -p "$PORT" "cat \"$FILE\""
