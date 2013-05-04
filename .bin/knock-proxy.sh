#!/bin/bash
#
# Knock a series of ports before proxy-ing to the final port.

HOST=$1
PORT=$2

shift
for ARG in "$@"; do
	nmap -PN --host_timeout 201 --max-retries 0 -p $ARG $HOST >/dev/null
done

ncat $HOST $PORT
