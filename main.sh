#!/bin/bash

. functions.sh

while true; do
echo ""
echo "Enter 1 to show today's classes";
echo ""
echo "Enter 2 to show assignments that are due today";
echo  ""
echo  "Enter 3 to show all incomplete assignments";
echo ""
echo "Enter 4 to add an assignment"
echo ""
echo "Enter 5 to update an assignment"
echo -n "Please enter 1-5 or enter anything else to exit."
read choice;
case "$choice" in
	1)
		
		echo ""
                ;;
        2)
		assignments_Due
		echo ""
                ;;
        3)
		show_Incomplete_Assignment
		echo ""
                ;;
	4)
		add_assignment
		echo ""
		;;
	5)

		echo ""
		;;

        *)
                echo "Exit"
                exit 1

esac
done

