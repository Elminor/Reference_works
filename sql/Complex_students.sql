CREATE TABLE students(
    id SERIAL2 PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(150),
    course_id INT2,
    FOREIGN KEY (course_id) REFERENCES Courses(id)
);

CREATE TABLE Courses(
    id SERIAL2 PRIMARY KEY,
    course_name VARCHAR (50),
    start_date DATE
);

INSERT INTO Courses (Course_name, start_date) VALUES ('Bartender', now()), ('Fröccsöntő', now());

SELECT * FROM students;
SELECT * FROM Courses;

INSERT INTO students (name, address, course_id) VALUES ('Gráczol Dávid', 'Mosonmagyaróvár', 1), ('Zámbó Jimmy', 'Sohaland', 2), ('Heng Ede', 'Akasztó', 2), ('Mek Elek', 'Kecskemét', 1);

SELECT name, address, course_name FROM students INNER JOIN Courses ON students.course_id = courses.id;

UPDATE students SET course_id = 2 WHERE NAME = 'Gráczol Dávid'