#!/bin/bash
#source: q2.sh
# Write a program that sets permissions of all entries in directory D3 whose name contains at least one directory after a . (dot), so that user is exactly rw-, group is exactly r--, and other is exactly --x.
chmod 641 ~A2/D3/*.[0-9]*
