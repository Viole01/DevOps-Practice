#!/bin/bash

# Total CPU Usage
echo "CPU Usage: `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`%"

# Total memory usage (Free vs Used including percentage)
echo "Memory Usage: `free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%) / Total: %sMB\n", $3,$3*100/$2,$2 }'`"