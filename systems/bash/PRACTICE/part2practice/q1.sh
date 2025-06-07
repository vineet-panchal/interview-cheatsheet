#!/bin/bash
#source: q1.sh
# Create a program that takes three arguments: two files, and an integer.
# If the first n lines of file1 are identical to the last n lines of file2, then program prints: "First n lines of file1 and last n lines of file2 are identical."
# If the first n lines of file1 and the last n lines of file2 differ, then program prints: "First n lines of file1 and last n lines of file2 differ."
echo -n "First $3 lines of $1 and last $3 lines of $2 "
head -$3 $1 >f1
tail -$3 $2 >f2
diff -sq f1 f2 | cut -d' ' -f5-6
rm -r f1 f2
