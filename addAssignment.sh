#!/bin/bash

while : clear
do
	echo -n "Please enter assignment ID: "
	read assignmentID
	output=$(grep $assignmentID ./ahss)
	
	if [ ! -z "$output" ]
	then 
		echo -e "The assignment id is already in record.\n$output."
		sleep 3
		clear
	else 
		#Data entry
		echo -n "Please enter the assignment ID: "
		read assignmentID
		echo -n "Please enter the assignment Date (month/day): "
		read date
		echo -n "Please enter the time the assignment is due(hour:minutes AM/PM): "
		read time
		echo -n "Please enter the name of the class: "
		read class
		echo -n "Please enter the difficulty of the assigment on the scale of 1-5:"
		read diff
		echo -n "Please enter the status(Open or Close): "
		read status 
		
		
		line="$assignmentID,$date,$time,$class,$diff,$status"
                echo $line >> ./ahss

        fi

        # exit the loop
        echo -n "Are you done with data entry? "; read finish

        if test $finish = 'y'
        then
                clear; exit
        fi
done


