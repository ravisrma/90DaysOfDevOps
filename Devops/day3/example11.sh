#!/bin/bash
function file_count()
{
    local No_of_files=$(ls -l | wc -l)
    echo "$No_of_files"
}
file_count