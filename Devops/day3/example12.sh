#!/bin/bash
function file_count()
{
    local dir=$1
    count=$(ls $dir | wc -l)
    echo "$dir"
    echo "$count"
}
file_count /etc
file_count /var
file_count /usr/bin 