#! /bin/bash

FILENAME=$1
head -n1 ${FILENAME} | sed 's/,/\n/g' | nl
