#!/usr/bin/env bash

ping -qc 1 server >> /dev/null

if [ $? == 0 ]
  then
    echo "Pong!"
  else
    echo "Server not found."
fi
