#!/bin/bash
#source: q2.sh
# Write a program that uses a find command to list all non-empty files in the filetree in the current directory. 
find . ! -empty -type f
