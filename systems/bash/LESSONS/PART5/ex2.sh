#!/bin/bash
#Source: printXth.sh
#Expects a bunch of command line arguments.
#Prompts user and reads an integer (call it X)
#then it prints the Xth command line argument

echo -n "enter an integer: "
read X
the_arg='$'${X}
#note the difference in output:
     echo "command line arg number ${X} is:  ${the_arg}"
eval echo "command line arg number ${X} is:  ${the_arg}"