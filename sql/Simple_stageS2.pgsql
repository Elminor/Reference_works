CREATE TABLE stageS2(
    id INT primary key,
    stageName VARCHAR(150),
    size INT
);
SELECT * FROM stages2;
INSERT INTO stageS2 VALUES (1, 'Kacat Nagyszinpad', 5000);
SELECT * FROM stages2;
INSERT INTO stageS2 VALUES (2, 'Kacat Nagyszinpad', 2000);
SELECT * FROM stages2;

UPDATE stageS2 SET stageName = 'Vivi nagyszinpad' WHERE id = 2;
SELECT * FROM stages2;

CREATE TABLE concerts(
    id SERIAL PRIMARY KEY,
    rating INT
);
INSERT INTO concerts (rating) VALUES (5);
INSERT INTO concerts (rating) VALUES (4);
SELECT * FROM concerts;

ALTER TABLE concerts ADD showDate DATE;
UPDATE concerts SET showDate = '2022-08-30' WHERE id = 1;
SELECT * FROM concerts;


SELECT * FROM concerts ORDER BY id ASC;
SELECT * FROM concerts ORDER BY id DESC;

ALTER TABLE concerts DROP rating;
SELECT * FROM concerts;