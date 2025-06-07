#!/bin/bash
#Source: gopsPgm.sh
#parses command line arguments using getops command
#getopts list arg
#list is a list of valid options, e.g., below they
#     are a,b,d or o
#the ":" after any char in list indicates that option
#    requires an argument.
#so valid usage of gopsPgm.sh is:
#  gopsPgm.sh -o dog
#  gopsPgm.sh -o "dog mouse"
#  gopsPgm.sh -d "abce" -b
#  gopsPgm.sh -a -o dog -b
#  gopsPgm.sh -ab -o dog -d mouse
#invalid are:
#  gopsPgm.sh -o
#  gopsPgm.sh -x
#in these cases, error messages are printed automatically and $c is
#set to ? so that it matches the last part (so both exit 1)

 while getopts abd:o: c  #when done returns false
          do
               case $c in
               a | b)    #do some processing here
                         echo "in case a|b, option is $c"
                         ;;
               d)       # $OPTARG is now whatever came
                        # after the -d
                         echo "in case d, option is $c arg is $OPTARG "
                         ;;
               o)       # $OPTARG is now whatever came
                        # after the -o
                         echo "in case o, option is $c arg is $OPTARG "
                         ;;
               \?)       #error msg is automatically written
                         #from the getopts command
                         exit 1;;   #STOPS gopsPgm.sh and sets $? to 1
               esac
          done
  exit 0