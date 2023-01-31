codeally@fa6f31c8eb00:~/project$ psql --username=freecodecamp --dbname=postgres
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> create database worldcup;
CREATE DATABASE
postgres=> \c worldcup;
You are now connected to database "worldcup" as user "freecodecamp".
worldcup=> create table teams (team_id serial primary key, name varchar(80) not null);
CREATE TABLE
worldcup=> create table games (game_id serial primary key, year int not null, round varchar(80) not null, winner_id int not null, opponent_id int not null);
CREATE TABLE
worldcup=> alter table games add foreign key(winner_id) references teams(team_id);
ALTER TABLE
worldcup=> alter table games add foreign key(opponent_id) references teams(team_id);
ALTER TABLE
worldcup=> alter table games add column winner_goals int not null;
ALTER TABLE
worldcup=> alter table games add column opponent_goals int not null;
ALTER TABLE
worldcup=> alter table teams add constraint name_teams_key VARCHAR(50) unique (name);
ERROR:  syntax error at or near "VARCHAR"
LINE 1: alter table teams add constraint name_teams_key VARCHAR(50) ...
                                                        ^
worldcup=> alter table teams add constraint name_teams_key unique (name);
ALTER TABLE
worldcup=> \d teams
                                      Table "public.teams"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 team_id | integer               |           | not null | nextval('teams_team_id_seq'::regclass)
 name    | character varying(80) |           | not null | 
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)
    "name_teams_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "games" CONSTRAINT "games_opponent_id_fkey" FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    TABLE "games" CONSTRAINT "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)

codeally@fa6f31c8eb00:~/project$ chmod +x insert_data.sh
codeally@fa6f31c8eb00:~/project$ chmod +x queries.sh
codeally@fa6f31c8eb00:~/project$ ./insert_data.sh
TRUNCATE TABLE
Inserted into teams, France
Inserted into teams, Croatia
Inserted game_id \o/
Inserted into teams, Belgium
Inserted into teams, England
Inserted game_id \o/
Inserted game_id \o/
Inserted game_id \o/
Inserted into teams, Russia
Inserted game_id \o/
Inserted into teams, Sweden
Inserted game_id \o/
Inserted into teams, Brazil
Inserted game_id \o/
Inserted into teams, Uruguay
Inserted game_id \o/
Inserted into teams, Colombia
Inserted game_id \o/
Inserted into teams, Switzerland
Inserted game_id \o/
Inserted into teams, Japan
Inserted game_id \o/
Inserted into teams, Mexico
Inserted game_id \o/
Inserted into teams, Denmark
Inserted game_id \o/
Inserted into teams, Spain
Inserted game_id \o/
Inserted into teams, Portugal
Inserted game_id \o/
Inserted into teams, Argentina
Inserted game_id \o/
Inserted into teams, Germany
Inserted game_id \o/
Inserted into teams, Netherlands
Inserted game_id \o/
Inserted game_id \o/
Inserted game_id \o/
Inserted into teams, Costa Rica
Inserted game_id \o/
Inserted game_id \o/
Inserted game_id \o/
Inserted game_id \o/
Inserted into teams, Chile
Inserted game_id \o/
Inserted game_id \o/
Inserted into teams, Nigeria
Inserted game_id \o/
Inserted into teams, Algeria
Inserted game_id \o/
Inserted game_id \o/
Inserted into teams, Greece
Inserted game_id \o/
Inserted game_id \o/
Inserted into teams, United States
Inserted game_id \o/



codeally@fa6f31c8eb00:~/project$ ./queries.sh

Total number of goals in all games from winning teams:
68

Total number of goals in all games from both teams combined:
90

Average number of goals in all games from the winning teams:
2.1250000000000000

Average number of goals in all games from the winning teams rounded to two decimal places:
2.13

Average number of goals in all games from both teams:
2.8125000000000000

Most goals scored in a single game by one team:
7

Number of games where the winning team scored more than two goals:
6

Winner of the 2018 tournament team name:
France

List of teams who played in the 2014 'Eighth-Final' round:
Algeria
Argentina
Belgium
Brazil
Chile
Colombia
Costa Rica
France
Germany
Greece
Mexico
Netherlands
Nigeria
Switzerland
United States
Uruguay

List of unique winning team names in the whole data set:
Argentina
Belgium
Brazil
Colombia
Costa Rica
Croatia
England
France
Germany
Netherlands
Russia
Sweden
Uruguay

Year and team name of all the champions:
2014|Germany
2018|France

List of teams that start with 'Co':
Colombia
Costa Rica
codeally@fa6f31c8eb00:~/project$ 
