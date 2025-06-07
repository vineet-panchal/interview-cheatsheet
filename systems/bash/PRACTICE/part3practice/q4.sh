#!/bin/bash
#source: q4.sh
# Write a program that displays one line, "the first person to login on europa since log creation was p2nagpal".
# HOWEVER, strings "europa" and "p2nagpal" will be replaced by the name of the moon you're logged into, and "p2nagpal" will be replaced by the userid of th efirst person to log into this moon since the log was created (the last person on the list)
echo "the first person to login on $(hostname) since log creation was $(last | tail -3 | head -1 | cut -d' ' -f1)"
