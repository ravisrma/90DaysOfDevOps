#!/bin/bash
if [ $# -ne 3 ]
then
    echo "$0: number1 number2 and number3 are not given">$2
    exit 1
fi
if [ $1 -gt $2 ] && [ $1 -gt $3 ]  
then
    echo "$1 is Greater then $1 and $2"
elif [ $2 -gt $1 ] && [ $2 -gt $3 ]
then
    echo "$2 is Greater then $1 and $3"
elif [ $3 -gt $1 ] && [ $3 -gt $1 ]
then
    echo "$3 is Greater then $1 and $2"
elif [ $1 -eq $2 ] && [ $1 -eq $3 ] && [ $2 -eq $3 ]
then
    echo "$1,$2 and $3 are equal"
else
    echo "I can't figure out"
fi
