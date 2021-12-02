#!/bin/bash



# Important links for functions:
# https://linuxize.com/post/bash-functions/

while true; do
echo "
Enter 1 to display today's classes
Enter 2 to display assignments that are due today
Enter 3 to display all incomplete assignments
Enter 4 to add an assignment
Enter 5 to update an assignment
"
echo -n "Please enter "1-5" or enter "6" to exit: "


read choice;
case "$choice" in

        1)
                echo " "
		date
		echo ""
                ;;
        2)
                echo " "
                echo ""
                ;;
        3)
                echo "$(date)"
                echo ""
                ;;
	4)
		echo "$()"
		echo ""
		;;
	5)
		echo "$()"
		echo ""
		;;

        *)
                echo "Have a good day! Goodby,."
                exit 1

esac
done

