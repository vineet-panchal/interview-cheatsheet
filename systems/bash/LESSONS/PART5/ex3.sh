#!/bin/bash
#Source: looptail.sh
#loops over CLAs $3,$4,$5,... (skipping $1 $2)
#without using shift
#First, create the string: $3 $4 $5 ... $#
#Then loop over the VALUES of the string
#works if spaces in CLAs (solutions using 'read' will not)
declare -i j=3
loopStr=""
#loop for j from 3 to $# and each time add ' $j' to loopStr
while [ $j -le $# ] ; do
   loopStr="${loopStr} \$$j"
   j=j+1
done
#loopStr contains $3 $4 $5 ... $#
for i in $(eval echo $loopStr) ; do #eval replaces $i with value
  echo $i
done