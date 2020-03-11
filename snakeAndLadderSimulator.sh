#!/bin/bash -x
echo "Welcome to Snakes and Ladders Simulator"

# VARIBLES
position=0
dieRollCount=0

# FUNCTION TO CHECK FOR OPTIONS (NO PLAY, LADDER AND SNAKE)
function PositionCount () {
	((dieRollCount++))
	check=$((RANDOM%3))
	noPlay=0
	ladder=1
	snake=2
	dieRoll=$((RANDOM%6+1))	# ROLL A DIE
	case $check in
		$noPlay )
			position=$position			# NO PLAY
			;;
		$ladder )
			position=$((position+dieRoll))	# LADDER
			if [[ $position -gt 100 ]]
			then
				position=$(($position-$dieRoll))
			fi
			;;
		$snake )
			position=$((position-dieRoll))	# SNAKE
			if [[ $position -lt 0 ]]
			then
				position=0
			fi
			;;
	esac
	count=$dieRollCount
}
# CONDITION TO CHECK THE EXACT 100TH POSITION
while [[ $position -lt 100 ]]
do
	PositionCount	# CALLING THE FUNCTION
	dieRollTimes=$count
	positionAfterDieRoll=$position
done
