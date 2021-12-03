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
