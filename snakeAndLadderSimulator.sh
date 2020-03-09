#!/bin/bash -x
echo "Welcome to Snakes and Ladders Simulator"

# VARIBLES
position=0

# FUNCTION TO CHECK FOR OPTIONS (NO PLAY, LADDER AND SNAKE)
function OptionCheck () {
	noPlay=0
	ladder=1
	snake=2
	dieRoll=$((RANDOM%6+1))	# ROLL A DIE
	check=$((RANDOM%3))
	case $check in
		$noPlay )
			position=0			# NO PLAY
			;;
		$ladder )
			position=$((position+dieRoll))	# LADDER
			;;
		$snake )
			position=$((position-dieRoll))	# SNAKE
			if [[ $position -lt 0 ]]
			then
				position=0
			else
				echo "$position"
			fi
			;;
	esac
}

while [[ $position -le 100 ]]
do
	OptionCheck	# CALLING THE FUNCTION
done
