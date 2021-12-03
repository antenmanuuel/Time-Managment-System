        
while : clear
do
	# Ask for the ID
	echo -n "Please enter assignment ID: "
	read ID
	assignment=$(grep $ID ./ahss) # Search for the assignment based on the ID

	if [ ! -z "$assignment" ]
	then
		echo -e "Assignment found:\n$assignment."
		
		# Get Date
		DATE=$(echo $assignment | cut -d',' -f 2) # Date is in the first field
		# Get Time
		TIME=$(echo $assignment | cut -d',' -f 3) # Time is in the first field
		# Get Class
		CLASS=$(echo $assignment | cut -d',' -f 4) # Class is in the first field
		# Get Difficulty
		DIFFICULTY=$(echo $assignment | cut -d',' -f 5) # Difficulty is in the first field
		# Get Status
		STATUS=$(echo $assignment | cut -d',' -f 6) # Status is in the first field

		# Begin loop to change the fields
		while true; do
			echo ""
			echo "Select a field you wish to change."
			echo "Enter 1 to change the date."
			echo "Enter 2 to change the time."
			echo "Enter 3 to change the class."
			echo "Enter 4 to change the difficulty."
			echo "Enter 5 to change the status."
			echo -n "Please enter 1-5 or enter anything else to exit. "
			read choice;
			case "$choice" in
				1)
					echo -n "Please enter the assignment date (mm/dd/yy): "
					read DATE
					;;
				2)
					echo -n "Please enter the time the assignment is due (hour:minutes AM/PM): "
					read TIME
					;;
				3)
					echo -n "Please enter the name of the class: "
					read CLASS
					;;
				4)
					echo -n "Please enter the difficulty of the assignment ( 1 easy - 5 hard )"
					read DIFFICULTY
					;;
				5)
					echo -n "Please enter the status ( Open or Closed): "
					read STATUS
					;;
				*)
					echo "Done"
					break
			esac
		done

                line="$ID,$DATE,$TIME,$CLASS,$DIFFICULTY,$STATUS"
		# Replace the old line with the new line
                sed -i "s~$assignment~$line~" ahss

	else
		# Can't find the assignment
		echo "There is no assignment with that ID."

	fi

	echo -n "Are you done with data entry? "; read finish
	if test $finish = 'y'
	then
		break
	fi
done

clear
