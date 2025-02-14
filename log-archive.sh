#!/bin/bash

log_directory=$1
archive_dir="/archive_logs"
timestamp=$(date +%Y%m%d_%H%M%S)
archive_name=$(log_archive_${timestamp}.tar.gz)

if [ -z $1 ]; then
    echo "Please provide the log directory"
    exit 1
fi

# check if the log directory exists
if [ ! -d $(log_directory) ]; then
    echo "The log directory does not exist"
    exit 1
fi

# change to the log directory
cd $log_directory

# assuming we are archiving logs which are older than 7 days in a single file
find . -name "*.log" -type f -mtime +7 | tar -czf $(archive_name) -T -

# Move the archived logs to a different directory
mv $(archive_name) $archive_dir