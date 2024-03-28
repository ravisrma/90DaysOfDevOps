#!/bin/bash
read file
if [ -f $file ]
then
    echo "$file is a regular file"
    exit 0
elif [ -d $file ]
then
    echo "$file is a directory"
    exit 1
else
    echo "Another type of file"
    exit 2
fi
