  #!/bin/bash
  #Source: backup
  test -d /home/dwoit/bak || mkdir /home/dwoit/bak
  for f in *
  do
    if [ -f $f ]
    then
       cp ${f} /home/dwoit/bak/${f}
    fi
  done
  exit 0
  #note: should error-check (bak writable, properly created, etc.)