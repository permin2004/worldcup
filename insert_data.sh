#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams,games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_R=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_R == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi

    # get opponent
  if [[ $OPPONENT != "opponent" ]]
  then
    TEAMID_2=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAMID_2 ]]
    then
      INSERT_TEAM2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM2 == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
      TEAMID_2=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi
  if [[ $YEAR != 'year' ]]
  then
      INSERT_GAME_ID=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID, $TEAMID_2, $WINNER_GOALS, $OPPONENT_GOALS)")
      if [[ $INSERT_GAME_ID == "INSERT 0 1" ]]
      then
      echo Inserted game_id '\o/'
      fi
  fi
done


