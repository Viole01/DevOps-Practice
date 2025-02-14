#!/bin/bash

# Total CPU Usage
echo "CPU Usage: `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`%"

# Total memory usage (Free vs Used including percentage)
echo "Memory Usage: `free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%) / Total: %sMB\n", $3,$3*100/$2,$2 }'`"

#Total disk usage (Free vs Used including percentage)
echo "`df -h | awk '/mnt\/c|mnt\/d/ {total=substr($2,1,length($2)-1); used=substr($3,1,length($3)-1); total_size+=total; total_used+=used} END {printf "Total Disk Usage: Total: %sGB / Used: %sGB (%.2f%%)\n", total_size, total_used, total_used*100/total_size}'`"

# Top 5 processes by CPU usage
echo -e "Top 5 processes by CPU usage:\n`ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6`"

# Top 5 processes by memory usage
echo -e "Top 5 processes by memory usage:\n`ps -eo pid,cmd,%mem --sort=-%mem | head -n 6`"