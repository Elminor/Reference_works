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
    student_rating INT,
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
(1,3,'TodoDB sql', '2022-09-06', 'Alex','Smart girl'),
(2,5,'TodoDB sql', '2022-09-06', 'Alex','Smart girl'),
(3,5,'TodoDB sql', '2022-09-06', 'Alex','Smart girl'),
(4,5,'TodoDB sql', '2022-09-06', 'Alex','Smart girl'),
(5,2,'TodoDB sql', '2022-09-06', 'Alex','Smart girl');






SELECT * FROM courses;
SELECT * FROM students; 
SELECT * FROM project;
SELECT * FROM report;
SELECT * FROM project_types;