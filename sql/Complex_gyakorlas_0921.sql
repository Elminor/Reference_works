DROP TABLE IF EXISTS partners CASCADE;
DROP TABLE IF EXISTS deliveries CASCADE;
DROP TABLE IF EXISTS juices CASCADE;

CREATE TABLE partners(
    id INT PRIMARY KEY,
    name VARCHAR(60),
    city VARCHAR(30)
);

CREATE TABLE deliveries(
    id INT PRIMARY KEY,
    juice_id INT,
    partner_id INT,
    date DATE,
    quantity INT
);

CREATE TABLE juices(
    id INT PRIMARY KEY,
    name VARCHAR(60)
);

ALTER TABLE deliveries 
ADD CONSTRAINT FK_partner_id
FOREIGN KEY (partner_id)
REFERENCES partners(id);

ALTER TABLE deliveries 
ADD CONSTRAINT FK_juice_id
FOREIGN KEY (juice_id)
REFERENCES juices(id);

INSERT INTO juices(
    id,
    name
)
VALUES 
(1, 'strawberry'),
(2, 'tomato'),
(3, 'apple'),
(4, 'pear'),
(5, 'peach'),
(6, 'banana'),
(7, 'cherry');

SELECT * FROM juices;

INSERT INTO partners (id, name, city) VALUES 
  (1, 'Kimberly Lam', 'Gyongyos'),
  (2, 'Robert Robbins', 'Balatonfured'),
  (3, 'Somogyi Bea', 'Szeged'),
  (4, 'Danial Fountain', 'Veszprem'),
  (5, 'Deak Dorina', 'Paszto'),
  (6, 'Gulyas Erika', 'Szekszard'),
  (7, 'Vincze Terezia', 'Sirok'),
  (8, 'Torok Gergo', 'Tata'),
  (9, 'Gulyas Erika', 'Eger'),
  (10, 'Pataki Roland', 'Esztergom'),
  (11, 'Farkas Kornel', 'Eger'),
  (12, 'Kerekes Klaudia', 'Budapest'),
  (13, 'Molnar Gizella', 'Papa'),
  (14, 'Sandor Gergely', 'Tihany'),
  (15, 'Nemeth Evelin', 'Eger'),
  (16, 'Vincze Ferenc', 'Nagykanizsa'),
  (17, 'Balog Lilla', 'Eger'),
  (18, 'Balogh Ildi', 'Szekesfehervar'),
  (19, 'Szekeres Barnabas', 'Gyula'),
  (20, 'Horvath Brigitta', 'Eger'),
  (21, 'Kiraly Zoltan', 'Eger'),
  (22, 'Gaspar Brigitta', 'Soporon'),
  (23, 'Toth Tunde', 'Sarospatak'),
  (24, 'Varga Brigitta', 'Szilvasvarad'),
  (25, 'Lengyel Gergo', 'Pecs'),
  (26, 'Pal Pal', 'Bekescsaba'),
  (27, 'Varga Gyorgy', 'Vac'),
  (28, 'Pasztor Vilmos', 'Jaszbereny'),
  (29, 'Fazekas Richard', 'Hodmezovasarhely'),
  (30, 'Sipos Lorant', 'Budapest'),
  (31, 'Pinter Csilla', 'Ozd'),
  (32, 'Vegh Piroska', 'Gyor'),
  (33, 'Deak Szabolcs', 'Debrecen'),
  (34, 'Meszaros Aniko', 'Miskolc'),
  (35, 'Szilagyi Edit', 'Szolnok'),
  (36, 'Antal Mariann', 'Kecskemet'),
  (37, 'Veres Dorina', 'Hatvan'),
  (38, 'Szalai Viktoria', 'Nyiregyhaza'),
  (39, 'Hegedus Richard', 'Eger'),
  (40, 'Puskas Klaudia', 'Kaposvar'),
  (41, 'Vegh Roza', 'Holloko'),
  (42, 'Farago Martin', 'Egerszalok'),
  (43, 'Barna Erika', 'Szombathely'),
  (44, 'Olah Brigitta', 'Siofok');

  INSERT INTO deliveries (id, juice_id, partner_id, date, quantity) VALUES 
  (1, 3, 33, '2016-01-11', 6),
  (2, 6, 2, '2016-01-11', 4),
  (3, 6, 23, '2016-01-12', 11),
  (4, 4, 6, '2016-01-12', 8),
  (5, 6, 30, '2016-01-13', 9),
  (6, 5, 4, '2016-01-13', 2),
  (7, 4, 4, '2016-01-14', 10),
  (8, 6, 3, '2016-01-14', 7),
  (9, 4, 18, '2016-01-14', 14),
  (10, 5, 17, '2016-01-14', 15),
  (11, 2, 14, '2016-01-18', 7),
  (12, 5, 26, '2016-01-18', 4),
  (13, 3, 30, '2016-01-18', 15),
  (14, 5, 36, '2016-01-18', 6),
  (15, 4, 7, '2016-01-18', 3),
  (16, 3, 31, '2016-01-18', 3),
  (17, 4, 7, '2016-01-18', 13),
  (18, 5, 14, '2016-01-18', 10),
  (19, 5, 40, '2016-01-18', 3),
  (20, 1, 34, '2016-01-18', 3),
  (21, 6, 38, '2016-01-19', 2),
  (22, 2, 5, '2016-01-19', 11),
  (23, 7, 11, '2016-01-19', 12),
  (24, 2, 42, '2016-01-19', 15),
  (25, 4, 23, '2016-01-19', 16),
  (26, 6, 31, '2016-01-19', 9),
  (27, 1, 22, '2016-01-19', 9),
  (28, 4, 20, '2016-01-19', 6),
  (29, 4, 23, '2016-01-20', 6),
  (30, 1, 17, '2016-01-20', 14),
  (31, 5, 4, '2016-01-21', 4),
  (32, 5, 36, '2016-01-21', 5),
  (33, 4, 26, '2016-01-22', 2),
  (34, 4, 3, '2016-01-22', 11),
  (35, 4, 7, '2016-01-22', 14),
  (36, 3, 44, '2016-01-22', 10),
  (37, 2, 22, '2016-01-22', 5),
  (38, 6, 5, '2016-01-22', 15),
  (39, 6, 3, '2016-01-25', 4),
  (40, 6, 26, '2016-01-25', 7),
  (41, 4, 9, '2016-01-26', 8),
  (42, 3, 28, '2016-01-26', 5),
  (43, 2, 1, '2016-01-27', 15),
  (44, 4, 3, '2016-01-27', 2),
  (45, 3, 16, '2016-01-28', 5),
  (46, 2, 43, '2016-01-28', 16),
  (47, 5, 7, '2016-01-28', 5),
  (48, 7, 32, '2016-01-28', 3),
  (49, 4, 21, '2016-01-28', 2),
  (50, 5, 24, '2016-01-28', 8);

  SELECT * FROM juices;
  SELECT * FROM deliveries;
  SELECT * FROM partners;

  SELECT DISTINCT city FROM partners ORDER BY city ASC;
  SELECT city FROM partners GROUP BY city ORDER BY city ASC;

SELECT deliveries.partner_id, juices.name FROM deliveries
INNER JOIN juices ON deliveries.juice_id = juices.id 
WHERE deliveries.partner_id = 1;

SELECT deliveries.partner_id, juices.name FROM deliveries
INNER JOIN juices ON deliveries.juice_id = juices.id 
ORDER BY deliveries.partner_id ASC
LIMIT 1;

SELECT partners.city, COUNT(deliveries.partner_id) AS delivery_count
FROM partners
INNER JOIN deliveries
ON partners.id = deliveries.partner_id
WHERE partners.city = 'Gyor'
GROUP BY partners.city;

SELECT partners.city FROM partners
GROUP BY city
HAVING COUNT(city)>1;

SELECT partners.name, city FROM partners
WHERE city = 'Budapest' OR city = 'Eger';

SELECT juices.name, SUM(deliveries.quantity) AS total
FROM juices
INNER JOIN deliveries
ON juices.id = deliveries.juice_id
WHERE juices.name='strawberry'
GROUP BY juices.name;

SELECT juices.name, COUNT(deliveries.id) AS most_ordered
FROM juices
INNER JOIN deliveries
ON juices.id = deliveries.juice_id
GROUP BY juices.name
ORDER BY COUNT(deliveries.id) ASC
LIMIT 3;

SELECT juices.name, SUM(deliveries.quantity) AS top_selling
FROM juices
INNER JOIN deliveries
ON juices.id = deliveries.juice_id
GROUP BY juices.name
ORDER BY SUM(deliveries.quantity) DESC
LIMIT 5;


SELECT juices.name, SUM(deliveries.quantity) AS top_selling
FROM juices
INNER JOIN deliveries
ON juices.id = deliveries.juice_id
WHERE deliveries.date BETWEEN '2016-01-01' AND '2016-01-31'
GROUP BY juices.name
ORDER BY SUM(deliveries.quantity) DESC
LIMIT 5;