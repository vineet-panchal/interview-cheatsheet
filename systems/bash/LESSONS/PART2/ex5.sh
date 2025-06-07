#!/bin/bash
#source prof1.sh
#prints names of a prof logged in
#name supplied as command line argument
who | grep -w $1 | cut -c1-8 | uniq