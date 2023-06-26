CREATE TABLE drinks(
    id SERIAL PRIMARY KEY,
    drinkName VARCHAR(200),
    wine    INT,
    water   INT,
    price   INT
);
ALTER TABLE drinks
ADD wineType VARCHAR(200);
SELECT * FROM drinks;

INSERT INTO drinks(drinkName, wine, water, price, wineType) VALUES ('harmat', 10, 0, 1000, 'Irsai');
INSERT INTO drinks(drinkName, wine, water, price, wineType) VALUES ('sportFroccs', 1, 4, 500, 'Irsai');
INSERT INTO drinks(drinkName, wine, water, price, wineType) VALUES ('sportFroccs', 1, 4, 600, 'Egri Bikaver');
INSERT INTO drinks(drinkName, wine, water, price, wineType) VALUES ('Vice hazmester', 2, 3, 700, 'Egri Leanyka');
SELECT * FROM drinks;

SELECT * , wine+water AS volume FROM drinks;

SELECT drinkName AS froccs, wine, water, price, wineType, wine+water AS volume FROM drinks;

SELECT * FROM drinks WHERE wineType LIKE '%Egri%';

SELECT * FROM drinks;

SELECT drinkName, ROUND(AVG(price),2) AS averagPrice FROM drinks GROUP BY drinkName;
SELECT drinkName, MIN(price) AS minimumPrice FROM drinks GROUP BY drinkName;
SELECT drinkName, MIN(price) AS minimumPrice FROM drinks GROUP BY drinkName HAVING drinkName = 'sportFroccs';
SELECT drinkName, ROUND(AVG(price),0) AS AVG FROM drinks GROUP BY drinkName HAVING ROUND(AVG(price),0) < 600;
SELECT drinkName, ROUND(AVG(price),0) AS AVG FROM drinks WHERE drinkName = 'Vice hazmester' GROUP BY drinkName HAVING ROUND(AVG(price),0) < 800;
SELECT drinkName, wineType, avg(price) AS avg FROM drinks GROUP BY drinkName, wineType;

SELECT COUNT(wineType), drinkName FROM drinks GROUP BY drinkName;
SELECT COUNT(wineType) AS db, drinkName FROM drinks GROUP BY drinkName ORDER BY db asc;
SELECT COUNT(wineType) AS db, drinkName FROM drinks GROUP BY drinkName HAVING COUNT(wineType) >= 2 ORDER BY db asc;

SELECT * FROM drinks WHERE drinkName = 'harmat' OR drinkName = 'sportFroccs';
SELECT * FROM drinks WHERE drinkName IN ('harmat', 'sportFroccs');

CREATE TABLE types(
    id SERIAL PRIMARY KEY,
    type VARCHAR(200)
);

INSERT INTO types(type) VALUES ('sport'), ('harmat');
SELECT * FROM types;
INSERT INTO types(type) VALUES ('sportFroccs');
SELECT * FROM types;

SELECT * FROM drinks WHERE drinkName IN (SELECT type FROM types);

ALTER TABLE drinks ADD crrentdate date;
UPDATE drinks SET date=now();


SELECT * FROM drinks;
