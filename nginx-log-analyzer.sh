#!/bin/bash

# Check if the log file is provided
log_file=$1

if [ -z $1 ]; then
    echo "Please provice the log file"
    exit 1
fi

# Checking log file for Top 5 IP addresses with the most requests
top_ips=$(awk 'NR>0 {print $1}' $log_file | sort | uniq -c | sort -r | head -n 5 | awk '{printf "%s - %s requests\n", $2, $1}')

# Checking log file for Top 5 most requested paths
top_paths=$(awk 'NR>0 {print $7}' $log_file | sort | uniq -c | sort -r | head -n 5 | awk '{printf "%s - %s requests\n", $2, $1}')

# Checking log file for Top 5 response status codes in the 9th column and ignoring any non-numeric values
top_status_codes=$(awk '$9 ~ /^[0-9]+$/ {print $9}' $log_file | sort | uniq -c | sort -r | head -n 5 | awk '{printf "%s - %s reqeusts\n", $2, $1}')

echo -e "Top 5 IP addresses with the most requests: \n$top_ips\n"
echo -e "Top 5 most requested paths: \n$top_paths\n"
echo -e "Top 5 response status codes: \n$top_status_codes"