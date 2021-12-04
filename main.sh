#!/bin/bash

. functions.sh

while true; do
echo ""
echo "Enter 1 to show today's classes";
echo "Enter 2 to show assignments that are due today";
echo "Enter 3 to show all incomplete assignments";
echo "Enter 4 to add an assignment"
echo "Enter 5 to edit an assignment"
echo -n "Please enter 1-5 or enter anything else to exit. "
read choice;
case "$choice" in
	1)
		class_schedule	
		echo ""
                ;;
        2)
		# Call assignments_Due function
		assignments_Due
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
		# Call edit_Assignments function
		edit_Assignments
		;;

        *)
                echo "Exit"
                exit 1

esac
done

