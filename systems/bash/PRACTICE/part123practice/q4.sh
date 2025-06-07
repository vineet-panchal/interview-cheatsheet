#!/bin/bash
#source: q4.sh
# Write a program that takes one or more arguments, assumed to be positive integers. 
# For each argument it prints on stdout, how many prime factors it has. Output must be exactly like the example. 
# Ex: > ./q4.sh 23 1 18
# ==> 23: 1 prime factors
# ==> 1: 0 prime factors
# ==> 18: 3 prime factors
declare -i pf
for i ; do
	pf=`factor $i | wc -w`
	pf=pf-1
	echo "$i: $pf prime factors"
done
