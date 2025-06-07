#!/bin/bash
# Source: add.sh
# adds : to front of each line of several files & concatenates
# result into big-file

for  file  in  fn?                 #<--  fn1, fn2 fny  etc
do
     cat  $file |  \
     while  read line              #<--  reads a line of stdin
                                   #     into  var  line
     do
          echo  ":$line"
     done | cat >>  big-file       #just done >> big-file works too
done                               #need >> or last file will clobber
echo "after while loop value of line is $line"   #line is null--see above
exit 0