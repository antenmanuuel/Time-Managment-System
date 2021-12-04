#!/bin/bash

. functions.sh

while true; do
echo ""
echo "College Student Time Management System"
typewriter "Enter 1 to show today's classes" .05
typewriter "Enter 2 to show assignments that are due today" .05
typewriter "Enter 3 to show all incomplete assignments" .05
typewriter "Enter 4 to add an assignment" .05
typewriter "Enter 5 to edit an assignment" .05
echo -n "Please enter 1-5 or enter anything else to exit. "
read choice;
case "$choice" in
	1)
		# Call class_schedule function
		class_schedule	
                ;;
        2)
		# Call assignments_Due function
		assignments_due
                ;;
        3)
		# Call show_Incomplete_Assignment function
		show_Incomplete_Assignment
                ;;
	4)
		# Call add_assignment function
		add_assignment
		;;
	5)
		# Call edit_Assignments function
		edit_assignments
		;;

        *)
                typewriter "Exit" .05
                exit 1

esac
done

