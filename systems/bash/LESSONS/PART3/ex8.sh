     #!/bin/bash
     #Source: backup1
     if  [ $# -eq 0 ]
     then
          echo "Enter filename"
          read  fn
     else
          fn=$1
     fi
     cp  $fn  ${fn}.bak
     exit 0