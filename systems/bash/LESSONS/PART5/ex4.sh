
#!/bin/bash
#Source: menupgm.sh
#prints a menu and executes selected choice
#reprints menu for another selection
#continues until user selects the exit option
#
#illustrates use of  "here document"
#         -any string could replace string "here" in pgm
#         -uses following lines as stdin until
#           the string "here" appears in col. 1
#
while  [ true ]
do
     clear
     #print  menu  display
     cat  << here
               MAIN  MENU
          1)   Print working dir.
          2)   List all entries in current dir.
          3)   Print date & time
          4)   Display contents of file
          5)   Create backup files
          X)   Exit
here
     #prompt for user input using continuation char
     echo  -e "Please enter selection  ${LOGNAME}:  \c"
     read selection

     case  $selection  in

          1)   pwd
               ;;
          2)   ls -1
               ;;
          3)   date
               ;;
          4)   echo  -e "Enter a file name:  \c"
               read  fname
               if  [ -f  $fname ]
               then
                    echo   "Contents of  $fname are: "
                    more  $fname
               else
                    echo "file $fname does not exist"
               fi
               ;;
          5)   echo  -e "Enter filenames:  \c"
               read  fnames
               for  fn  in  $fnames
               do
                    cp    $fn   $fn.bak
               done
               ;;

          X)   exit  0
               ;;
          *)   echo   -e "Invalid choice.  Try again  \a"
               ;;
     esac
     #pause before redisplaying menu
     echo   -e "\n\n  Press return to continue  \c"
     read  hold
done
exit 0