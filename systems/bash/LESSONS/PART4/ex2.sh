#!/bin/bash
#Source: xy
abc () {
  echo -e "in abc.\t My \$2 is: $2"
}
echo -e "in xy.\t My \$2 is: $2"
abc x "y z" w
abc a b c d
echo -e "in xy.\t My \$2 is: $2"