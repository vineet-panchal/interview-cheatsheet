#!/bin/bash
#source: q3.sh
# Write a program that takes one argument, assumed to be the name of a readable and executable directory. 
# It displays the NUMBER of empty directories in the filetree starting at that directory. The program should not display any error messages. 
find $1 -type d -empty 2>/dev/null | wc -l
