#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"
GUESSES_TAKEN=0
RANDOM_NUMBER=$(( (RANDOM % 1000) + 1 ))
echo $RANDOM_NUMBER



echo -e "\n~~ Number Guessing Game ~~\n"
echo "Enter your username:"
read USERNAME
# query database for user
USERINFO=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
if [[ -z $USERINFO ]]
then
INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
echo $USERINFO | while IFS='|' read USERID USER_NAME GAMES_PLAYED BEST_GAME
do
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
done
fi


UPDATE_GAMES() {
  GET_INFO=$($PSQL "SELECT games_played,best_game FROM users WHERE username='$USERNAME'")
  CURRENT_GAME=$1
  echo $GET_INFO | while IFS='|' read GAMES_PLAYED BEST_GAME
  do
    UPDATED_GAMES_PLAYED=$((GAMES_PLAYED + 1))
    if (( CURRENT_GAME < BEST_GAME || BEST_GAME == 0 ))
    then UPDATED_BEST_GAME=$CURRENT_GAME
    else UPDATED_BEST_GAME=$BEST_GAME
    fi
    UPDATE_GAMES_RESULT=$($PSQL "UPDATE users SET games_played=$UPDATED_GAMES_PLAYED, best_game=$UPDATED_BEST_GAME WHERE username='$USERNAME'")
  done
}


TAKE_GUESS () {
  echo -e "$1"
  read NUMBER_GUESS
  #check if integer
  if [[ $NUMBER_GUESS =~ ^-?[0-9]+$ ]]
  then
    ((GUESSES_TAKEN++))
    if [[ $NUMBER_GUESS -eq $RANDOM_NUMBER ]]
    then
      UPDATE_GAMES $GUESSES_TAKEN
      return
    else
      if [[ $NUMBER_GUESS -lt $RANDOM_NUMBER ]]
      then
        TAKE_GUESS "It's higher than that, guess again:"
      fi
      if [[ $NUMBER_GUESS -gt $RANDOM_NUMBER ]]
      then TAKE_GUESS "It's lower than that, guess again:"
      fi
    fi
  else TAKE_GUESS "That is not an integer, guess again:"
  fi

}


TAKE_GUESS "Guess the secret number between 1 and 1000:"
echo "You guessed it in $GUESSES_TAKEN tries. The secret number was $NUMBER_GUESS. Nice job!"