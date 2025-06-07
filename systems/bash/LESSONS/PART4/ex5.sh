#!/bin/bash
#Source: floc
#try running this as:  floc a b c
ff () {
  echo "in ff: my \$2 is: $2"
  echo "in ff: my caller's \$2 is ${A[2]}"
}
echo in floc before call to ff: \$2 is:  $2
A=($0 "$@")      #initialize an array A to be all the positional params
ff xxx yyy zzz
echo in floc after call to ff: \$2 is:  $2