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
echo "Enter 5 ti update an assignment"
echo -n "Please enter 1-5: "
read choice;
case "$choice" in
        1)
                echo "$(ifconfig -a | egrep 'inet\s')"
                echo ""
                ;;
        2)
                echo "$(who)"
                echo ""
                ;;
        3)
                echo "$(date)"
                echo ""
                ;;
	4)
		echo "$()"
		echo ""
		;;
	5)
		echo "$()"
		echo ""
		;;

        *)
                echo "Exit"
                exit 1

esac
done

