#!/bin/bash 

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit18"
PASS="x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cat readme"
