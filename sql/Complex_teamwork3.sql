DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS project CASCADE;
DROP TABLE IF EXISTS report CASCADE;
DROP TABLE IF EXISTS project_types CASCADE;

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR (120)
    
);

CREATE TABLE project_types (
    id SERIAL PRIMARY KEY,
    project_type VARCHAR (50)
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    student_name VARCHAR (50),
    nick_name VARCHAR (50),
    join_date DATE,
    address VARCHAR (50),
    hobby VARCHAR (50),
    email_address VARCHAR (50),
    course_id  INT,
    FOREIGN KEY (course_id) REFERENCES courses(id)

);


CREATE TABLE project(
    id SERIAL PRIMARY KEY,
    project_name VARCHAR (120),
    description VARCHAR (120),
    tasks VARCHAR (120),
    links VARCHAR (120),
    project_types INT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (project_types) REFERENCES project_types(id)
);


CREATE TABLE report (
    id SERIAL PRIMARY KEY,
    student_id INT,
    student_rating REAL,
    project_name VARCHAR (120),
    ratings_date DATE,
    inspector_name VARCHAR (20) ,
    thoughts VARCHAR (20),
    FOREIGN KEY (student_id) REFERENCES students(id)
);


INSERT INTO courses (course_name) VALUES ('software tester'),('front end developer '),('back end developer'),('sys admin');


INSERT INTO students (student_name, nick_name, join_date, address, hobby, email_address,course_id) VALUES 
('Kokai Dorina', 'Dorina','2022-07-25','Csongrad','Bilibori','dorina@mail.com',1),
('Toth Csaba','Csabi','2022-07-25','Bp','Samurai kard vivas','csaba@mail.com',1),
('Ermilov Alex','Alex','2022-07-25','Szeged','Zsonglorkodes','alex@gmail.com',1),
('Liszi Balint', 'Balint', '2022-07-25','Veszprem', 'videogames','liszi.balint@gmial.com',1),
('Ferencz Laszlo', 'Laci','2022-07-25', 'Bp','Drumming' , 'laci@mail.com',1);

INSERT INTO project_types (project_type) VALUES 
('exercise'),('tutorial'),('individual'),('team');

INSERT INTO project (project_name,description,tasks,links,project_types,course_id) VALUES
('Gitting around','Familiarizing yourself with git','Initialize exercises','https://www.atlassian.com/git/tutorials ',1,1),
('Introduction to SQL','Familiarizing yourself with sql','Read it','https://sqlbolt.com/ ',2,1),
('Setup PostgreSQL','Create a table with data','Create,edit,join tables','shorturl.at/jPZ13',1,1),
('Codewars - 7 kyu in SQL','Reach 7 kyu in SQL','Practice sql','shorturl.at/dfhlN',3,1),
('TodoDB sql','Create Database','Create a database and connect to it','shorturl.at/clos8',3,1),
('Northwind Traders','List products and their suppliers','Shows which product is made by whom','shorturl.at/gioU2',4,1);


INSERT INTO report (student_id,student_rating, project_name,ratings_date,inspector_name,thoughts ) VALUES
(1,0.9,'TodoDB sql','2022-09-06','Alex','Love sql'),
(2,0.8,'Gitting around','2022-09-04','Laci','Clever and fast'),
(3,0.7,'Codewars - 7 kyu in SQL','2022-09-03','Balint','Excellent'),
(4,0.4,'Introduction to SQL','2022-09-01','Dorina','Nice job'),
(5,0.6,'Introduction to SQL','2022-09-01','Csaba','Stupid'),
(1,0.3,'Introduction to SQL','2022-09-03','Alex','Smart Girl'),
(2,0.2,'Codewars - 7 kyu in SQL','2022-09-01','Laci','Clever and fast'),
(3,0.4,'Gitting around','2022-09-02','Balint','Excellent'),
(4,0.9,'TodoDB sql','2022-09-04','Dorina','Nice job'),
(5,0.3,'TodoDB sql','2022-09-03','Csaba','Stupid');





--4--
UPDATE report SET student_rating = 1 FROM students
WHERE  students.id=report.student_id AND students.student_name= 'Toth Csaba' ;

DELETE FROM report USING students WHERE students.id=report.student_id AND students.student_name= 'Toth Csaba' ;

INSERT INTO report (student_id,student_rating, project_name,ratings_date,inspector_name,thoughts ) VALUES
(2,5,'Gitting around','2022-09-04','Laci','Clever and fast');

UPDATE report SET student_rating = null FROM students
WHERE  students.id=report.student_id AND students.student_name= 'Toth Csaba' ;


INSERT INTO project (project_name,description,tasks,links,project_types,course_id) VALUES
('java','try to coding','write a script in java','java.com',3,2),
('java script','introducing java script','try to debug','javascript.com',1,3),
('networks','introducing networks','join a network','network.com',2,4);


--5a-- A tananyag kilistázása kurzusonként--
SELECT project.project_name,courses.course_name FROM project
JOIN courses ON project.course_id = courses.id;

--5b-- Az egyes projektek megjelenítése azok minden elemével együtt--

SELECT project.project_name,project.description,project.tasks,project.links,project.project_types,project_types.project_type,project.course_id
FROM project
JOIN project_types ON project.project_types = project_types.id;

--5c-- A diákok alapadatainak listája kurzusonként --

SELECT students.*,courses.course_name FROM students 
JOIN courses ON students.course_id = courses.id
ORDER BY student_name asc;

--5d-- A diákok projektenkénti teljesítései az elért eredményeik alapján az értékelés minden részletével együtt--


SELECT  students.student_name ,report.* FROM students
JOIN report ON students.id = report.student_id 
ORDER BY student_name asc;
 

--5e-- Összesített eredmény a diákok teljesítéseiről. A lekérdezés számoljon átlagot az elért pontszámokból 
--és ha a diák 60% felett teljesített, kapjon “haladó” minősítést, ha alatta, legyen “megfontolva haladó”.--

SELECT  students.student_name , round(avg(student_rating)::numeric,2)  AS Avarage, 'haladó' WHERE
avg(student_rating) > 0.6 
FROM report 
JOIN students ON students.id = report.student_id 
GROUP BY student_name;

SELECT  students.student_name , round(avg(student_rating)::numeric,2)  AS Avarage, CASE WHEN avg(student_rating) > 0.6
THEN 'haladó' ELSE 'megfontolva haladó' 
END AS minosites
FROM report 
JOIN students ON students.id = report.student_id 
GROUP BY student_name;





--5f--A 3 legjobban teljesítő diák listája az összesített (nem átlag) pontszámaik alapján. --

SELECT sum(student_rating),student_name  AS best  FROM report 
JOIN students ON students.id = student_id 
GROUP BY student_name ORDER BY sum(student_rating) DESC LIMIT 3;

 







SELECT * FROM courses;
SELECT * FROM students; 
SELECT * FROM project;
SELECT * FROM report;
SELECT * FROM project_types;

 


