#!/bin/bash
#Source: list10.sh
#Note: command seq 1 10 does the same thing
x=1
while  [ $x  -le  10 ]
do
     echo  $x
     x=$((x+1))
done
exit 0