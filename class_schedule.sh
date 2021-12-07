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
