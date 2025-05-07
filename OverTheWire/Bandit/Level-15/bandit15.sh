#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit15"
PASS="8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "echo '8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo'| ncat --ssl localhost 30001"

