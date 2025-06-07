#!/bin/bash
#source: prnargs.sh
#shell pgm to print out its first 2 args
echo The first argument is:  $1
echo The second argument is: $2
echo dollar zero is: $0
exit 0

# /home/dwoit>  cp /usr/courses/cps393/dwoit/courseNotes/Programs/linux/prnargs.sh .
# /home/dwoit>  ./prnargs.sh  "Hello there" world
# The first argument is: Hello there
# The second argument is: world
# dollar zero is: ./prnargs.sh

