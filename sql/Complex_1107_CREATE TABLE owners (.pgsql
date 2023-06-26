CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

SELECT * FROM owners;

CREATE TABLE auto (
    id SERIAL PRIMARY KEY,
    licencePlate VARCHAR(6),
    type VARCHAR(30),
    owner_id INT,
    CONSTRAINT FK_AutoOwner FOREIGN KEY (owner_id)
    REFERENCES owners(id)
);

SELECT * FROM auto;

CREATE TABLE race(
    id SERIAL PRIMARY KEY,
    auto_id INT,
    place INT,
    city VARCHAR(30)
);

ALTER TABLE race
ADD CONSTRAINT FK_raceAuti
FOREIGN KEY (auto_id)
REFERENCES auto(id);

SELECT * FROM race;

INSERT INTO owners (name) VALUES
('Csiga Csanád'), ('Turbó Rudi');

INSERT INTO auto (licenceplate, type, owner_id)
VALUES ('ABC123', 'Mazda', 2),
('DEF456', 'Trabant', 1);

INSERT INTO race (auto_id, place, city) VALUES
(1,6, 'Tokyo'), (2,1, 'Tokyo');

ALTER TABLE race 
ADD Date DATE;


SELECT * FROM race;

UPDATE race
SET Date = '2022-11-07';

UPDATE race
SET Date = '2022-11-06'
WHERE race.id = 1;

SELECT * FROM race
ORDER BY id ASC;

SELECT owners.name, auto.type, auto.licenceplate, race.place, race.city, race.Date AS Race_date
FROM owners
INNER JOIN auto ON owners.id = auto.owner_id
INNER JOIN race ON auto.id = race.id;