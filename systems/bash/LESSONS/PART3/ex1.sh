#!/bin/bash
#source ff.sh
if [ "$(grep $1 file1)" ]
then
  echo "string $1 is contained in file file1"
else
  echo "string $1 is not contained in file file1"
fi