#!/bin/bash
#source: ex1.sh
#shell program to list all java and c files in current directory
echo -n "Current directory is: "
pwd
echo "C files are:"
ls *.c
echo "Java files are:"
ls *.jav
exit 0

# > cd /usr/courses/cps393/dwoit/courseNotes/Programs/linux
# > ls -l showSource.sh
# -rwxr-xr-x 1 dwoit cps393 203 Jul  2 14:57 showSource.sh
# > ./showSource.sh
# Current directory is: /usr/courses/cps393/dwoit/courseNotes/Programs/linux
# C files are:
# blah.c
# Java files are:
# blah.jav  color.jav  pgm1.jav  TextStackViewer.jav  ttt.jav  VisibleStack.jav  xyz.jav
# >