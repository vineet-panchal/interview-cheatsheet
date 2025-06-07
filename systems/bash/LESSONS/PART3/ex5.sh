   #!/bin/bash
   #source renamePgm.sh
   #renames all files whose name contains "sample" so that the
   #"sample" part of the name becomes "Ch1.sample"
   for i in *sample* ; do
       if [ -f "$i" ] ; then
           cp $i `echo $i | sed -e 's/sample/Ch1.sample/'` 2>/dev/null
           if [ $? = "0" ] ; then
               echo copied $i
           else
               echo could not copy $i >&2
           fi
       fi
   done