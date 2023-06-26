CREATE TABLE cities(
    name VARCHAR(100),
    postCode INT
)
INSERT INTO cities VALUES ('Nagykanizsa', 8800);
INSERT INTO cities VALUES ('Budapest', 1188);

SELECT * FROM cities;
SELECT * FROM cities WHERE postCode = 8800;
SELECT name FROM cities;
INSERT INTO cities VALUES ('Nagykanizsa', 8801);
SELECT * FROM cities WHERE name = 'Nagykanizsa';