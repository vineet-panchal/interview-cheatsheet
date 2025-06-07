#!/bin/bash
#Source: countod.sh
#read in a number of strings from user (until
#user enters  END  or end) and output the total
#number of strings that are  files  & the total
#number that are directories.
#note: if the use enters more than one string on a line,
# will get if [ -f str1 str2 etc ] which is interpretted as
#          if [ -f str1 ]  (Thats just how test works)

typeset -i  fileEntry=0
typeset -i  dirEntry=0

while  [ true ]
do
     echo  Enter an entry name or  END to quit
     read entrynam
     if  [ "$entrynam" = "END" -o "$entrynam" = "end" ]
     then
          break
     fi
     if   [ -f  "$entrynam" ]
     then
          fileEntry=fileEntry+1
     elif  [ -d "$entrynam" ]
     then
          dirEntry=dirEntry+1
     fi
done
echo -e "The number of files:\t  $fileEntry"
echo -e "The number of directories:\t  $dirEntry"
exit 0