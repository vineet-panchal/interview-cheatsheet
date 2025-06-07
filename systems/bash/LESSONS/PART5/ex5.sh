#!/bin/bash
#Source: argp.sh
#process single arguments which can be -a, -b or -f
#arg -f expects filename after it
#e.g., argp.sh -b -f myfile -a

  while  [ "$1" ] ; do
    case  $1  in
         -a | -b)
              echo arg is -a or -b
              #process these options
              ;;
         -f)
              #process option -f filename
              if [ "`echo $2 | cut -c1`" = "-" -o -z "$2" ] ; then
                 echo "missing filename for -f"
              elif [ "$2" ] ; then
                # process -f filename
                echo arg is -f $2
                shift
              fi
              ;;
         *)
              echo  "$1  invalid argument"
              ;;
    esac
    shift
  done
  exit 0
  