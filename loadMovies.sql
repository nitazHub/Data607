-- loadmovies.sql

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS gross;
DROP TABLE IF EXISTS theaters;
DROP TABLE IF EXISTS dates;
DROP TABLE IF EXISTS ratings;

CREATE TABLE movies (
  movieID INT NOT NULL auto_increment,
  title varchar(100) NOT NULL,
  primary key(movieID)
  );

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies2018.csv'
INTO TABLE movies 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE gross (
 id int auto_increment,
 gross int,
 movieId int,
 primary key (id),
 FOREIGN KEY (movieId)
	REFERENCES movies(movieID)
    ON DELETE CASCADE
  );
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/moviesGross.csv' 
INTO TABLE gross
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE theaters (
id int auto_increment,
theatres int,
movieId int,
primary key (id),
foreign key (movieId)
references movies(movieID)
ON delete cascade
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/moviesTheaters.csv' 
INTO TABLE theaters
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

CREATE TABLE dates (
id int auto_increment,
openDt date,
closeDt date,
movieId int,
primary key (id),
foreign key (movieId)
references movies(movieID)
ON delete cascade
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/moviesDates.csv' 
INTO TABLE dates
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

CREATE TABLE ratings (
id int auto_increment,
rating int,
movieId int,
primary key (id),
foreign key (movieId)
references movies(movieID)
ON delete cascade
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/moviesReviews.csv' 
INTO TABLE ratings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

SET SQL_SAFE_UPDATES = 0;

SELECT 'movies', COUNT(*) FROM movies
  UNION
SELECT 'gross', COUNT(*) FROM gross
  UNION
SELECT 'theaters', COUNT(*) FROM theaters
  UNION
SELECT 'dates', COUNT(*) FROM dates
  UNION
SELECT 'ratings', COUNT(*) FROM ratings;

