#!/bin/bash
#Source: showLastLines
 lastLine () {
   echo -e "Last line of $1 is:\t\c "
   tail -1 $1
 }
 lastLine $1
 lastLine $2
 lastLine $3