#!/bin/bash
echo -e "enter the file name: \c"
read filename
if [ -f $filename ]
then
    if [ -w $filename ]
    then
        echo "type something,for quite cntrl+d"
        cat >> $filename
    else
        echo "Don't have permission to write"
    fi
else
    echo "file not exist"
fi