#!/bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
./nws --cpu-threads 4 -l 127.0.0.1:4500 &

# Start the helper process
hive-cli client -p 4500
