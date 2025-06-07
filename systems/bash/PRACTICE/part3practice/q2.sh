#!/bin/bash
#source: q2.sh
# Write a program that reads a file, and writes to stdout. Each line of the file contains a number, either integer or floating point.
# If the number is an integer, simply print that integer on stdout.
# If the number is a float, it should be printed just like the previous question.
# Ex: > cat numberlist
# 3.0
# 3.1415
# 42
# 33.3333333
# 7
# > ./q2.sh numberlist
# 3 + 0.0 = 3.0
# 3 + 0.1415 = 3.1415
# 42
# 33 + 0.3333333 = 33.3333333
# 7
cat $1 | while read line ; do
	if [ "$(echo $line | grep '\.')" ] ; then
		echo "$line" | sed -e 's/\./ + 0\./' -e "s/$/ = $line/"
	else
		echo $line
	fi
done
