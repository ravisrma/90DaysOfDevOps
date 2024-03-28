#!/bin/bash
file="/home/ravi/love/test/test"
if [ -e $file ]
then
    echo "$file passwords are enabled"
fi
if [ -w $file ]
then
    echo "You have permissions to edit $file"
else
    echo "You do NOT have permissions to edit $file"
fi