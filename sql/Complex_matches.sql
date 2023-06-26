CREATE TABLE Stadiums(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    seats INT
);

CREATE TABLE Countries(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    short_name VARCHAR(3)
);

CREATE TABLE TEAMS(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    country INT,
    CONSTRAINT FK_Teams_Country FOREIGN KEY (country)
    REFERENCES Countries(id)
);

CREATE TABLE Matches(
    id SERIAL PRIMARY KEY,
    stadium INT,
    winner INT,
    date DATE,
    CONSTRAINT FK_Matches_Stadiums FOREIGN KEY (stadium)
    REFERENCES Stadiums(id),
    CONSTRAINT FK_Matches_Teams FOREIGN KEY (winner)
    REFERENCES Teams(id)
);

INSERT INTO Stadiums (name, seats)
VALUES('Al Bayt', 67372), ('Halifa', 45334);

INSERT INTO Countries(name, short_name)
VALUES ('Qatar','QAT'), ('Ecuador','ECU'), ('Anglia', 'GBR'), ('Iran', 'IRN');

INSERT INTO Teams (name, country)
VALUES ('Qatar', 1), ('Ecuador',2), ('Anglia',3), ('Iran', 4);

INSERT INTO Matches(stadium, winner, date)
VALUES(1,2,'2022-11-20'), (2,3,'2022-11-21');

ALTER TABLE Matches
ADD Goals INT;

SELECT * FROM Matches;

UPDATE Matches
SET goals = 6
WHERE winner = 3;

SELECT * FROM Matches;

UPDATE Matches
SET goals = 2
WHERE winner = 2;

SELECT Teams.name, Countries.*, Matches.goals, Matches.date FROM Teams
JOIN Countries
ON Teams.country = Countries.id
JOIN Matches
ON Teams.id = Matches.winner;
ORDER BY Matches.goals ASC;

SELECT stadium, COUNT(stadium) AS staff_number FROM matches
GROUP BY stadium;