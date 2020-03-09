#!/bin/bash -x
echo "Welcome to Snakes and Ladders Simulator"

# CONSTANTS
noPlay=0
ladder=1
snake=2

# VARIBLES
position=0

# ROLL A DIE
dieRoll=$((RANDOM%6+1))
check=$((RANDOM%3))
# FUNCTION TO CHECK FOR OPTIONS (NO PLAY, LADDER AND SNAKE)
function OptionCheck () {
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
      	fi
			;;
	esac
}
OptionCheck	# CALLING THE FUNCTION
