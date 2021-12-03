#!/bin/bash

# assignmentsDue ()
# Author: Owen Wurster
# Searches for assignments that are due based on today's date
assignments_Due() {

	clear

	# Used to keep track of the total amount of assingments that are due today
	COUNTER=0

	# Used to search by current date
	d=$(date +%D)
	# Used to search by hard coded date ( For testing )
	# d="12/07/21"

	echo "Today's date is: $d"
	echo "Assignments due today:"

	# Find assignments that are due today
	while read -r line
	do
		# If the record has a matching date, process and output
		if [[ $line = *$d* ]]
		then
			# Increment COUNTER
			let COUNTER++

			# Get the time the assignment is due
			TIME=$(echo $line | cut -d',' -f 3) # Time is in the third field

			# Get the class the assignment is from
			CLASS=$(echo $line | cut -d',' -f 4) # Class is in the fourth field

			# Output data
			echo "An assignment in: $CLASS, due at: $TIME."
		fi
	done < ahss # ahss is the input file

	# Output total amount of assignments that are due today
	if [[ $COUNTER = 0 ]]
	then
		echo "There are no assignments due today."
	else
		echo "There are $COUNTER assignments due today."
	fi

	echo ""
	echo ""
	echo "Enter any key to return to the menu"
	read finished

	clear
}
# show_Incomplete_Assignment()
# Author: Anten Manuuel
# this function shows Incomplete assignments based on the status
show_Incomplete_Assignment() {
	clear
	COUNTER=0
	s="Open"

	echo "Incomplete Assignments: "

	while read -r line
	do
		if [[ $line = *$s* ]]
		then
			let COUNTER++
			ASSIGNMENTID=$(echo $line | cut -d',' -f 1)
			DATE=$(echo $line | cut -d',' -f 2)
			# Get the time the assignment is due
			TIME=$(echo $line | cut -d',' -f 3) # Time is in the third field

			# Get the class the assignment is from
			CLASS=$(echo $line | cut -d',' -f 4) # Class is in the fourth field

			echo "Assignment ID: $ASSIGNMENTID, Due Date: $DATE, Due Date Time:$TIME, Class Name:$CLASS "
		fi
	done < ahss
	if [[ $COUNTER = 0 && $s = "Closed" ]]
	then
		echo "There are no incomplete assignments"
	else
		echo "There are $COUNTER incomplete assignments"	
	fi
	echo ""
	echo ""
	echo "Enter any key to return to menu"
	read done

	clear
}

# add_assignment()
# Author: Anten Manuuel
# adds an assignment if the ID doesn't exist, if it does then it won't add any new record to prevent duplication
add_assignment() {
	while : clear
	do
		echo -n "Please enter assignment ID: "
		read assignmentID
		output=$(grep $assignmentID ./ahss)

		if [ ! -z "$output" ]
		then
			echo -e "The assignment ID is already in the record.\n$output."
			sleep 3
			clear
		else
			echo -n "Please enter the assignment Date (month/day/year): "
			read d
			echo -n "Please enter the time the assignment is due(hour:minutes AM/PM): "
			read time
			echo -n "Please enter the name of the class: "
			read class
			echo -n "Please enter the difficulty of the assigment on the scale of 1-5:"
			read diff
			echo -n "Please enter the status(Open or Close): "
			read s

			line="$assignmentID,$d,$time,$class,$diff,$s"
                 	echo $line >> ./ahss

        	fi
		echo -n "Are you done with data entry? "; read finish
		if test $finish = 'y'
		then
			break
		fi
	done

}
