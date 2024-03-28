#!/bin/bash
echo "enter the file path"
file=$@
if [ -f $file ]
then
    echo "$file is a regular file"
elif [ -d $file ]
then
    echo "$file is a directory"
else
    echo "$file is another type of file"
fi
ls -l $file
