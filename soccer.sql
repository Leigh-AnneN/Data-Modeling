soccer.sql
CREATE DATABASE soccer_league 

 

CREATE TABLE teams( 
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL UNIQUE, 
    city TEXT NOT NULL UNIQUE 
); 

CREATE TABLE referees ( 
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL UNIQUE 
); 

 

CREATE TABLE season ( 
    id SERIAL PRIMARY KEY, 
    start_date DATE NOT NULL, 
    end_date DATE NOT NULL 
); 

 

CREATE TABLE players ( 
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL UNIQUE, 
    birthday DATE NOT NULL, 
    height TEXT, 
    current_team_id INTEGER REFERENCES teams ON DELETE CASCADE 
); 

CREATE TABLE matches ( 
    id SERIAL PRIMARY KEY, 
    home_team_id INTEGER REFERENCES teams ON DELETE CASCADE, 
    away_team_id INTEGER REFERENCES teams ON DELETE CASCADE, 
    location TEXT NOT NULL 
    date DATE NOT NULL, 
    start_time ?? 
    season_id INTEGER REFERENCES season ON DELETE CASCADE, 
    head_ref_id INTEGER REFERENCES referees ON DELETE CASCADE, 
    assist_ref_id_1 INTEGER REFERENCES referees ON DELETE CASCADE, 
    assist_ref_id_2 INTEGER REFERENCES referees ON DELETE CASCADE 
); 

 

CREATE TABLE goals( 
    id SERIAL PRIMARY KEY, 
    match_id INTEGER REFERENCES matches ON DELETE CASCADE, 
    player_id  INTEGER REFERENCES players ON DELETE CASCADE 
); 


CREATE TABLE results( 
    id SERIAL PRIMARY KEY, 
    team_id INTEGER REFERENCES teams ON DELETE CASCADE, 
    match_id  INTEGER REFERENCES matches ON DELETE CASCADE, 
    result TEXT  
); 


CREATE TABLE lineups( 
    id SERIAL PRIMARY KEY, 
    playerid  INTEGER REFERENCES players ON DELETE CASCADE, 
    match_id  INTEGER REFERENCES matches ON DELETE CASCADE, 
    team_id INTEGER REFERENCES teams ON DELETE CASCADE 
); 

 