#!/bin/bash
#source: trump_born.sh
echo "Donald Trump's Birthday: "
lynx -dump "https://en.wikipedia.org/wiki/Donald_Trump" 2>/dev/null | \
      grep "Trump.*born" | head -1
echo ""
exit 0