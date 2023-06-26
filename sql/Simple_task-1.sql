DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS todo;

CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE todo(
    id SERIAL PRIMARY KEY,
    task VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);


SELECT * FROM "user";
SELECT * FROM todo;
