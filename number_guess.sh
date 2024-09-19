#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USERFOUND=$($PSQL "SELECT name,games_played,best_game FROM games WHERE name='$USERNAME';")
if [[ -z $USERFOUND ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  NEW_USER=1
else 
  NEW_USER=0
  N_GAMES=$($PSQL "SELECT games_played FROM games WHERE name='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE name='$USERNAME';")
  echo "Welcome back, $USERNAME! You have played $N_GAMES games, and your best game took $BEST_GAME guesses."

fi

SECRET_NUMBER=$(($RANDOM % 1000 + 1))
TRIES=0

VALIDATE(){
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    READ_INPUT
  fi
}

READ_INPUT(){

  read GUESS
  VALIDATE $GUESS
  TRIES=$((TRIES + 1))

  if [[ $SECRET_NUMBER -eq $GUESS ]]
  then
    
    N_GAMES=$((N_GAMES + 1))

    if [[ $NEW_USER -eq 1 ]]
    then
      BEST_GAME=$TRIES
      INSERT_DB=$($PSQL "INSERT INTO games(name,games_played,best_game) VALUES('$USERNAME',$N_GAMES,$BEST_GAME);")
    else
      BEST_GAME=$((TRIES<BEST_GAME ? TRIES : BEST_GAME))
      UPDATE_DB=$($PSQL "UPDATE games SET games_played=$N_GAMES,best_game=$BEST_GAME WHERE name='$';")
    fi

    echo -e "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
    exit
  fi
  
  if [[ $SECRET_NUMBER -lt $GUESS ]]
  then
    echo "It's lower than that, guess again:"
    READ_INPUT
  fi
  if [[ $SECRET_NUMBER -gt $GUESS ]]
  then
    echo "It's higher than that, guess again:"
    READ_INPUT
  fi
}

echo "Guess the secret number between 1 and 1000:"
READ_INPUT
