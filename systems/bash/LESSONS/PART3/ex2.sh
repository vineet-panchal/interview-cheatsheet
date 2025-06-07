  #!/bin/bash
  #Source tryfor.sh
  echo "not much" >f1
  cp f1 f2; cp f1 f3; cp f1 f4

  ls -l f[1-4]
  for  file in  f1   f2   f3   f4
  do
     chmod u-w  $file
     ls -l $file
  done
  rm -i f1 f2 f3 f4
  exit 