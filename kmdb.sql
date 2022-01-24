-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)





-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS topcasts;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS Roles;

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_title TEXT,
  Release_Year INTEGER,
  MPAA_rating TEXT,
  director TEXT 
);

CREATE TABLE topcasts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  people_id INTEGER,
  Role_id INTEGER
);

CREATE TABLE people (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  people_name TEXT
);

CREATE TABLE Roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  Role_name TEXT
);



-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
INSERT INTO movies 
VALUES(1,'Batman Begins',2005,'PG-13','Christopher Nolan');
INSERT INTO movies 
VALUES(2,'The Dark Knight',2008,'PG-13','Christopher Nolan');
INSERT INTO movies 
VALUES(3,"The Dark Knight Rises",2012,'PG-13','Christopher Nolan');

INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(1,1,1,1);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(2,1,2,2);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(3,1,3,3);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(4,1,4,4);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(5,1,5,5);

INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(6,2,1,1);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(7,2,6,6);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(8,2,7,7);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(9,2,2,2);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(10,2,8,4);

INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(11,3,1,1);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(12,3,5,5);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(13,3,9,8);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(14,3,10,9);
INSERT INTO topcasts (id, movie_id, people_id, Role_id)
VALUES(15,3,11,10);

INSERT INTO people 
VALUES(1,'Christian Bale');
INSERT INTO people 
VALUES(2,'Michael Caine');
INSERT INTO people 
VALUES(3,"Liam Neeson");
INSERT INTO people 
VALUES(4,"Katie Holmes");
INSERT INTO people 
VALUES(5,"Gary Oldman");
INSERT INTO people 
VALUES(6,"Heath Ledger");
INSERT INTO people 
VALUES(7,"Aaron Eckhart");
INSERT INTO people 
VALUES(8,"Maggie Gyllenhaal");
INSERT INTO people 
VALUES(9,"Tom Hardy");
INSERT INTO people 
VALUES(10,"Joseph Gordon-Levitt");
INSERT INTO people 
VALUES(11,"Anne Hathaway");


INSERT INTO Roles 
VALUES(1,'Bruce Wayne');
INSERT INTO Roles 
VALUES(2,'Alfred');
INSERT INTO Roles 
VALUES(3,"Ra's Al Ghul");
INSERT INTO Roles 
VALUES(4,"Rachel Dawes");
INSERT INTO Roles 
VALUES(5,"Commissioner Gordon");
INSERT INTO Roles 
VALUES(6,"Joker");
INSERT INTO Roles 
VALUES(7,"Harvey Dent");
INSERT INTO Roles 
VALUES(8,"Bane");
INSERT INTO Roles 
VALUES(9,"John Blake");
INSERT INTO Roles 
VALUES(10,"Selina Kyle");


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

.width 30 4 5 30

SELECT  movie_title,
  Release_Year,
  MPAA_rating,
  director 
FROM movies  ;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output
-- TODO!
.width 30 20 20

SELECT movie_title, 
people_name, 
Role_name 
 from topcasts as a 
left join movies as b  
  on b.id = a.movie_id
left join people as c 
  on c.id =a.people_id
left join Roles as d  
  on d.id = a.Role_id;
