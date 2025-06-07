#!/bin/bash
#source: q5.sh
# Write a program that takes two arguments, assumed to be a string containing no whitespace, and a readable file. 
# q6.sh prints a count of the number of WORDS in the file that start with the given string. Assume words on a line are separated by spaces. 
# Ex: > cat q5.sh
# ==> abcdef abc abcdog xyz
# ==> xycdef xyc xxy art
# ==> mouse abcmouse Xymouse
while read line ; do
	for word in $(echo $line) ; do
		echo $word | grep "^$1"
	done
done < $f2 | wc -w
