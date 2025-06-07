#!/bin/bash
#source profs.sh
#prints names of profs.sh logged in
who | grep dwoit | cut -c1-8 | uniq
who | grep eharley | cut -c1-8 | uniq
who | grep aabhari | cut -c1-8 | uniq
who | grep -w mes | cut -c1-8 | uniq #string in other userids
exit 0
#or who | grep -Ew "dwoit|eharley|mes" | cut -c1-8 | sort -u