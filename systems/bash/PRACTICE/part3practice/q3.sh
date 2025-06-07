#!/bin/bash
#source: q3.sh
# write a program that prints the line-count and filename of the file with the most lines in the current directory. 
# Where XX is the filename and YY is the line-count: "File XX has the most lines (YY)"
for i in * ; do
	if [ -f $i ] ; then
		wc -l $i
	fi
done | sort -n | tail -1 > temp
echo "File $(cut -d' ' -f2 temp) has the most lines ($(cut -d' ' -f1 temp))"
rm temp
exit 0
