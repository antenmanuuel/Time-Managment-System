#!/bin/bash

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
echo "Enter any key to return to the menu."
read finished
