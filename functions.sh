#!/bin/bash


# ======================  Menu option 1 ===================== #
# class_schedule()                                            #
# Author: Ca'Marai Clyburn                                    #
# Displays classes depending on what day today is             #
# ============================================================#
class_schedule() {

	clear
	
	day=$(date +%A)
	d=$(date +%D)

	echo "Today is: " $day" " $d
	echo -n "You have "

	grep $day classSchedule | cut -d ',' -f 2,5

	echo ""
	echo ""
	typewriter "Enter any key to return to the menu" .05
        read finished

	clear


}




# ======================  Menu option 2 ===================== #
# assignments_due()					      #
# Author: Owen Wurster					      #
# Searches for assignments that are due based on today's date #
# ============================================================#
assignments_due() {

	clear
	echo ""

	# Used to keep track of the total amount of assingments that are due today
	COUNTER=0

	# Used to search by current date
	d=$(date +%D)
	# Used to search by hard coded date ( For testing )
	# d="12/07/21"

	typewriter "Today's date is: $d" .05
	typewriter "Assignments due today:" .05

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
			# Get the difficulty of the assignment
			DIFFICULTY=$(echo $line | cut -d',' -f 5) # Difficulty is in the fifth field

			# Output data
			typewriter "An assignment in: $CLASS, due at: $TIME, with a difficulty of: $DIFFICULTY." .05
		fi
	done < ahss # ahss is the input file

	# Output total amount of assignments that are due today
	if [[ $COUNTER = 0 ]]
	then
		typewriter "There are no assignments due today." .05
	elif [[ $COUNTER = 1 ]]
	then
		typewriter "There is $COUNTER assignment due today." .05
	else
		typewriter "There are $COUNTER assignments due today." .05
	fi

	echo ""
	echo ""
	typewriter "Enter any key to return to the menu" .05
	read finished

	clear
}

# ======================= Menu option 3  ======================= #
# show_Incomplete_Assignment()					 #
# Author: Anten Manuuel						 #
# This function shows Incomplete assignments based on the status #
# ============================================================== #
show_Incomplete_Assignment() {
	clear
	echo ""
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

# =============================================== Menu option 4  =============================================== #
# add_assignment()												 #
# Author: Anten Manuuel												 #
# Adds an assignment if the ID doesn't exist, if it does then it won't add any new record to prevent duplication #
# ============================================================================================================== #
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

# ==================== Menu option 5 ==================== #
# edit_assignments()					  #
# Author: Owen Wurster					  #
# Allows the user to edit various fields of an assignment #
# ======================================================= #
edit_assignments () {
	while : clear
	do
		clear
		echo ""
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
}

# PLEASE KEEP AT BOTTOM!!!
#
# typewriter
# outputs lines one character at a time
#
# How to use
# Example: typewriter "Hello World" .1
# The typewriter portion calls the function
# The text in the "" is what will be printed
# The number at the end is the delay between each character ( 1 being a one second delay, .1 being a one tenth of a second delay )
function typewriter {
    text="$1"
    delay="$2"

    for i in $(seq 0 $(expr length "${text}")) ; do
        echo -n "${text:$i:1}"
        sleep ${delay}
    done

    echo ""
}
