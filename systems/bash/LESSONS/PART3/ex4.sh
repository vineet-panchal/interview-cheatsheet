#!/bin/bash
#Source filedir.sh
# prints if each entry in current dir is file or dir

for  file  in *
do
  if  [  -f  $file ]
  then
    echo  "$file  is  file"
  else
    if  [  -d  $file  ]
    then
      echo  "  $file  is  dir. "
    fi
  fi
done
exit 0