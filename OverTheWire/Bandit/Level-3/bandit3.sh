#!/bin/bash

HOST="bandit.labs.overthewire.org"
PORT=2220
USER="bandit3"
PASS="MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx"

sshpass -p $PASS ssh ${USER}@${HOST} -p $PORT "cd inhere/ && cat ...Hiding-From-You"

