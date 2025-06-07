#!/bin/bash
#Source: shiftex.sh
#pgm to print its args.

     while  [ "$1" ]        #<--- stops when  $1 is null
     do
          echo  "$1"        #<--- so spaces preserved
          shift             #<--- moves  $2  to  $1,  $3 to $2  etc.
     done
     exit 0