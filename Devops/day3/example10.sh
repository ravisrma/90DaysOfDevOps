#!/bin/bash
sudo cat /etc/shadow
if [ "$?" -eq 0 ]
then
    echo "command sucess!"
    exit 0
else
    echo "command failed"
    exit 1
fi
