DROP TABLE IF EXISTS jams;
DROP TABLE IF EXISTS fruits;
DROP TABLE IF EXISTS people;

CREATE TABLE fruits (
    id SERIAL2 PRIMARY KEY,
    fruit_name VARCHAR(30)
);

CREATE TABLE people (
    id SERIAL2 PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE jams (
    id SERIAL2 PRIMARY KEY,
    fruit_id INT2,
    people_id INT2,
    quantity INT2
);

ALTER TABLE jams
ADD CONSTRAINT FK_jams_fruits FOREIGN KEY (fruit_id) REFERENCES fruits(id);

ALTER TABLE jams
ADD CONSTRAINT FK_jams_people FOREIGN KEY (people_id) REFERENCES people(id);


INSERT INTO fruits (fruit_name) VALUES
('eper'), ('meggy'), ('barack'), ('szeder');

INSERT INTO people (name) VALUES ('nagyi'), ('papi'), ('Magdi');
INSERT INTO jams (fruit_id, people_id, quantity) VALUES
(2, 1, 15),
(1, 3, 5),
(3, 2, 2),
(4, 3, 5),
(1, 1, 68);


UPDATE jams SET quantity = 12 WHERE quantity = 68;

SELECT * FROM jams;
SELECT * FROM fruits;
SELECT * FROM people;

SELECT jams.*, people.name FROM jams INNER JOIN people ON jams.people_id = people.id;


SELECT jams.fruit_id, jams.quantity, people.name FROM jams 
INNER JOIN people ON jams.people_id = people.id;

SELECT fruits.fruit_name, jams.quantity, people.name FROM jams 
INNER JOIN people ON jams.people_id = people.id
JOIN fruits ON jams.fruit_id = fruits.id;

SELECT people.name, SUM(jams.quantity) AS Total FROM jams JOIN people ON jams.people_id = people.id
WHERE people.name = 'nagyi'
GROUP BY people.name;

SELECT jams.people_id, COUNT(jams.fruit_id) FROM jams
GROUP BY jams.people_id
HAVING people_id = 3;

SELECT jams.people_id, people.name, COUNT(jams.fruit_id) FROM jams
JOIN people ON jams.people_id = people.id
GROUP BY jams.people_id, people.name
HAVING people_id = 3;


SELECT  people.name, COUNT(jams.fruit_id) FROM jams
JOIN people ON jams.people_id = people.id
WHERE people.id = 3
GROUP BY people.name;


SELECT people.name, SUM(jams.quantity) AS quantity FROM jams
JOIN people ON jams.people_id = people.id
GROUP BY people.name;


SELECT people.name, SUM(jams.quantity) AS quantity FROM jams
JOIN people ON jams.people_id = people.id
GROUP BY people.name
ORDER BY quantity DESC;


SELECT people.name, SUM(jams.quantity) AS quantity FROM jams
JOIN people ON jams.people_id = people.id
GROUP BY people.name
ORDER BY people.name ASC, quantity DESC;