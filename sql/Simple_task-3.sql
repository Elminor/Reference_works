INSERT INTO "user"(name) VALUES ('Jane'), ('John'), ('Dave'), ('Emma'), ('Robert');
SELECT * FROM "user";

INSERT INTO todo(task, user_id) 
VALUES ('Setup pgAdmin', 2), ('Download Git', 2), ('Setup VS Code', 1), ('Download  PostgreSQL ', 2), ('Install server ', 2),
('Create superuser', 2), ('Create database', 2), ('Create tables', 2), ('Wash the dishes', 3), ('Read the PostgreSQL manual', 4),
('Exercise', 3), ('Wake up in time!', 5), ('Go to the gym', 3), ('Wash the dishes', 5);
SELECT * FROM todo;

UPDATE todo SET done = true WHERE todo.id IN(3, 12, 14);
SELECT * FROM todo ORDER BY todo.id ASC;