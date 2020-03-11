#!/bin/bash -x
echo "Welcome to Snakes and Ladders Simulator"

# CONSTANTS
noPlay=0
ladder=1
snake=2

# VARIBLES
position=0							# DEFAULT POSITION
position1=0							# PLAYER1's POSITION
position2=0							# PLAYER2's POSITION

# FUNCTION TO PLAY THE GAME
function gamePlay () {
	position=$1
	check=$((RANDOM%3))					# CHECK FOR OPTIONS (NO PLAY, LADDER AND SNAKE)
	dieRoll=$((RANDOM%6+1))					# ROLL A DIE
	case $check in
		$noPlay )
			position=$position 			# NO PLAY
			;;
		$ladder )
			position=$((position+dieRoll))		# LADDER
			if [[ $position -gt 100 ]]
			then
				position=$((position-dieRoll))
			fi
			;;
		$snake )
			position=$((position-dieRoll))		# SNAKE
			if [[ $position -lt 0 ]]
			then
				position=0
			fi
			;;
	esac
	echo "$position"
}

# REPEAT TILL ANY PLAYER REACHES THE WINNING POSITION 100
while [[ $position1 -lt 100 && $position2 -lt 100 ]]
do
	position1=$(gamePlay $position1)
	position2=$(gamePlay $position2)
done

# CONDITION TO DECLARE WIN IF ANY PLAYER REACHES 100TH POSITION
if [[ $position1 -eq 100 ]]
then
	player1="win; player1 position:$position1; player2 position:$position2"

# ELSE, DECLARE PLAYER2 AS WINNER
else
	player2="win; player1 position:$position1; player2 position:$position2"
fi
