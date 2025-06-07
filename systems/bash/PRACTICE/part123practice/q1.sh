#!/bin/bash
#source: q1.sh
# Write a program that creates the filetree below, where A2 is a subdirectory of your home directory. 
# Directories are shown with a trailing /, and files are shown with no trailing /.
#
#                        A2/
#                         |
#         ----------------------------------
#         |             |       |    |     |
#        D1/           D2/     f1   f2     D3/
#         |             |                  |
#       -----        -------     ---------------------
#       |   |        |     |     |       |     |     |
#      f3  f4       D4/   f5    ab1.c  f2.2  hi.67  x123
#                    |
#              ---------
#              |   |   |
#             f6  f7  g2
mkdir A2/ A2/D1 A2/D2 A2/D3 A2/D2/D4
touch A2/f1 A2/f2 A2/D1/f3 A2/D1/f4 A2/D2/D4/f6 A2/D2/D4/f7 A2/D2/D4/g2 A2/D2/f5 A2/D3/ab1.c A2/D3/f2.2 A2/D3/hi.67 A2/D3/x123
