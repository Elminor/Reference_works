DROP TABLE IF EXISTS Flight CASCADE;
DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS city CASCADE;

CREATE TABLE Flight(
        FlightID INT primary key,
        CityFrom INT,
        FlightNo VARCHAR(6)
);

CREATE TABLE Person(
        PersonID INT,
        Name VARCHAR(30),
        Phone VARCHAR(30),
        FlightID INT,
        Seat VARCHAR(4),
        CONSTRAINT FK_FlightID FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

CREATE TABLE city(
    CityID INT PRIMARY KEY,
    Name VARCHAR(50)
);

ALTER TABLE Flight
ADD CONSTRAINT FK_CityID FOREIGN KEY (CityFrom) REFERENCES City(CityID);

INSERT INTO City (CityID, Name)
VALUES (1, 'London'), (2, 'Budapest');

SELECT * FROM City;

INSERT INTO Flight (FlightID, CityFrom, FlightNo)
VALUES (1, 1, 'LON123'), (2, 2, 'BUD456');

SELECT * FROM Flight;

ALTER TABLE Flight
ADD CityTo INT;

ALTER TABLE Flight
ADD CONSTRAINT FK_CityID2 FOREIGN KEY (CityTo) REFERENCES City(CityID);

SELECT * FROM Flight;

UPDATE Flight SET CityTo = 2 WHERE FlightID = 1;
UPDATE Flight SET CityTo = 1 WHERE FlightID = 2;

SELECT Flight.FlightNo, T0.name AS Departure, T1.name AS Arrival,
Person.name, Person.Seat
FROM Flight
INNER JOIN City T0
ON Flight.CityFrom = T0.cityid 
INNER JOIN City T1
ON Flight.CityTo = T1.CityID
INNER JOIN Person ON Flight.FlightID = Person.FlightID;

ALTER TABLE Flight ADD DateFrom DATE;
UPDATE Flight SET DateFrom = '2022-11-01';

ALTER TABLE Flight ADD DateTo DATE;
UPDATE Flight SET DateFrom = '2022-11-01';

ALTER TABLE Flight ADD DateTo DATE Default now();

INSERT INTO Person VALUES (1, 'Janos', '06301234', 1, '55'),
(2, 'Lilla', '0618767', 2, '11');

SELECT * FROM Person;


ALTER TABLE Person DROP Phone;
DELETE FROM Person WHERE name = 'Lilla';

SELECT Flight.FlightNo, T0.name AS Departure, T1.name AS Arrival,
Person.name, Person.Seat
FROM Flight
INNER JOIN City T0
ON Flight.CityFrom = T0.cityid 
INNER JOIN City T1
ON Flight.CityTo = T1.CityID
INNER JOIN Person ON Flight.FlightID = Person.FlightID;

SELECT Flight.FlightNo, T0.name AS Departure, T1.name AS Arrival,
Person.name, Person.Seat
FROM Flight
INNER JOIN City T0
ON Flight.CityFrom = T0.cityid 
INNER JOIN City T1
ON Flight.CityTo = T1.CityID
FULL OUTER JOIN Person ON Flight.FlightID = Person.FlightID;

SELECT Flight.FlightNo, T0.name AS Departure, T1.name AS Arrival,
Person.name, Person.Seat
FROM Flight
INNER JOIN City T0
ON Flight.CityFrom = T0.cityid 
INNER JOIN City T1
ON Flight.CityTo = T1.CityID
LEFT OUTER JOIN Person ON Flight.FlightID = Person.FlightID;




SELECT Flight.FlightNo, T0.name AS Departure, T1.name AS Arrival,
Person.name, Person.Seat
FROM Flight
INNER JOIN City T0
ON Flight.CityFrom = T0.cityid 
INNER JOIN City T1
ON Flight.CityTo = T1.CityID
LEFT OUTER JOIN Person ON Flight.FlightID = Person.FlightID
ORDER BY T0.name DESC;

SELECT Flight.FlightNo FROM Flight WHERE FlightNo LIKE '%12%';

SELECT COUNT(Flight.FlightID) AS TOTAL
FROM Flight;


SELECT DISTINCT COUNT(Flight.FlightNo) AS TOTAL
FROM Flight;

SELECT FlightNo, COUNT(FlightID) AS Járat FROM Flight GROUP BY FlightNo;

SELECT FlightNo, COUNT(FlightID) AS Járat FROM Flight GROUP BY FlightNo HAVING  COUNT(FlightID) <= 1;
