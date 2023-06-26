CREATE TABLE Bands (
    BandID SERIAL PRIMARY KEY,
    Name VARCHAR (50),
    Email VARCHAR (256)
);

CREATE TABLE Concerts (
    ConcertID SERIAL PRIMARY KEY,
    Stage VARCHAR (30),
    Date DATE,
    BandID INT,
    CONSTRAINT FK_BandID
    FOREIGN KEY (BandID) REFERENCES Bands(BandID)
);

INSERT INTO Bands (Name, Email) VALUES ('Rühös Foxy', 'ruhsfoxy@tomi.com') , ('Csaknekedkislany', 'csaknekedkislany@gmail.com');

SELECT * FROM Bands;

ALTER TABLE Concerts DROP CONSTRAINT FK_BandID;

INSERT INTO Concerts (Stage, Date, BandID) VALUES ('Kacat', NOW(), 1) , ('Döner', NOW(), 3);


SELECT Concerts.*, bands.name 
FROM Concerts LEFT OUTER JOIN bands 
ON Concerts.bandID = bands.bandID;

SELECT Concerts.*, bands.name 
FROM Concerts RIGHT OUTER JOIN bands 
ON Concerts.bandID = bands.bandID;

SELECT Concerts.*, bands.name 
FROM Concerts FULL OUTER JOIN bands 
ON Concerts.bandID = bands.bandID;

SELECT * FROM Bands;
SELECT * FROM Concerts;

SELECT Concerts.*, bands.name 
FROM Concerts INNER JOIN bands 
ON Concerts.bandID = bands.bandID;