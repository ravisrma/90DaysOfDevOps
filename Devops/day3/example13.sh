#!/bin/bash
DAY=$(date +%F)
cd /home/ravi/Practice/Devops/day3
rename 's/png/jpg/' *.png
for FILE in *.jpg
do
    
    mv $FILE ${DAY}-${FILE}    
done