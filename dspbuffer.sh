#!/bin/sh
set -e

PORT=22222
BUFFER=8000

nc -u -l -p $PORT |
  dd ibs=$BUFFER iflag=fullblock oflag=dsync >
  /dev/dsp
