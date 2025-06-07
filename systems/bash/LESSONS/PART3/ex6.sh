    #!/bin/bash
    #source: forRange.sh
    #loops over 1 2 3 4 5
    echo -e '\n using {start..end} syntax'
    for i in {1..5}
    do
       echo "i is: $i "
    done

    #loops over 0 2 4 6 8 10
    echo -e '\n using {start..end..inc} syntax'
    for i in {0..10..2}
      do
         echo "i is: $i"
     done