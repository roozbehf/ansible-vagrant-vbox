#!/usr/bin/env bash

wget --quiet -O- server >> /dev/null

if [ $? == 0 ]
  then
    echo "Pong! Apache server is running."
  else
    echo "Apache server is not reachable."
fi
