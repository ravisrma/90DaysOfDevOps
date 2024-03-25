#!/bin/bash
echo "enter the number between 1 to 10"
read num
case $num in
    1)echo "you enter one";;
    2)echo "you enter two";;
    3)echo "you enter three";;
    4)echo "you enter four";;
    5)echo "you enter five";;
    6)echo "you enter six";;
    7)echo "you enter seven";;
    8)echo "you enter eight";;
    9)echo "you enter nine";;
    10)echo "you enter ten";;
    *) echo "INVALID NUMBER";;
esac