#!/bin/bash
#source: q1.sh
# Write a program that expects one floating point number on stdin. Program uses sed to print, on stdout, the number represented as the sum of its whole number part and its fractional part, formatted like this example.
# Ex: > echo "33.5342" | ./q1.sh ==> 33 + 0.5342 = 33.5342
read line
echo "$line" | sed -e 's/\./ + 0\./' -e "s/$/ = $line/"
