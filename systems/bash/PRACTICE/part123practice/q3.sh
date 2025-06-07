#!/bin/bash
#source: q3.sh
# Write a program that lists all the entries in the filesystem that are directories, with names containing the character 'D', starting at directory A2 from the previous question. 
find A2 -type d -name "*D*"
